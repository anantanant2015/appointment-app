defmodule Appointment.AccountsView do
  use Appointment.Web, :view

  def render("index.json", %{user: user}) do
    %{data: render_many(user, Appointment.AccountsView, "accounts.json")}
  end

  def render("show.json", %{accounts: accounts}) do
    %{data: render_one(accounts, Appointment.AccountsView, "accounts.json")}
  end

  def render("accounts.json", %{accounts: accounts}) do
    %{id: accounts.id,
      users: accounts.users,
      username: accounts.username,
      hashed_password: accounts.hashed_password,
      role: accounts.role}
  end
end
