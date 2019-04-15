defmodule Todo.Workflows.GetAllTasks do
  defstruct [
    :id,
    :description,
    :reminder_at,
    :done
  ]

  def run do
    Enum.map(Todo.Queries.Task.all(), &to_struct/1)
  end

  defp to_struct(task) do
    %__MODULE__{
      id: task.id,
      description: task.description,
      reminder_at: task.reminder_at,
      done: task.done
    }
  end
end
