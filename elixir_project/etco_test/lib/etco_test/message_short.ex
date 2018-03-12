defmodule EtcoTest.Message.Short do
  use Ecto.Schema

  schema "message" do
    field :message, :string
  end
end
