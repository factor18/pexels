defmodule Pexels.Client.Media do
  @behaviour Construct.Type

  alias Pexels.{Photo, Video}

  def cast(%{src: _} = v), do: Photo.make(v)
  def cast(%{"src" => _} = v), do: Photo.make(v)
  
  def cast(%{video_files: _} = v), do: Video.make(v)
  def cast(%{"video_files" => _} = v), do: Video.make(v)
  
  def cast(_), do: :error
end
