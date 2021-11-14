defmodule LabScrapWeb.PageController do
  use LabScrapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
