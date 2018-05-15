defmodule Appointment.LoginController do
    use Appointment.Web, :controller

    alias Appointment.User
    alias Appointment.Repo

    @base "http://localhost:4000"

    def login(conn, _params) do
        render conn, "login.html", [base: @base]
    end

    def logout(conn, _params) do
        render conn, "login.html", [base: @base]
    end
end