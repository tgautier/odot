defmodule API.Controllers.Task.ToggleDone do
  use API.Controller

  def update(conn, params) do
    task = Todo.toggle_done(params["id"])

    case task do
      {:ok, task} ->
        render(conn, API.Views.Task, "show.json", 200, task: task)
      {:error, reason} ->
        render(conn, API.Views.Error, "422.json", 422, error: reason)
    end
  end
end
