defmodule Pexels.Collection do  
  @moduledoc ~S"""
      %Pexels.Collection {
        description: nil,
        id: "z40vgi2",
        media_count: 3,
        photos_count: 2,
        private: false,
        title: "Purple",
        videos_count: 1
      }
  """
  use Accessible

  use Construct do
    field :id, :string
    field :title, :string
    field :description, :string, default: nil
    field :private, :boolean
    field :media_count, :integer
    field :photos_count, :integer
    field :videos_count, :integer
  end
end
