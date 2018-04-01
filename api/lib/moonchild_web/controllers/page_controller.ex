defmodule MoonchildWeb.PageController do
  use MoonchildWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
