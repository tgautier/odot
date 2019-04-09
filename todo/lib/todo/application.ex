defmodule Todo.Application do
  use Application

  def start(_type, _args) do
    children = [
      Todo.Repo
    ]

    opts = [strategy: :one_for_one, name: Todo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
