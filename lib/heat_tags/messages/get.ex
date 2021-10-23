# Defines a module responsible for creating and saving a message
defmodule  HeatTags.Messages.Get do
  import Ecto.Query

  # create alias: HeatTags.Messages as Message and HeatTags.Repo as Repo
  alias HeatTags.{Message, Repo}

  def today_messages do
    # create var w/ today
    today = Date.utc_today()
    # create var w/ query, use type() to parse today message.inserted_at (Naive Date (date + time)) to date
    query = from message in Message, where: type(message.inserted_at, :date) == ^today
    # ^ is a pin operator
    Repo.all(query)
  end

end
