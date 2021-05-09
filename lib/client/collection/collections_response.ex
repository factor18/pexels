defmodule Pexels.Client.Collection.CollectionsResponse do
  alias Pexels.Collection
  
  use Accessible

  use Construct do
    field :collections, {:array, Collection}
    field :page, :integer
    field :per_page, :integer
    field :total_results, :integer
    field :prev_page , :string, default: nil
    field :next_page , :string, default: nil
  end
end
