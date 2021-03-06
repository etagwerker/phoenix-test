defmodule FawkesWeb.Router do
  use FawkesWeb, :router

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

  scope "/", FawkesWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/categories/new", CategoryController, :new
    get "/categories/:id", CategoryController, :show
    get "/categories", CategoryController, :index
    post "/categories", CategoryController, :create

    resources "/audiences", AudienceController
    resources "/schedule_slots", SlotController
    resources "/speakers", SpeakerController
    resources "/talks", TalkController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FawkesWeb do
  #   pipe_through :api
  # end
end
