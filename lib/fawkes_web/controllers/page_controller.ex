defmodule FawkesWeb.PageController do
  use FawkesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do # _ indicates we are not using the params
    render conn, "about.html"
  end
end
