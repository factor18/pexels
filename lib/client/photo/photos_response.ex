defmodule Pexels.Client.Photo.PhotosResponse do
  alias Pexels.Photo

  use Accessible

  use Construct do
    field :photos, {:array, Photo}
    field :page, :integer
    field :per_page, :integer
    field :total_results, :integer
    field :prev_page , :string, default: nil
    field :next_page , :string, default: nil
  end
end
