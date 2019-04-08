use Mix.Config

config :todo, ecto_repos: [Todo.Repo]

config :todo, Todo.Repo,
  adapter: Ecto.Adapters.Postgres

if Mix.env() == :test do
  config :todo, Todo.Repo, pool: Ecto.Adapters.SQL.Sandbox
  config :logger, level: :warn
end
