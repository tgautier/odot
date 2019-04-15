defmodule Todo.Repo.Migrations.CreateTasks do
  use Todo.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:description, :string, null: false)
      add(:reminder_at, :naive_datetime_usec, null: true)
      add(:done, :boolean, default: false, null: false)

      add(:disabled, :boolean, default: false, null: false)

      timestamps()
    end

    create_enabled_view(:tasks)
  end
end
