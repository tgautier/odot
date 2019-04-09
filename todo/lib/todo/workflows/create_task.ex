defmodule Todo.Workflows.CreateTask do
  @day_in_seconds 3600 * 24

  defstruct [
    :id,
    :description,
    :reminder_at,
    :done
  ]

  def run(payload) do
    reminder_in_seconds = payload.input.reminder_in_days * @day_in_seconds

    params = %{
      description: payload.input.description,
      reminder_at: NaiveDateTime.add(NaiveDateTime.utc_now(), reminder_in_seconds, :second),
      done: false
    }

    case create_task(params) do
      {:ok, task} -> {:ok, to_struct(task)}
      _ -> {:error, "Error: can't create task"}
    end
  end

  defp create_task(params) do
    params
    |> Todo.Commands.Models.Task.changeset_creation()
    |> Todo.Commands.Task.create()
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
