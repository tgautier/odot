defmodule Todo.Models.Task do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "enabled_tasks" do
    field(:description, :string, null: false)
    field(:reminder_at, :naive_datetime_usec, null: true)
    field(:done, :boolean, default: false, null: false)

    timestamps()
  end
end
