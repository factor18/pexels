defmodule Pexels.Client.Photo.CuratedPhotosRequest do
  use Accessible

  alias Pexels.Client.Limit

  use Construct do
    field :page, :integer, default: 1
    field :per_page, Limit, default: 15
  end
end
