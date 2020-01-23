# Sveltex

**TODO: Add description**

## Installation

This library works well with Phoenix 1.4.12
The difference between previous 1.4. version is replacing uglify with terser library.

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sveltex` to your list of dependencies in `mix.exs`:

1. install Sveltex

Add the dependency into your `mix.exs`

```elixir
    def deps do
      [
        {:sveltex, git: "https://github.com/virkillz/sveltex.git", tag: "0.1.0"}
      ]
    end`

```

then run `mix deps.get`

2. install Svelte in your node dependency (from your `/assets`)

`npm install svelte svelte-loader --save`

4. Configure your webpack.

Add resolve:

```

  module.exports = (env, options) => ({

  resolve: {
    alias: {
      svelte: path.resolve(‘node_modules’, ‘svelte’)
    },
    extensions: ['.mjs', '.js', '.svelte'],
    mainFields: ['svelte', 'browser', 'module', 'main'],
    modules: ['node_modules']
  },
```

Add 2 new rules under `module`

```

    module: {
      rules: [
        {
          test: /\.mjs$/,
          include: /node_modules/,
          type: 'javascript/auto',
        },
        {
          test: /\.(html|svelte)$/,
          exclude: /node_modules/,
          use: {
            loader: 'svelte-loader',
            options: {
              hotReload: true
            }
          }
        }
      ]
    }
  });


```

5. Add this into your `/assets/js/app.js` file.

`import "../../deps/sveltex/sveltex.js";`

6. Go to `lib/your_project_name_web.ex` and add this line right before `end` in `view` function.

```
import Sveltex
```

## How to use

Put your `.svelte` files under `/assets/js/svelte`.

for example: `test.svelte`

```
<script>
    export let name;
 </script>

<h1>Hey {name}, Phoenix and Svelte setup is working!</h1>
```

Then anywhere in your view template you can use
`<%= sveltex "test", %{name: "virkillz"}>`

```elixir
def deps do
  [
    {:sveltex, git: "https://github.com/virkillz/sveltex.git", tag: "0.1.0"}
    ## {:sveltex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sveltex](https://hexdocs.pm/sveltex).
