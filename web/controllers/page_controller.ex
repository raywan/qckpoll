defmodule Qckpoll.PageController do
  use Qckpoll.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
