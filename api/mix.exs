defmodule API.MixProject do
  use Mix.Project

  def project do
    [
      app: :api,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {API.Application, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.6.3"},
      {:jason, "~> 1.1.2"},
      {:plug, "~> 1.8.0"},
      {:plug_cowboy, "~> 2.0.2"},
      {:todo, path: "../todo"}
    ]
  end
end
