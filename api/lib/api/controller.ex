defmodule API.Controller do

  def render(conn, module, template_name, status_code, payload) when is_list(payload) do
    render(conn, module, template_name, status_code, Enum.into(payload, %{}))
  end
  def render(conn, module, template_name, status_code, payload) do
    response =
      module
      |> apply(:render, [template_name, payload])
      |> Jason.encode!

    Plug.Conn.send_resp(conn, status_code, response)
  end

  defmacro __using__(_params) do
    quote do
      import Plug.Conn
      import API.Controller
    end
  end
end
