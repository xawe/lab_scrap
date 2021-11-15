# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lab_scrap,
  ecto_repos: [LabScrap.Repo],
  timeout: 40_000,
  kill_process: 10_000

# Configures the endpoint
config :lab_scrap, LabScrapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EO7FQUlUrga7+A/REarOqwHSUrpftngArEskMntGXZuzeR65yZzRagG32/wCgJV2",
  render_errors: [view: LabScrapWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LabScrap.PubSub,
  live_view: [signing_salt: "GL71hOYK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
