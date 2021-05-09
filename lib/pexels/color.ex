defmodule Pexels.Color do
  @moduledoc ~S"""
  Desired photo color.
  
  Supported colors: red, orange, yellow, green, turquoise, blue, violet, pink, brown, black, gray, white or any hexidecimal color code (eg. #ffffff).

  ## Examples

      iex> Pexels.Color.red()
      "red"

  """
  @behaviour Construct.Type

  @colors ["red", "orange", "yellow", "green", "turquoise", "blue", "violet", "pink", "brown", "black", "gray", "white"]

  @colors |> Enum.each(fn (color) ->
    @doc """
    #{color} color

    ## Example

        iex> Pexels.Client.Color.#{color}()
        "#{color}"
    """
    def unquote(:"#{color}")(), do: unquote(color)
  end)

  def cast(value) when value in @colors do
    {:ok, value}
  end

  # TODO: Sent an email to api@pexels.com
  # Getting invalid hexcodes Example: "avg_color" => "#1BE4
  # Switch back to regex once fixed
  def cast("#" <> value) do
    {:ok, "##{value}"}
  end

  # def cast(value) when is_binary(value) do  
  #   case ~r/^#[0-9a-f]{6}$/i |> Regex.match?(value) do
  #     true -> {:ok, value}
  #     false -> :error
  #   end
  # end

  def cast(_), do: :error
end
