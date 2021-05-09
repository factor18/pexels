defmodule Pexels do
  @moduledoc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, %{liked: _liked, photo: photo}} = Pexels.photo(client, %{id: 156934})
      iex> photo.url
      "https://www.pexels.com/photo/white-and-black-cat-156934/"
  """

  alias Pexels.Video
  alias Pexels.Client.Video.{VideoSearchRequest, PopularVideosRequest, VideoRequest, VideosResponse}
  alias Pexels.Client.Photo.{PhotoSearchRequest, CuratedPhotosRequest, PhotoRequest, PhotoResponse, PhotosResponse}
  alias Pexels.Client.Collection.{CollectionsRequest, CollectionMediaRequest, CollectionMediaResponse, CollectionsResponse}

  # Photos

  @doc ~S"""
  This endpoint enables you to search Pexels for any topic that you would like.
  
  For example your query could be something broad like Nature, Tigers, People.
  
  Or it could be something specific like Group of people working.

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, response = %Pexels.Client.Photo.PhotosResponse{}} = Pexels.search_photos(client, %{query: "cat", per_page: 10, page: 1})
      iex> response.photos |> Enum.count
      10
  """
  def search_photos(client, request) do
    with {:ok, request} <- PhotoSearchRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/v1/search", query: to_kwlist(request)) do
      PhotosResponse.make(env.body)
    else
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  This endpoint enables you to receive real-time photos curated by the Pexels team. 

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, response = %Pexels.Client.Photo.PhotosResponse{}} = Pexels.curated_photos(client, %{per_page: 2, page: 1})
      iex> response.photos |> Enum.count
      2
  """
  def curated_photos(client, request) do
    with {:ok, request} <- CuratedPhotosRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/v1/curated", query: to_kwlist(request)) do
      PhotosResponse.make(env.body)
    else
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieve a specific Photo from its id.

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, %{liked: _liked, photo: photo} = %Pexels.Client.Photo.PhotoResponse{}} = Pexels.photo(client, %{id: 156934})
      iex> photo.url
      "https://www.pexels.com/photo/white-and-black-cat-156934/"
  """
  def photo(client, request) do
    with {:ok, request} <- PhotoRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/v1/photos/#{request.id}", query: to_kwlist(request)) do
      PhotoResponse.make(%{photo: env.body, liked: env.body["liked"]})
    else
      {:error, error} -> {:error, error}
    end
  end

  # Videos

  @doc ~S"""
  This endpoint enables you to search Pexels for any topic that you would like.
  
  For example your query could be something broad like Nature, Tigers, People.
  
  Or it could be something specific like Group of people working.

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, response = %Pexels.Client.Video.VideosResponse{}} = Pexels.search_videos(client, %{query: "cat", per_page: 10, page: 1})
      iex> response.videos |> Enum.count
      10
  """
  def search_videos(client, request) do
    with {:ok, request} <- VideoSearchRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/videos/search", query: to_kwlist(request)) do
          VideosResponse.make(env.body)
    else
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  This endpoint enables you to receive the current popular Pexels videos. 

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, response = %Pexels.Client.Video.VideosResponse{}} = Pexels.popular_videos(client, %{per_page: 2, page: 1})
      iex> response.videos |> Enum.count
      2
  """
  def popular_videos(client, request) do
    with {:ok, request} <- PopularVideosRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/videos/popular", query: to_kwlist(request)) do
          VideosResponse.make(env.body)
    else
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieve a specific Video from its id.

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, video = %Pexels.Video{}} = Pexels.video(client, %{id: 6982949})
      iex> video.url
      "https://www.pexels.com/video/woman-dancing-in-the-spotlight-6982949/"
  """
  def video(client, request) do
    with {:ok, request} <- VideoRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/videos/videos/#{request.id}", query: to_kwlist(request)) do
          Video.make(env.body)
        else
      {:error, error} -> {:error, error}
    end
  end

  # Collections

  @doc ~S"""
  This endpoint returns all of your collections. 

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, %{collections: collections} = %Pexels.Client.Collection.CollectionsResponse{}} = Pexels.collections(client, %{per_page: 1})
      iex> collections |> Enum.count
      1
  """
  def collections(client, request) do
    with {:ok, request} <- CollectionsRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/v1/collections", query: to_kwlist(request)) do
          CollectionsResponse.make(env.body)
        else
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  This endpoint returns all of your collections. 

  ## Examples

      iex> client = Pexels.client()
      iex> {:ok, %{media: media} = %Pexels.Client.Collection.CollectionMediaResponse{}} = Pexels.collection_media(client, %{id: "z40vgi2", per_page: 1})
      iex> media |> Enum.count
      1
  """
  def collection_media(client, request) do
    with {:ok, request} <- CollectionMediaRequest.make(request),
         {:ok, env} <- Tesla.get(client, "/v1/collections/#{request.id}", query: to_kwlist(request)) do
          CollectionMediaResponse.make(env.body)
        else
      {:error, error} -> {:error, error}
    end
  end

  # Client
  @doc ~S"""
  Creates the `tesla` client for pexels

  ## Examples

      iex> _client = Pexels.client()
  """
  def client(token \\ Application.get_env(:pexels, :token),
             base \\ Application.get_env(:pexels, :base),
             timeout \\ Application.get_env(:pexels, :timeout)) do
    middleware = [
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BaseUrl, base},
      {Tesla.Middleware.Timeout, timeout: timeout},
      {Tesla.Middleware.Headers, [{"Authorization", token}]}
    ]

    Tesla.client(middleware)
  end

  # Helpers

  defp to_kwlist(map) do
    map
      |> Map.from_struct
      |> Enum.map(fn({key, value}) -> {key, value} end)
  end
end
