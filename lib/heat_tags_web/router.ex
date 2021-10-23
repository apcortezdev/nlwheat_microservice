defmodule HeatTagsWeb.Router do
  use HeatTagsWeb, :router

  pipeline :api do
    # Enables only apis of type json
    plug :accepts, ["json"]
  end

  scope "/api", HeatTagsWeb do
    # Sets routes to /api/something to go through pipelide defined as :api (above)
    pipe_through :api

    # Pattern:
    # method "/route", Controller, :action
    post "/message", MessagesController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: HeatTagsWeb.Telemetry
    end
  end
end
