defmodule MediumPhxExample.Audio.Song do
  use Ecto.Schema
  import Ecto.Changeset
  alias MediumPhxExample.Audio.Song


  schema "songs" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Song{} = song, attrs) do
    song
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
