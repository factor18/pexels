defmodule Pexels.Video.Picture do
  @moduledoc ~S"""
      %Pexels.Video.Picture {
        id: 120634,
        nr: 0,
        picture: "https://images.pexels.com/videos/1358988/pictures/preview-0.jpg"
      }
  """
  use Accessible

  use Construct do
    field :id, :integer
    field :picture, :string
    field :nr, :integer
  end
end
