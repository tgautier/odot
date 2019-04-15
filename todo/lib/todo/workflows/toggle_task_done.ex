defmodule Todo.Workflows.ToggleTaskDone do
  defstruct [
    :id,
    :description,
    :reminder_at,
    :done
  ]

  def run(payload) do
    task = Todo.Queries.Task.by_id(payload.input.id)

    if task do
      case update_task(task, %{done: !task.done}) do
        {:ok, task} -> {:ok, to_struct(task)}
        _ -> {:error, "Error: can't toggle task done"}
      end
    else
      {:error, "Error: can't find task_id #{payload.input.id}"}
    end
  end

  defp update_task(task, params) do
    task
    |> Todo.Commands.Models.Task.changeset_update(params)
    |> Todo.Commands.Task.update()
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
