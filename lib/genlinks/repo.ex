defmodule Genlinks.Repo do
  use Ecto.Repo,
    otp_app: :genlinks,
    adapter: Ecto.Adapters.Postgres
end
