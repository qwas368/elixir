defmodule MediumPhxExample.AudioTest do
  use MediumPhxExample.DataCase

  alias MediumPhxExample.Audio

  describe "albums" do
    alias MediumPhxExample.Audio.Album

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Audio.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Audio.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Audio.create_album(@valid_attrs)
      assert album.name == "some name"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Audio.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_album(album, @invalid_attrs)
      assert album == Audio.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Audio.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Audio.change_album(album)
    end
  end

  describe "songs" do
    alias MediumPhxExample.Audio.Song

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Audio.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Audio.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Audio.create_song(@valid_attrs)
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, song} = Audio.update_song(song, @update_attrs)
      assert %Song{} = song
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_song(song, @invalid_attrs)
      assert song == Audio.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Audio.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Audio.change_song(song)
    end
  end

  describe "albums" do
    alias MediumPhxExample.Audio.Album

    @valid_attrs %{name: "some name", release: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{name: "some updated name", release: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{name: nil, release: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Audio.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Audio.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Audio.create_album(@valid_attrs)
      assert album.name == "some name"
      assert album.release == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Audio.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
      assert album.release == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_album(album, @invalid_attrs)
      assert album == Audio.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Audio.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Audio.change_album(album)
    end
  end

  describe "songs" do
    alias MediumPhxExample.Audio.Song

    @valid_attrs %{duration: 42, name: "some name"}
    @update_attrs %{duration: 43, name: "some updated name"}
    @invalid_attrs %{duration: nil, name: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Audio.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Audio.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Audio.create_song(@valid_attrs)
      assert song.duration == 42
      assert song.name == "some name"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, song} = Audio.update_song(song, @update_attrs)
      assert %Song{} = song
      assert song.duration == 43
      assert song.name == "some updated name"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_song(song, @invalid_attrs)
      assert song == Audio.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Audio.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Audio.change_song(song)
    end
  end

  describe "songs" do
    alias MediumPhxExample.Audio.Song

    @valid_attrs %{duration: 42}
    @update_attrs %{duration: 43}
    @invalid_attrs %{duration: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Audio.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Audio.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Audio.create_song(@valid_attrs)
      assert song.duration == 42
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, song} = Audio.update_song(song, @update_attrs)
      assert %Song{} = song
      assert song.duration == 43
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_song(song, @invalid_attrs)
      assert song == Audio.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Audio.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Audio.change_song(song)
    end
  end

  describe "songs" do
    alias MediumPhxExample.Audio.Song

    @valid_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}
    @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}
    @invalid_attrs %{id: nil, name: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Audio.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Audio.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Audio.create_song(@valid_attrs)
      assert song.id == "7488a646-e31f-11e4-aace-600308960662"
      assert song.name == "some name"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, song} = Audio.update_song(song, @update_attrs)
      assert %Song{} = song
      assert song.id == "7488a646-e31f-11e4-aace-600308960668"
      assert song.name == "some updated name"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_song(song, @invalid_attrs)
      assert song == Audio.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Audio.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Audio.change_song(song)
    end
  end

  describe "songs" do
    alias MediumPhxExample.Audio.Song

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Audio.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Audio.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Audio.create_song(@valid_attrs)
      assert song.name == "some name"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, song} = Audio.update_song(song, @update_attrs)
      assert %Song{} = song
      assert song.name == "some updated name"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_song(song, @invalid_attrs)
      assert song == Audio.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Audio.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Audio.change_song(song)
    end
  end
end
