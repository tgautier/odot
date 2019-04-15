defmodule API.Views.Task do
  def render("index.json", %{tasks: tasks}) do
    Enum.map(tasks, &render("show.json", %{task: &1}))
  end

  def render("show.json", %{task: task}) do
    %{
      id: task.id,
      description: task.description,
      reminder_at: task.reminder_at,
      done: task.done
    }
  end
end
