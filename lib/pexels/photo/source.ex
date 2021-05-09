defmodule Pexels.Photo.Source do
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
