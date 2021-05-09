defmodule PexelsTest do
  use ExUnit.Case
  doctest Pexels

  test "greets the world" do
    response = {
      :ok,
      %Pexels.Client.Photo.PhotoResponse{
        liked: false,
        photo: %Pexels.Photo{
          avg_color: "#AFAFAD",
          height: 2736,
          id: 156934,
          photographer: "Flickr",
          photographer_id: 42313,
          photographer_url: "https://www.pexels.com/@flickr",
          src: %Pexels.Photo.Source{
            landscape: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
            large: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
            large2x: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            medium: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=350",
            original: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg",
            portrait: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
            small: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&h=130",
            tiny: "https://images.pexels.com/photos/156934/pexels-photo-156934.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
          },
          url: "https://www.pexels.com/photo/white-and-black-cat-156934/",
          width: 3674
        }
      }
    }

    client = Pexels.client()
    assert Pexels.photo(client, %{id: 156934}) == response
  end
end
