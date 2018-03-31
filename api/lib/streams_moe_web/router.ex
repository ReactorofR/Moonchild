defmodule StreamsMoeWeb.Router do
  use StreamsMoeWeb, :router

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

  scope "/", StreamsMoeWeb do
    pipe_through :api # Use the default browser stack
  end

  # Other scopes may use custom stacks.
  # scope "/api", StreamsMoeWeb do
  #   pipe_through :api
  # end
end
