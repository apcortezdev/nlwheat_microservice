# Defines a module responsible for creating and saving a message
defmodule  HeatTags.Messages.Create do
  # create alias: HeatTags.Messages as Message and HeatTags.Repo as Repo
  alias HeatTags.{Message, Repo}

  def call(params) do
    params
    |> Message.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  # defines a private (local) function named handle_insert w/ 2 different signatures:
  # check out elixir patterns match for details on = operator
  # if param is as tuple {:ok, %Message{}, do return result
  defp handle_insert({:ok, %Message{}} = result), do: result
  # if param is as tuple {:error, anything, do return tuple {:error, %{result: result, status: :bad_request}}
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
  # this is a short for:
  #   defp handle_insert({:ok, %Message{}} = result) do
  #     result
  #   end
end
