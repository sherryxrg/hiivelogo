defmodule Logo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LogoWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:logo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Logo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Logo.Finch},
      # Start a worker by calling: Logo.Worker.start_link(arg)
      # {Logo.Worker, arg},
      # Start to serve requests, typically the last entry
      LogoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Logo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LogoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
