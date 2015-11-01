defmodule PeopleTest.Router do
  use PeopleTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PeopleTest do
    pipe_through :browser # Use the default browser stack
 
    resources "/people", PersonController
    resources "/couples", CoupleController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PeopleTest do
  #   pipe_through :api
  # end
end
