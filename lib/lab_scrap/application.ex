defmodule LabScrap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LabScrap.Repo,
      # Start the Telemetry supervisor
      LabScrapWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LabScrap.PubSub},
      # Start the Endpoint (http/https)
      LabScrapWeb.Endpoint,
      {LabScrap.Supervisors.CrawlerSupervisor, []},
      {LabScrap.Agents.ResultStore, []}
      # Start a worker by calling: LabScrap.Worker.start_link(arg)
      # {LabScrap.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LabScrap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LabScrapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
