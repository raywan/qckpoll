defmodule Qckpoll.Router do
  use Qckpoll.Web, :router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Qckpoll do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/create", PageController, :index
    resources "/users", UserController
    resources "/poll", PollController
  end

  socket "/ws", Qckpoll do
    channel "rooms:*", RoomChannel
  end


  # Other scopes may use custom stacks.
  # scope "/api", Qckpoll do
  #   pipe_through :api
  # end
end
