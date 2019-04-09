defmodule Web.Todo do
  defstruct [
    :id,
    :description,
    :reminder_at,
    :done
  ]

  def all do
    with {:ok, response} <- HTTPoison.get("http://localhost:4001/tasks"),
      {:ok, body} <- Jason.decode(response.body)
    do
      {:ok, decode_body(body)}
    end
  end

  defp decode_body(body) when is_list(body) do
    Enum.map(body, &decode_body/1)
  end

  defp decode_body(body) do
    %__MODULE__{
      id: body["id"],
      description: body["description"],
      reminder_at: body["reminder_at"],
      done: body["done"]
    }
  end
end
