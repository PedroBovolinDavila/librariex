# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :librariex,
  ecto_repos: [Librariex.Repo]

config :librariex, Librariex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :librariex, LibrariexWeb.Auth.Guardian,
  issuer: "librariex",
  secret_key: "jkq0soRLn1BGGFD87xXYXJ1sxPgCGV7PnaWKgV60azPDBUNzyOxsAy0gDTz3Irvu"

# Configures the endpoint
config :librariex, LibrariexWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: LibrariexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Librariex.PubSub,
  live_view: [signing_salt: "tND5Kfwu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
