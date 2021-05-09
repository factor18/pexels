use Mix.Config

config :pexels,
  base: "https://api.pexels.com/",
  timeout: 5_000,
  token: System.get_env("PEXELS_API_SECRET_TOKEN")
