defmodule AimWeb.PageController do
  use AimWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
