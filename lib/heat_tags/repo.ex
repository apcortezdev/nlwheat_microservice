defmodule HeatTags.Repo do
  # Defines db adapter
  use Ecto.Repo,
    otp_app: :heat_tags,
    adapter: Ecto.Adapters.Postgres
end
