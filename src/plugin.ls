require! <[ livescript-ast-transform ]>

is-async-function = (function-node) ->
    # check for explicit async == true
    if function-node.async
        true
    else
        result = null
        is-await = (child, parent, name, index) ->
            # there is no separate node for Await so we are checking for
            # property 'op' equal to 'await'
            if child.op == 'await'
                result := true
            # I'm guesing that returning here not null value will stop futher traversing
            result
        function-node.body.traverse-children is-await, false
        result ? false

# livescript-ast-transform gives us install and uninstall methods
# also throws error with more meaningfull message if we forget implement
# 'enable' and 'disable' methods
Plugin = Object.create livescript-ast-transform
    module.exports = ..

    ..name = 'transform-implicit-async'

    ..enable = !->
        ast = @livescript.ast
        Fun = ast.Fun
        @original-compile = original = Fun::compile
        Fun::compile = (...args) ->
            @async = is-async-function @
            original.apply @, args

    ..disable = !->
        @livescript.ast.Fun::compile = @original-compile
