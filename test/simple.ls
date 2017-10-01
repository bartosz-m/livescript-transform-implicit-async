require! <[ assert ]>

foo = Promise.resolve \foo
bar = Promise.resolve \bar
foo-bar = -> "#{await foo} #{await bar}"

do ->>
    x = await foo-bar!
    assert x == 'foo bar'
