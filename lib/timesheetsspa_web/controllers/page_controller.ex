defmodule TimesheetsspaWeb.PageController do
  use TimesheetsspaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
