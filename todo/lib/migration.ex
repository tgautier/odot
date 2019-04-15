defmodule Todo.Migration do
  defmacro __using__(_options) do
    quote do
      use Ecto.Migration

      import unquote(__MODULE__)
    end
  end

  def drop_enabled_view(table_name) do
    Ecto.Migration.execute(
      do_drop_enabled_view_sql(table_name),
      do_create_enabled_view_sql(table_name)
    )
  end

  def create_enabled_view(table_name) do
    Ecto.Migration.execute(
      do_create_enabled_view_sql(table_name),
      do_drop_enabled_view_sql(table_name)
    )
  end

  defp do_create_enabled_view_sql(table_name) do
    "CREATE VIEW enabled_#{table_name} AS SELECT * FROM #{table_name} WHERE disabled = FALSE"
  end

  defp do_drop_enabled_view_sql(table_name) do
    "DROP VIEW IF EXISTS enabled_#{table_name}"
  end
end
