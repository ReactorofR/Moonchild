defmodule StreamsMoeWeb.PageController do
  use StreamsMoeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
