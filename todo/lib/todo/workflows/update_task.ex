defmodule Todo.Workflows.UpdateTask do
  @day_in_seconds 3600 * 24

  defstruct [
    :id,
    :description,
    :reminder_at,
    :done
  ]

  def run(payload) do
    params =
      %{
        description: payload.input[:description],
        reminder_at: date_from_days(payload.input[:reminder_in_days])
      }
      |> Todo.Map.remove_if_nil([:description, :reminder_at])

    task = Todo.Queries.Task.by_id(payload.input.id)

    if task do
      case update_task(task, params) do
        {:ok, task} -> {:ok, to_struct(task)}
        _ -> {:error, "Error: can't update task"}
      end
    else
      {:error, "Error: can't find task_id #{payload.input.id}"}
    end
  end

  defp date_from_days(nil) do
    nil
  end

  defp date_from_days(reminder_in_days) do
    reminder_in_seconds = reminder_in_days * @day_in_seconds
    NaiveDateTime.add(NaiveDateTime.utc_now(), reminder_in_seconds, :second)
  end

  defp to_struct(task) do
    %__MODULE__{
      id: task.id,
      description: task.description,
      reminder_at: task.reminder_at,
      done: task.done
    }
  end

  defp update_task(task, params) do
    task
    |> Todo.Commands.Models.Task.changeset_update(params)
    |> Todo.Commands.Task.update()
  end
end
