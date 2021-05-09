defmodule Pexels.Client.Photo.PhotoRequest do
  use Accessible

  use Construct do
    field :id, :integer
  end
end
