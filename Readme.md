Transform plugin for [livescript](https://github.com/gkz/LiveScript)

Detects uses of await and automatically transform function into async variant.

This isn't real plugin because livescript doesn't have support for it. It's more like a hack thats is mutating AST generated by livescript.

# Usage
Assuming you have file name app.ls

simple use  
```livescript
require! <[ livescript livescript-transform-implicit-async]>
foo = Promise.resolve \foo
bar = Promise.resolve \bar
foo-bar = -> "#{await foo} #{await bar}"
```

installing inside custom livescript implementation
```livescript
require! <[ livescript livescript-transform-implicit-async/plugin]>
plugin.install livescript
livescript.compile source-code
```

## CLI
Please stop using cli for any serious task, write scripts in **real** languages (there are so many to choose) e.g.  

    lsc serious-task.ls  
    node serious-task.js
    python serious-task.py

If you really must to use cli just add require plugin file to the command.  
But don't say I didn't warn you!

compiling

    lsc -cr livescript-transform-implicit-async app.ls


running

    lsc -r livescript-transform-implicit-async app.ls


# License
[BSD-3-Clause](License.md)
