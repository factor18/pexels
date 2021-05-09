defmodule Pexels.Client.Size do
  @behaviour Construct.Type

  @sizes ["large", "medium", "small"]

  @sizes |> Enum.each(fn (size) ->
    def unquote(:"#{size}")(), do: unquote(size)
  end)

  def cast(size) when size in @sizes do
    {:ok, size}
  end

  def cast(_), do: :error
end
