defmodule MediumPhxExampleWeb.SongControllerTest do
  use MediumPhxExampleWeb.ConnCase

  alias MediumPhxExample.Audio
  alias MediumPhxExample.Audio.Song

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:song) do
    {:ok, song} = Audio.create_song(@create_attrs)
    song
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all songs", %{conn: conn} do
      conn = get conn, song_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create song" do
    test "renders song when data is valid", %{conn: conn} do
      conn = post conn, song_path(conn, :create), song: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, song_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, song_path(conn, :create), song: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update song" do
    setup [:create_song]

    test "renders song when data is valid", %{conn: conn, song: %Song{id: id} = song} do
      conn = put conn, song_path(conn, :update, song), song: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, song_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, song: song} do
      conn = put conn, song_path(conn, :update, song), song: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete song" do
    setup [:create_song]

    test "deletes chosen song", %{conn: conn, song: song} do
      conn = delete conn, song_path(conn, :delete, song)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, song_path(conn, :show, song)
      end
    end
  end

  defp create_song(_) do
    song = fixture(:song)
    {:ok, song: song}
  end
end
