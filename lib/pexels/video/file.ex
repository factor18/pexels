defmodule Pexels.Video.File do
  use Accessible

  alias Pexels.Video.Quality

  use Construct do
    field :id, :integer
    field :quality, Quality, default: nil
    field :file_type, :string
    field :width, :integer, default: nil
    field :height, :integer, default: nil
    field :link, :string
  end
end
