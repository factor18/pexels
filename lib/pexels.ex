defmodule Pexels do
  alias Pexels.Video
  alias Pexels.Client.Video.{VideoSearchRequest, PopularVideosRequest, VideoRequest, VideosResponse}
  alias Pexels.Client.Photo.{PhotoSearchRequest, CuratedPhotosRequest, PhotoRequest, PhotoResponse, PhotosResponse}
  alias Pexels.Client.Collection.{CollectionsRequest, CollectionMediaRequest, CollectionMediaResponse, CollectionsResponse}

  # Photos

  def search_photos(client, request) do
    case PhotoSearchRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/v1/search", query: to_kwlist(request))
        PhotosResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  def curated_photos(client, request) do
    case CuratedPhotosRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/v1/curated", query: to_kwlist(request))
        PhotosResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  def photo(client, request) do
    case PhotoRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/v1/photos/#{request.id}")
        PhotoResponse.make(%{photo: env.body, liked: env.body["liked"]})
      {:error, error} ->
        {:error, error}
    end
  end

  # Videos

  def search_videos(client, request) do
    case VideoSearchRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/videos/search", query: to_kwlist(request))
        VideosResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  def popular_videos(client, request) do
    case PopularVideosRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/videos/popular", query: to_kwlist(request))
        VideosResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  def video(client, request) do
    case VideoRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/videos/videos/#{request.id}")
        Video.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  # Collections

  def collections(client, request) do
    case CollectionsRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/v1/collections", query: to_kwlist(request)) |> IO.inspect
        CollectionsResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  def collection_media(client, request) do
    case CollectionMediaRequest.make(request) do
      {:ok, request} ->
        {:ok, env} = Tesla.get(client, "/v1/collections/#{request.id}") |> IO.inspect
        CollectionMediaResponse.make(env.body)
      {:error, error} ->
        {:error, error}
    end
  end

  # Client

  def client(token \\ Application.get_env(:pexels, :token), base \\ Application.get_env(:pexels, :base)) do
    middleware = [
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BaseUrl, base},
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
