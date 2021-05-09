defmodule Pexels.Client.Collection.CollectionMediaRequest do
  alias Pexels.Client.{Limit, CollectionType}
  use Accessible

  use Construct do
    field :id, :string
    field :type, CollectionType, default: nil
    field :page, :integer, default: 1
    field :per_page, Limit, default: 15
  end
end
