defmodule Shipping.MixProject do
  use Mix.Project

  def project do
    [
      app: :shipping,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_apps: [:flow]
      ],
      compile: [compile: "--warnings-as-errors"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Shipping.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.2", only: ~w[dev test]a, runtime: false},
      {:ex_doc, "~> 0.29", only: ~w[dev]a, runtime: false},
      {:flow, "~> 1.2", only: ~w[dev test]a, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
