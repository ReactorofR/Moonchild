defmodule MoonchildWeb.Router do
  use MoonchildWeb, :router

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

  pipeline :auth do
    plug Moonchild.Auth.pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", MoonchildWeb do
    pipe_through [:browser, :auth] # Use the default browser stack
  end

  # Definitely logged in scope
  scope "/", MoonchildWeb do
    pipe_through [:browser, :auth, :ensure_auth]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoonchildWeb do
  #   pipe_through :api
  # end
end
