# Pexels
![CI Status](https://github.com/factor18/pexels/actions/workflows/elixir.yml/badge.svg)

Elixir client forg [Pexels](https://www.pexels.com)

## Installation

The package can be installed by adding `pexels` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    ...
    {:pexels, "~> 0.1.0"}
  ]
end
```

## Usage

Retrieve your access token from [https://www.pexels.com/api/](https://www.pexels.com/api/)

Provide the access token in your application configuration

```elixir
config :pexels,
  token: "<TOKEN>"
```

Or it can be provided in the runtime like:

```elixir
  iex> client = Pexels.client("<TOKEN>")
  iex> {:ok, %{liked: _liked, photo: photo}} = Pexels.photo(client, %{id: 156934})
  iex> photo.url
  "https://www.pexels.com/photo/white-and-black-cat-156934/"
```

Docs can be found at [https://hexdocs.pm/pexels](https://hexdocs.pm/pexels).

## License

MIT
