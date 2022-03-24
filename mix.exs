defmodule PhoenixRoutesJs.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_routes_js,
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package()]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    PhoenixRoutesJs generates javascript object that keeps all named routes defined in Phoenix as javascript functions.
    """
  end

  defp package do
    [
      name: :phoenix_routes_js,
      files: ~w{lib} ++ ~w{mix.exs README.md},
      maintainers: ["Marat Khusnetdinov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/khusnetdinov/phoenix_routes_js"}
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:phoenix_html, "~> 3.2"},
      {:plug, "~> 1.13"}
    ]
  end
end
