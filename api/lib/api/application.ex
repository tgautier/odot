defmodule API.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: API.Router,
        options: [port: http_port()]
      )
    ]

    opts = [strategy: :one_for_one, name: API.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp http_port do
    "TODO_HTTP_API_PORT"
    |> System.get_env()
    |> String.to_integer()
  end
end
