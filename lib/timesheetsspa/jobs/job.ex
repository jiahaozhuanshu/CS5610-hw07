defmodule Timesheetsspa.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :description, :string
    field :hours, :integer
    field :jobcode, :string
    field :name, :string
    belongs_to :user, Timesheetsspa.Users.User
    has_many :tasks, Timesheetsspa.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:description, :hours, :jobcode, :name])
    |> validate_required([:description, :hours, :jobcode, :name])
  end
end
