defmodule Pexels.Video.Quality do
  @behaviour Construct.Type

  @sizes ["hd", "sd", "hls"]

  @sizes |> Enum.each(fn (size) ->
    def unquote(:"#{size}")(), do: unquote(size)
  end)

  def cast(size) when size in @sizes do
    {:ok, size}
  end

  def cast(_), do: :error
end
