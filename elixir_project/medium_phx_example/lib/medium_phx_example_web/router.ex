defmodule MediumPhxExampleWeb.Router do
  use MediumPhxExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", MediumPhxExampleWeb do
    pipe_through :api

    get "/album", AlbumController, :index
    get "/song", SongController, :index
    post "/song", AlbumController, :create
  end
end
