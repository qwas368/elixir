defmodule MediumPhxExampleWeb.AlbumControllerTest do
  use MediumPhxExampleWeb.ConnCase

  alias MediumPhxExample.Audio
  alias MediumPhxExample.Audio.Album

  @create_attrs %{name: "some name", release: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{name: "some updated name", release: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{name: nil, release: nil}

  def fixture(:album) do
    {:ok, album} = Audio.create_album(@create_attrs)
    album
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all albums", %{conn: conn} do
      conn = get conn, album_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create album" do
    test "renders album when data is valid", %{conn: conn} do
      conn = post conn, album_path(conn, :create), album: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, album_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "release" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, album_path(conn, :create), album: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update album" do
    setup [:create_album]

    test "renders album when data is valid", %{conn: conn, album: %Album{id: id} = album} do
      conn = put conn, album_path(conn, :update, album), album: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, album_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "release" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, album: album} do
      conn = put conn, album_path(conn, :update, album), album: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete album" do
    setup [:create_album]

    test "deletes chosen album", %{conn: conn, album: album} do
      conn = delete conn, album_path(conn, :delete, album)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, album_path(conn, :show, album)
      end
    end
  end

  defp create_album(_) do
    album = fixture(:album)
    {:ok, album: album}
  end
end
