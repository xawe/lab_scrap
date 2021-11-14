defmodule LabScrap.Repo do
  use Ecto.Repo,
    otp_app: :lab_scrap,
    adapter: Ecto.Adapters.Postgres
end
