defmodule Pexels.Video.File do
  @moduledoc ~S"""
      %Pexels.Video.File {
        file_type: "video/mp4",
        height: 1080,
        id: 54546,
        link: "https://player.vimeo.com/external/286612246.hd.mp4?s=7464592b73c489f231d7eb741c36b44515b35f6f&profile_id=175&oauth2_token_id=57447761",
        quality: "hd",
        width: 1920
      }
  """
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
