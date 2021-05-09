defmodule Pexels.Video.Picture do
  use Accessible

  use Construct do
    field :id, :integer
    field :picture, :string
    field :nr, :integer
  end
end
