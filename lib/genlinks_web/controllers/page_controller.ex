defmodule GenlinksWeb.PageController do
  use GenlinksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
