defmodule Run do
  @moduledoc false
  import Ecto.Query
  alias EtcoTest.Message
  alias EtcoTest.Repo

  def start do
    # Message
    # |> Repo.all
    # |> IO.inspect

    {:ok, datetime, 0} = DateTime.from_iso8601("2015-01-23T23:50:07Z")
    Repo.insert_all "message", [[id: 2, message: "hello", author: "晏彰2", update_time: datetime]], returning: [:id]

  end
end
