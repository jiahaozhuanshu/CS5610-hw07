defmodule Timesheetsspa.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :is_manager, :boolean

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :manager_email, :string

    has_many :sheets, Timesheets.Sheets.Sheet
    has_many :jobs, Timesheets.Jobs.Job

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :is_manager, :password, :password_confirmation, :manager_email])
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8) 
    |> hash_password()
    |> validate_required([:email, :name, :is_manager,:password_hash])
  end

  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end
end
