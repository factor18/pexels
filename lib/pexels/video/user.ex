defmodule Pexels.Video.User do
  use Accessible

  use Construct do
    field :id, :integer
    field :name, :string
    field :url, :string
  end
end
