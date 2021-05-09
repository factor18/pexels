defmodule Pexels.Client.CollectionType do
  @behaviour Construct.Type

  @collection_types ["videos", "photos"]

  @collection_types |> Enum.each(fn (collection_type) ->
    def unquote(:"#{collection_type}")(), do: unquote(collection_type)
  end)

  def cast(collection_type) when collection_type in @collection_types do
    {:ok, collection_type}
  end

  def cast(_), do: :error
end
