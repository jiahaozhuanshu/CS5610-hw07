defmodule Timesheetsspa.Repo do
  use Ecto.Repo,
    otp_app: :timesheetsspa,
    adapter: Ecto.Adapters.Postgres
end
