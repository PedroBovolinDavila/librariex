defmodule Librariex.Repo do
  use Ecto.Repo,
    otp_app: :librariex,
    adapter: Ecto.Adapters.Postgres
end
