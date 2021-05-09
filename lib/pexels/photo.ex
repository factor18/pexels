defmodule Pexels.Photo do
  alias Pexels.Color
  alias Pexels.Photo.Source
  
  use Accessible

  use Construct do
    field :id, :integer
    field :width, :integer
    field :height, :integer
    field :url, :string
    field :photographer, :string
    field :photographer_url, :string
    field :photographer_id, :integer
    field :avg_color, Color
    field :src, Source
  end
end
