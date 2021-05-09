defmodule Pexels.Client.Size do
  @moduledoc ~S"""
  Minimum photo size filter enum. The current supported sizes are: `large`(24MP), `medium`(12MP) or `small`(4MP).

  ## Examples

      iex> Pexels.Client.Size.large()
      "large"

  """

  @behaviour Construct.Type

  @sizes ["large", "medium", "small"]

  @sizes |> Enum.each(fn (size) ->
    @doc """
    Minimum photo size #{size}

    ## Example

        iex> Pexels.Client.Size.#{size}()
        "#{size}"
    """
    def unquote(:"#{size}")(), do: unquote(size)
  end)

  def cast(size) when size in @sizes do
    {:ok, size}
  end

  def cast(_), do: :error
end
