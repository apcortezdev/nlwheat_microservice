defmodule HeatTagsWeb.MessagesView do

  # Inherit view functionalities
  use HeatTagsWeb, :view

  def render("create.json", %{message: message}) do
    # renders a json as response
    %{
      result: "Message created",
      message: message
    }
  end
end
