defmodule QckpollSpike.Router do
  use QckpollSpike.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QckpollSpike do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/polls", PollController
  end

  # Other scopes may use custom stacks.
  # scope "/api", QckpollSpike do
  #   pipe_through :api
  # end
end
