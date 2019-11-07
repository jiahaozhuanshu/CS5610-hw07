defmodule Timesheetsspa.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :description, :string
      add :hours, :integer
      add :jobcode, :string
      add :name, :string

      timestamps()
    end

  end
end
