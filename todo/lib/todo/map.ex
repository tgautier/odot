defmodule Todo.Map do
  def remove_if_nil(map, names) when is_list(names) do
    Enum.reduce(names, map, &remove_if_nil(&2, &1))
  end

  def remove_if_nil(map, name) do
    {_, new_map} =
      Map.get_and_update(map, name, fn
        nil ->
          :pop

        current_value ->
          {current_value, current_value}
      end)

    new_map
  end
end
