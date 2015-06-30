use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :qckpoll, Qckpoll.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :qckpoll, Qckpoll.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "qckpoll_test",
  size: 1 # Use a single connection for transactional tests
