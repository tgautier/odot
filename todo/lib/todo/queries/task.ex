defmodule Todo.Queries.Task do
  def by_id(id) do
    Todo.Repo.get(Todo.Models.Task, id)
  end
end
