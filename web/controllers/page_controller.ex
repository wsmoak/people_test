defmodule PeopleTest.PageController do
  use PeopleTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
