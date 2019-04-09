defmodule Todo.Factory do
  @repo Todo.Repo

  def build_task do
    %Todo.Commands.Models.Task{
      description: "It always starts with the Why!",
      reminder_at: NaiveDateTime.utc_now(),
      done: false
    }
  end

  def build(model), do: build(model, %{})

  def build(model, params) when is_list(params) do
    build(model, Enum.into(params, %{}))
  end

  def build(model, params) when is_map(params) do
    __MODULE__
    |> apply(:"build_#{model}", [])
    |> Map.merge(params)
  end

  def build_changeset(model, params \\ %{}, changeset \\ :default_changeset) do
    {:ok, module} = model |> build |> Map.fetch(:__struct__)
    empty_struct = struct(module)
    params = params_for(model, params)

    apply(module, changeset, [empty_struct, params])
  end

  def build_changeset_with_id(model, id, params \\ %{}, changeset \\ :default_changeset) do
    model
    |> build_changeset(params, changeset)
    |> Ecto.Changeset.put_change(:id, id)
  end

  def insert_with_id(model, id, params \\ %{}, changeset \\ :default_changeset) do
    model
    |> build_changeset_with_id(id, params, changeset)
    |> @repo.insert
  end

  def insert(model, params \\ %{}, changeset \\ :default_changeset) do
    model
    |> build_changeset(params, changeset)
    |> @repo.insert
  end

  def params_for(type) do
    params_for(type, %{})
  end

  def params_for(type, params) when is_list(params) do
    params_for(type, Enum.into(params, %{}))
  end

  def params_for(type, params) when is_map(params) do
    type
    |> build(params)
    |> Map.drop([:__meta__, :__struct__])
  end
end
