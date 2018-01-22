defmodule Elredis.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elredis,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Elredis, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:eredis, git: "https://github.com/GameAnalytics/eredis.git", tag: "v1.1.0", manager: :rebar},
      {:pooler, git: "https://github.com/seth/pooler.git", tag: "1.5.2", manager: :rebar, runtime: :false}
    ]
  end
end
