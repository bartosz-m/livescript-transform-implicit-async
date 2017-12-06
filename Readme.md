Transform plugin for [livescript](https://github.com/gkz/LiveScript)

Detects uses of await and automatically transforms function into async variant.

input
```livescript
foo = ->> \foo

bar = -> \bar

foo-bar = ->
    foo! + await bar!
  
```

output
```javascript
var foo, bar, fooBar;
foo = async function(){
  return 'foo';
};
bar = function(){
  return 'bar';
};
fooBar = async function(){
  return foo() + (await bar());
};
```


# Usage

Assuming you have file name app.ls

simple use  
```livescript
require! <[ livescript livescript-transform-implicit-async/register]>
foo = Promise.resolve \foo
bar = Promise.resolve \bar
foo-bar = -> "#{await foo} #{await bar}"
```

## CLI
Please stop using cli for any serious task, write scripts in **real** languages (there are so many to choose) e.g.  

    lsc serious-task.ls  
    node serious-task.js
    python serious-task.py

If you really must to use cli just add require plugin file to the command.  
But don't say I didn't warn you!

compiling

    lsc -cr livescript-transform-implicit-async/register app.ls


running

    node -r livescript-transform-implicit-async/register app.ls


# Atom integration

If you are using Atom editor you may be interested in my packages which provide realtime code preview supporting this plugin. 

* [livescript-ide-preview](https://atom.io/packages/livescript-ide-preview) - show transpiled code
* [atom-livescript-provider](https://atom.io/packages/atom-livescript-provider) - provides compilation service


![](https://github.com/bartosz-m/livescript-ide-preview/raw/master/doc/assets/screenshot-01.gif)


# Webpack loader

If you are using Webpack you can try my [loader](https://www.npmjs.com/package/livescript-plugin-loader) whith support for this and other plugins.


# License

[BSD-3-Clause](License.md)
