defmodule Todo.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Todo.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import unquote(__MODULE__)
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Todo.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Todo.Repo, {:shared, self()})
    end

    :ok
  end
end
