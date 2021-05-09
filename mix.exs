defmodule Pexels.MixProject do
  use Mix.Project

  def project do
    [
      app: :f18_pexels,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:tesla, "~> 1.4"},
      {:jason, "~> 1.2"},
      {:hackney, "~> 1.17"},
      {:construct, "~> 2.1"},
      {:accessible, "~> 0.3.0"}
    ]
  end
end
