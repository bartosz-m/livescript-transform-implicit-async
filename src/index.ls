transformed = new WeakMap

find-use-of-await = (function-node) ->
    result = null
    # visitor
    is-await = (child, parent, name, index) ->
        # there is no separate node for Await so simples check looks for
        # property op eqaul to 'await'
        if child.op == 'await'
            result := true
        result
    function-node.body.traverse-children is-await, false
    result

exports.modify-ast = (ast) ->
    ast.[]plugins.push 'transform-implicit-async'
    Fun = ast.Fun
    original = Fun::compile
    Fun::compile = (...args) ->
        unless @async
            have-await = find-use-of-await @
            if have-await
                @async = true
        original.apply @, args
    ast

exports.install = (ls) ->
    try
        console.log 'installing plugin'
        unless ls
            throw "Missing Livescript Compiler"
        @modify-ast ls.ast
    catch
        # TODO only catch excepyions indicating that there is no livescript-async
        # module installed
        throw e
