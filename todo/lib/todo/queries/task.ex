defmodule Todo.Queries.Task do
  def all do
    Todo.Repo.all(Todo.Models.Task)
  end

  def by_id(id) do
    Todo.Repo.get(Todo.Models.Task, id)
  end
end
