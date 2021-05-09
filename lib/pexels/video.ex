defmodule Pexels.Video do
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
