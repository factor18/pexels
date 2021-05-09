defmodule Pexels.Client.Photo.PhotoSearchRequest do
  use Accessible

  alias Pexels.Color
  alias Pexels.Client.{Size, Locale, Orientation, Limit}

  use Construct do
    field :query, :string
    field :orientation, Orientation, default: nil
    field :size, Size, default: nil
    field :locale, Locale, default: nil
    field :color, Color, default: nil
    field :page, :integer, default: 1
    field :per_page, Limit, default: 15
  end
end
