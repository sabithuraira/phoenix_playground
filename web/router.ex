defmodule FirstApp.Router do
  use FirstApp.Web, :router

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

  scope "/", FirstApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    #get "/hello/:messenger", HelloController, :show
    get "/hello/api_json", HelloController, :api_json
    get "/hello/showtext/:id", HelloController, :showtext
    get "/hello/showjson/:id", HelloController, :showjson
    get "/hello/showhtml/:id", HelloController, :showhtml
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FirstApp do
  #   pipe_through :api
  # end
end
