defmodule Pexels.Video.Quality do
  @moduledoc ~S"""
  The video quality of the video_file.
  
  ## Examples

      iex> Pexels.Video.Quality.hd()
      "hd"
  """
  @behaviour Construct.Type

  @sizes ["hd", "sd", "hls"]

  @sizes |> Enum.each(fn (size) ->
    @doc """
    #{size} quality

    ## Example

        iex> Pexels.Video.Quality.#{size |> String.replace("-", "")}()
        "#{size}"
    """
    def unquote(:"#{size}")(), do: unquote(size)
  end)

  def cast(size) when size in @sizes do
    {:ok, size}
  end

  def cast(_), do: :error
end
