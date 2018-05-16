defmodule Appointment.UserView do
  use Appointment.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Appointment.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Appointment.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      hashed_password: user.hashed_password,
      role: user.role}
  end
end
