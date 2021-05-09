defmodule Pexels.Client.Video.VideosResponse do
  alias Pexels.Video

  use Accessible

  use Construct do
    field :videos, {:array, Video}
    field :url, :string
    field :page, :integer
    field :per_page, :integer
    field :total_results, :integer
    field :prev_page , :string, default: nil
    field :next_page , :string, default: nil
  end
end
