import <[
    livescript
    livescript/lib/lexer
    livescript-compiler/lib/livescript/Compiler
    ./plugin
]>

livescript.lexer = lexer
compiler = Compiler.create { livescript }
plugin.install compiler
compiler.install!