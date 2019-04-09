defmodule API.Controllers.Task do
  use API.Controller

  def index(conn, params) do
    tasks = Todo.all

    render(conn, API.Views.Task, "index.json", 200, tasks: tasks)
  end

  def create(conn, params) do
    task = Todo.create(%{
      description: params["description"],
      reminder_in_days: params["reminder_in_days"]
    })

    case task do
      {:ok, task} ->
        render(conn, API.Views.Task, "show.json", 201, task: task)
      {:error, reason} ->
        render(conn, API.Views.Error, "422.json", 422, error: reason)
    end
  end

  def update(conn, params) do
    task = Todo.update(params["id"], %{
      description: params["description"],
      reminder_in_days: params["reminder_in_days"]
    })

    case task do
      {:ok, task} ->
        render(conn, API.Views.Task, "show.json", 200, task: task)
      {:error, reason} ->
        render(conn, API.Views.Error, "422.json", 422, error: reason)
    end
  end
end
