defmodule Pexels.Client.Collection.CollectionMediaResponse do
  alias Pexels.Client.Media
  
  use Accessible

  use Construct do
    field :id, :string
    field :media, {:array, Media}
    field :page, :integer
    field :per_page, :integer
    field :total_results, :integer
    field :prev_page , :string, default: nil
    field :next_page , :string, default: nil
  end
end
