defmodule API.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)

  plug(:match)
  plug(:dispatch)

  get "/tasks",
    do: API.Controllers.Task.index(conn, conn.params)
  post "/tasks",
    do: API.Controllers.Task.create(conn, conn.params)
  patch "/tasks/:id",
    do: API.Controllers.Task.update(conn, conn.params)
  patch "/tasks/:id/toggle_done",
    do: API.Controllers.Task.ToggleDone.update(conn, conn.params)

  match _ do
    send_resp(
      conn,
      404,
      Jason.encode!(%{
        error: 404,
        code: "This endpoint does not exist"
      })
    )
  end
end
