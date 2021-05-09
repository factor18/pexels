defmodule Pexels.Client.Orientation do
  @moduledoc ~S"""
  Desired photo orientation. 
  
  The current supported orientations are: `landscape`, `portrait` or `square`.

  ## Examples

      iex> Pexels.Client.Orientation.landscape()
      "landscape"

  """

  @behaviour Construct.Type

  @orientations ["landscape", "portrait", "square"]

  @orientations |> Enum.each(fn (orientation) ->
    @doc """
    #{orientation} orientation

    ## Example

        iex> Pexels.Client.Orientation.#{orientation}()
        "#{orientation}"
    """
    def unquote(:"#{orientation}")(), do: unquote(orientation)
  end)

  def cast(orientation) when orientation in @orientations do
    {:ok, orientation}
  end

  def cast(_), do: :error
end
