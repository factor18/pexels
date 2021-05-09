defmodule Pexels.Client.Photo.PhotoResponse do
  alias Pexels.Photo
  
  use Accessible

  use Construct do
    field :photo, Photo
    field :liked, :boolean
  end
end
