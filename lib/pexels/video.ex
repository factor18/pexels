defmodule Pexels.Video do
  @moduledoc ~S"""
      %Pexels.Video {
        duration: 19,
        height: 1080,
        id: 1358988,
        image: "https://images.pexels.com/videos/1358988/free-video-1358988.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200",
        url: "https://www.pexels.com/video/cat-playing-with-tape-1358988/",
        user: %Pexels.Video.User {
          id: 2421,
          name: "Rene Asmussen",
          url: "https://www.pexels.com/@reneasmussen"
        },
        video_files: [
          %Pexels.Video.File {
            file_type: "video/mp4",
            height: 540,
            id: 54545,
            link: "https://player.vimeo.com/external/286612246.sd.mp4?s=a6a14a6a7e585d3d62454ab4501bae8a26727125&profile_id=165&oauth2_token_id=57447761",
            quality: "sd",
            width: 960
          }
        ],
        video_pictures: [
          %Pexels.Video.Picture {
            id: 120634,
            nr: 0,
            picture: "https://images.pexels.com/videos/1358988/pictures/preview-0.jpg"
          }
        ],
        width: 1920
      }
  """
  alias Pexels.Video.{User, File, Picture}
  
  use Accessible

  use Construct do
    field :id, :integer
    field :width, :integer
    field :height, :integer
    field :url, :string
    field :image, :string
    field :duration, :integer
    field :user, User
    field :video_files, {:array, File}
    field :video_pictures, {:array, Picture}
  end
end
