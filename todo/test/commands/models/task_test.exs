defmodule Todo.Commands.Models.TaskTest do
  use Todo.DataCase

  test "changeset_creation: when all attributes are valid" do
    payload =
      :task
      |> Todo.Factory.build()
      |> Map.from_struct()

    task = Todo.Commands.Models.Task.changeset_creation(payload)

    assert task.valid?
  end
end
