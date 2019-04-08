defmodule Todo.Repo do
  use Ecto.Repo,
    otp_app: :todo,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do
    config =
      config
      |> Keyword.put(:database, database_name())
      |> Keyword.put(:username, System.get_env("TODO_SQL_USERNAME"))
      |> Keyword.put(:password, System.get_env("TODO_SQL_PASSWORD"))
      |> Keyword.put(:hostname, System.get_env("TODO_SQL_HOSTNAME"))
      |> Keyword.put(:port, System.get_env("TODO_SQL_PORT"))

    {:ok, config}
  end

  defp database_name do
    System.get_env("TODO_SQL_DATABASE") || "todo_#{Mix.env()}"
  end
end
