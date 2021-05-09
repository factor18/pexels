defmodule Pexels.Video.User do
  @moduledoc ~S"""
      %Pexels.Video.User {
        id: 3798027,
        name: "KoolShooters",
        url: "https://www.pexels.com/@kool-shooters"
      }
  """
  use Accessible

  use Construct do
    field :id, :integer
    field :name, :string
    field :url, :string
  end
end
