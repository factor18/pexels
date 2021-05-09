defmodule Pexels.Client.Video.PopularVideosRequest do
  use Accessible

  alias Pexels.Client.Limit

  use Construct do
    field :min_width, :integer, default: nil
    field :min_height, :integer, default: nil
    field :min_duration, :integer, default: nil
    field :max_duration, :integer, default: nil
    field :page, :integer, default: 1
    field :per_page, Limit, default: 15
  end
end
