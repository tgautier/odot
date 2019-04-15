defmodule WebWeb.TaskController do
  use WebWeb, :controller

  def index(conn, _params) do
    case Web.Todo.all do
      {:ok, tasks} -> render(conn, "index.html", tasks: tasks)
      {:error, error} -> raise error
    end
  end
end
