defmodule Sveltex.MixProject do
  use Mix.Project

  def project do
    [
      app: :sveltex,
      version: "0.1.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Embed Svelte component easily into Phoenix App.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["virkillz"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/virkillz/sveltex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_html, "~> 2.13"},
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end
end
