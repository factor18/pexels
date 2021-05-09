defmodule Pexels.Client.CollectionType do
  @moduledoc ~S"""
  The type of media you are requesting.
  
  Supported values are `photos` and `videos`.

  ## Examples

      iex> Pexels.Client.CollectionType.photos()
      "photos"

  """
  @behaviour Construct.Type

  @collection_types ["videos", "photos"]

  @collection_types |> Enum.each(fn (collection_type) ->
    @doc """
    #{collection_type} collection

    ## Example

        iex> Pexels.Client.CollectionType.#{collection_type}()
        "#{collection_type}"
    """
    def unquote(:"#{collection_type}")(), do: unquote(collection_type)
  end)

  def cast(collection_type) when collection_type in @collection_types do
    {:ok, collection_type}
  end

  def cast(_), do: :error
end
