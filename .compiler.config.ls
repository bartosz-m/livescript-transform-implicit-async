export default config =
    plugins:
          * plugin: import \livescript-transform-esm/lib/plugin
            config: format: \cjs
          * plugin: import \livescript-transform-object-create
          ...
