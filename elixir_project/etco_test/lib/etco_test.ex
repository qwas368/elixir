defmodule EtcoTest.App do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EtcoTest.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: EtcoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
