# Sveltex

Building web using Phoenix is fun.
Creating component using Svelte is fun.

Imagine we can just create svelte component, save it as `wizard.svelte` inside our `/assets/js/svelte` and anytime we need it inside out layout, just call it like so:

`<%= sveltex "name_of_component", %{props_as_map: ""} %>`

Sveltex does exactly this.

## Installation

This library works well with Phoenix 1.4.12
The difference between previous 1.4. version is replacing `uglify` with `terser`.

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sveltex` to your list of dependencies in `mix.exs`:

1. Install `Sveltex`

   Add the dependency into your `mix.exs`

   ```elixir
       def deps do
         [
           {:sveltex, git: "https://github.com/virkillz/sveltex.git", tag: "0.1.1"}
         ]
       end`

   ```

   then run `mix deps.get`

2. Install Svelte and Svelte loader in your node dependency

   `cd assets && npm install svelte svelte-loader --save`

3. Configure your webpack.

   Add resolve:

   ```javascript

     module.exports = (env, options) => ({

     resolve: {
       alias: {
         svelte: path.resolve('node_modules', 'svelte')
       },
       extensions: ['.mjs', '.js', '.svelte'],
       mainFields: ['svelte', 'browser', 'module', 'main'],
       modules: ['node_modules']
     },
   ```

   Add 2 new rules under `module rules`

   ```javascript

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


    ```

5. Add this into your `app.js` (`/assets/js/app.js` file).

   `import "../../deps/sveltex/assets/sveltex.js";`

6. Go to `lib/[your_project_name]_web.ex` and add this line below `use Phoenix.HTML` in `view` function.

   ```elixir
   import Sveltex
   ```

## How to use

Put your `.svelte` files under `/assets/js/svelte`.

for example: `test.svelte`

```html
<script>
  export let name;
</script>

<h1>Hey {name}, Phoenix and Svelte setup is working!</h1>
```

Then anywhere in your view template you can use

```elixir
<%= sveltex "test", %{name: "virkillz"}>
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sveltex](https://hexdocs.pm/sveltex).
