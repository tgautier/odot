defmodule Todo do
  def create(params) do
    Todo.Workflows.CreateTask.run(%{
      input: %{
        description: params[:description],
        reminder_in_days: params[:reminder_in_days]
      }
    })
  end

  def toggle(id) do
    Todo.Workflows.ToggleTaskDone.run(%{
      input: %{id: id}
    })
  end

  def update(id, params) do
    Todo.Workflows.UpdateTask.run(%{
      input: %{
        id: id,
        description: params[:description],
        reminder_in_days: params[:reminder_in_days]
      }
    })
  end
end
