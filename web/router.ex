defmodule ElircSite.Router do
  use ElircSite.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    # plug :fetch_session
    # plug :fetch_flash
    # plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElircSite do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :save_email
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElircSite do
  #   pipe_through :api
  # end
end
