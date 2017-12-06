import
    \livescript-compiler/lib/livescript/Plugin    


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
            result
        function-node.body.traverse-children is-await, false
        result ? false


export default transform-implicit-async = ^^Plugin
transform-implicit-async <<<
    name: 'transform-implicit-async'

    enable: !->
        ast = @livescript.livescript.ast
        Fun = ast.Fun
        @original-compile = original = Fun::compile
        Fun::compile = (...args) ->
            @async = is-async-function @
            original.apply @, args