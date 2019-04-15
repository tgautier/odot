defmodule Todo.Commands.Models.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "tasks" do
    field(:description, :string, null: false)
    field(:reminder_at, :naive_datetime_usec, null: true)
    field(:done, :boolean, default: false, null: false)
    field(:disabled, :boolean, default: false)

    timestamps()
  end

  def changeset_creation(task), do: default_changeset(%__MODULE__{}, task)

  def changeset_delete(task) do
    task
    |> default_changeset(%{})
    |> put_change(:disabled, true)
  end

  def changeset_update(task, attributes), do: default_changeset(task, attributes)

  defp default_changeset(task, attributes) do
    task
    |> cast(attributes, [
      :description,
      :reminder_at,
      :done
    ])
    |> validate_required([
      :description,
      :reminder_at,
      :done
    ])
  end
end
