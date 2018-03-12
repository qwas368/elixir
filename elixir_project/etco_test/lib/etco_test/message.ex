defmodule EtcoTest.Message do
  use Ecto.Schema

  schema "message" do
    field :message, :string
    field :author, :string
    field :update_time, :utc_datetime
  end
end
