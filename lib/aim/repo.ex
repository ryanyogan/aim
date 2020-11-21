defmodule Aim.Repo do
  use Ecto.Repo,
    otp_app: :aim,
    adapter: Ecto.Adapters.Postgres
end
