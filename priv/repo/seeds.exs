# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheetsspa.Repo.insert!(%Timesheetsspa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#

alias Timesheetsspa.Repo
alias Timesheetsspa.Users.User

pwhash = Argon2.hash_pwd_salt("123456789012")

Repo.insert!(%User{name: "m1", email: "m1test", is_manager: true, password_hash: pwhash})
Repo.insert!(%User{name: "w1", email: "w1test", is_manager: false, manager_email: "m1.com", password_hash: pwhash})

