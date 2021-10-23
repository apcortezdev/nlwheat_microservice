# Define a module (group of functions)
defmodule HeatTagsWeb.MessagesController do
  # Inherit controller functionalities
  use HeatTagsWeb, :controller

  # create alias Messages for HeatTags.Message
  alias HeatTags.Message
  # create alias Create for HeatTags.Messages.Create
  alias HeatTags.Messages.Create

  # Criates function :create
  def create(conn, params) do
    # conn = connection
    # params = body of the request
    params
    |> Create.call()
    |> handle_create(conn)
  end

  # defines a private (local) function named handle_insert w/ 2 different signatures:
  defp handle_create({:ok, %Message{} = message}, conn) do
    # Send response w/ text "Request Received"
    conn
    |> put_status(:created)
    # calls func render inside view messages_view.ex
    # phx knows which view to use because ot name pattern
    |> render("create.json", message: message)
  end

  defp handle_create({:error,  %{result: result, status: status}}, conn) do
    conn
    |> put_status(status)
    # we don't build an error view for every controller, instead we user the same one as pattern
    # so we can't just call render because phx won't know which view to use
    |> put_view(HeatTagsWeb.ErrorView) # set which view to use
    |> render("error.json", result: result)
  end
end
