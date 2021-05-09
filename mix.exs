defmodule Pexels.MixProject do
  use Mix.Project

  def project do
    [
      app: :pexels,
      deps: deps(),
      docs: docs(),
      name: "Pexels",
      version: "0.1.0",
      elixir: "~> 1.7",
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.github": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/factor18/pexels",
      homepage_url: "https://github.com/factor18/pexels",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      main: "Pexels",
      extras: [{:"README.md", [title: "Overview"]}],
      groups_for_modules: [
        "Client Filters": [
          Pexels.Client.Size,
          Pexels.Client.Limit,
          Pexels.Client.Locale,
          Pexels.Client.Orientation,
          Pexels.Client.CollectionType
        ],
        "Photo interfaces": [
          Pexels.Client.Photo.CuratedPhotosRequest,
          Pexels.Client.Photo.PhotoRequest,
          Pexels.Client.Photo.PhotoResponse,
          Pexels.Client.Photo.PhotoSearchRequest,
          Pexels.Client.Photo.PhotosResponse
        ],
        "Video interfaces": [
          Pexels.Client.Video.VideoRequest,
          Pexels.Client.Video.VideosResponse,
          Pexels.Client.Video.VideoSearchRequest,
          Pexels.Client.Video.PopularVideosRequest,
        ],
        "Collection interfaces": [
          Pexels.Client.Collection.CollectionMediaRequest,
          Pexels.Client.Collection.CollectionMediaResponse,
          Pexels.Client.Collection.CollectionsRequest,
          Pexels.Client.Collection.CollectionsResponse,
        ]
      ]
    ]
  end
  

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/factor18/pexels.ex"},
      maintainers: ["sarat1669"]
    ]
  end

  defp description() do
    "Elixir client for Pexels"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:jason, "~> 1.2"},
      {:hackney, "~> 1.17"},
      {:construct, "~> 2.1"},
      {:accessible, "~> 0.3.0"},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
    ]
  end
end
