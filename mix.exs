defmodule Sqlitex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sqlitex,
      version: "1.7.0",
      elixir: "~> 1.4",
      deps: deps(),
      package: package(),
      source_url: "https://github.com/elixir-sqlite/sqlitex",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.circle": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      description: """
      A thin Elixir wrapper around esqlite
      """,
      dialyzer: [plt_add_deps: :transitive],
      # The main page in the docs
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application
  def application do
    [extra_applications: [:logger]]
  end

  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:esqlite, github: "diodechain/esqlite", ref: "diode/stable"},
      {:decimal, "~> 1.7"},
      {:credo, "~> 0.10", only: [:dev, :test]},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.20", only: :docs, runtime: false},
      {:benchee, "~> 1.0", only: :dev},
      {:telemetry, "~> 1.0"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/elixir-sqlite/sqlitex",
        "docs" => "http://hexdocs.pm/sqlitex"
      }
    ]
  end
end
