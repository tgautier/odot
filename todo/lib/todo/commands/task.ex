defmodule Todo.Commands.Task do
  def create(changeset) do
    Todo.Repo.insert(changeset)
  end

  def update(changeset) do
    Todo.Repo.update(changeset)
  end

  def delete(task) do
    task
    |> Todo.Commands.Models.Task.changeset_delete()
    |> Todo.Repo.update()
  end
end
