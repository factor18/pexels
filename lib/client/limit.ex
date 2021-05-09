defmodule Pexels.Client.Limit do
  @behaviour Construct.Type

  def cast(n) when is_integer(n) and n > 0 and n <= 80 do
    {:ok, n}
  end

  def cast(_), do: :error
end
