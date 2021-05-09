defmodule Pexels.Client.Video.VideoRequest do
  use Accessible

  use Construct do
    field :id, :integer
  end
end
