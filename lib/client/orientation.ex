defmodule Pexels.Client.Orientation do
  @behaviour Construct.Type

  @orientations ["landscape", "portrait", "square"]

  @orientations |> Enum.each(fn (orientation) ->
    def unquote(:"#{orientation}")(), do: unquote(orientation)
  end)

  def cast(orientation) when orientation in @orientations do
    {:ok, orientation}
  end

  def cast(_), do: :error
end
