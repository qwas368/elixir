defmodule MediumPhxExampleWeb.AlbumView do
  use MediumPhxExampleWeb, :view
  alias MediumPhxExampleWeb.AlbumView

  def render("index.json", %{albums: albums}) do
    %{data: render_many(albums, AlbumView, "album.json")}
  end

  def render("show.json", %{album: album}) do
    %{data: render_one(album, AlbumView, "album.json")}
  end

  def render("album.json", %{album: album}) do
    %{id: album.id,
      name: album.name,
      release: album.release}
  end
end
