defmodule Librariex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Librariex.Repo,
      # Start the Telemetry supervisor
      LibrariexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Librariex.PubSub},
      # Start the Endpoint (http/https)
      LibrariexWeb.Endpoint
      # Start a worker by calling: Librariex.Worker.start_link(arg)
      # {Librariex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Librariex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LibrariexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
