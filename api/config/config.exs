# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :moonchild,
  ecto_repos: [Moonchild.Repo]

# Configures the endpoint
config :moonchild, MoonchildWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ct8bx8aAQQuk9yCm/6kyV2DF8lyePqKUesreCSbXzszvtByRU9GQft3GhqlZsa7w",
  render_errors: [view: MoonchildWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Moonchild.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
