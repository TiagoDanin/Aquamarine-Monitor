defmodule Aquamarine.Repo do
  use Ecto.Repo,
    otp_app: :aquamarine,
    adapter: Ecto.Adapters.Postgres
end
