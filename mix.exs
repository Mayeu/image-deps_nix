defmodule Photo.MixProject do
  use Mix.Project

  def project do
    [
      app: :photo,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: [
        "deps.get": ["deps.get", "deps.nix --output deps.nix"],
        "deps.update": ["deps.update", "deps.nix  --output deps.nix"]
      ]
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
      {:deps_nix,
       git: "https://github.com/code-supply/deps_nix",
       ref: "d4cfd6049ef800f6fd482f6f422c05fef54133b4",
       only: :dev},
      {:image, "~> 0.56"}
    ]
  end
end
