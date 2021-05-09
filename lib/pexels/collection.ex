defmodule Pexels.Collection do  
  use Accessible

  use Construct do
    field :id, :integer
    field :title, :string
    field :description, :string
    field :private, :boolean
    field :media_count, :integer
    field :photos_count, :integer
    field :videos_count, :integer
  end
end
