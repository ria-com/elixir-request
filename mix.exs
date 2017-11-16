defmodule Ria.Task.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ria_request,
      version: "0.1.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
    ]
  end

  def application do
    [extra_applications: [:httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.13.0"},
      {:poison, ">= 0.0.0"},
    ]
  end
end
