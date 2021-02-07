# Sveltex

Building web using Phoenix is fun.
Creating component using Svelte is fun.

Imagine we can just create svelte component, save it as `wizard.svelte` inside our `/assets/js/svelte` and anytime we need it inside out layout, just call it like so:

`<%= Sveltex.render "name_of_component", %{props_as_map: ""} %>`

Sveltex does exactly this.

## Install in 4 easy step.

This library works well with Phoenix 1.4.12
The difference between previous 1.4. version is replacing `uglify` with `terser`.

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sveltex` to your list of dependencies in `mix.exs`:

1. Install `Sveltex` as Elixir dependency.

   Add the dependency into your `mix.exs`

   ```elixir
       def deps do
         [
           {:sveltex, git: "https://github.com/virkillz/sveltex.git", tag: "1.1.2"}
         ]
       end`

   ```

   Then run: 
   
   ```
   mix deps.get
   ```

2. Install Svelte & Svelte Loader as Javascript dependency
  ```
   cd assets && npm install svelte svelte-loader --save
  ```

3. Edit your Webpack config file `/assets/webpack.config.js`

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

   And add 2 new rules under `module rules`

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

4. Import to your `app.js` (`/assets/js/app.js` file).

  ```javascript

   import "../../deps/sveltex/assets/sveltex.js";

  ```


## How to use ?

Put your svelte component files (`.svelte`) under `/assets/js/svelte` directory.

Example: `test.svelte`

```html
<script>
  export let name;
</script>

<h1>Hey {name}, Phoenix and Svelte setup is working!</h1>
```

Then anywhere in your view template you can use

```elixir
<%= Sveltex.render "test", %{name: "virkillz"}>
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sveltex](https://hexdocs.pm/sveltex).
