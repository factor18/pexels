defmodule Pexels.Photo.Source do
  @moduledoc ~S"""
      %Pexels.Photo.Source {
        landscape: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
        large: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
        large2x: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        medium: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=350",
        original: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg",
        portrait: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
        small: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=130",
        tiny: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
      }
  """
  use Accessible

  use Construct do
    field :original, :string
    field :large2x, :string
    field :large, :string
    field :medium, :string
    field :small, :string
    field :portrait, :string
    field :landscape, :string
    field :tiny, :string
  end
end
