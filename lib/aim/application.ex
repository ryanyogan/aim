defmodule Aim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Aim.Repo,
      # Start the Telemetry supervisor
      AimWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Aim.PubSub},
      # Start the Endpoint (http/https)
      AimWeb.Endpoint
      # Start a worker by calling: Aim.Worker.start_link(arg)
      # {Aim.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Aim.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AimWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
