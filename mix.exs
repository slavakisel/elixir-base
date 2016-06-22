defmodule ElixirBase.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_base,
     version: "0.0.1",
     elixir: "~> 1.3",
     name: "Elixir Base",
     homepage_url: "https://github.com/fs/elixir-base",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     docs: [extras: ["README.md"], output: "./doc/app"],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger], mod: {ElixirBase, []},
     elixirc_paths: elixirc_paths(Mix.env)]
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
     {:erlexec, "~> 1.2.1"},
     {:exrm, "~> 1.0.5"},
     {:guardsafe, "~> 0.5.0"},
     {:monadex, "~> 1.0.2"},
     {:timex, "~> 2.1.6"},
     {:credo, "~> 0.4", only: [:dev, :test]},
     {:dialyxir, "~> 0.3", only: :dev},
     {:eper, "~> 0.94.0", only: :dev},
     {:ex_machina, "~> 0.6.1", only: [:dev, :test]},
     {:ex_doc, "~> 0.11", only: :dev},
     {:observer_cli, "~> 1.0.5", only: :dev},
     {:faker, "~> 0.5", only: :test},
     {:mock, "~> 0.1.1", only: :test}
   ]
  end
end
