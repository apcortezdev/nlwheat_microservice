# Define a module
defmodule HeatTags.Message do
  # inherites Ecto.Schema
  use Ecto.Schema

  # import module
  import Ecto.Changeset

  # Declare a module var (local)
  @required_params [:message, :username, :email]

  # Declare how this struct must be rendered as JSON when required
  # operator ++ concats 2 arrays
  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  # Define schema
  schema "messages" do
    # field message type string
    field(:message, :string)
    # field username type string
    field(:username, :string)
    # field email type string
    field(:email, :string)

    # add a inserted_at and updated_at w/ timestamps
    timestamps()
  end

  # Defines a changeset
  def changeset(params) do
    # __MODULE__ is same as HeatTags.Message
    %__MODULE__{}
    # this calls a func cast() from Ecto.Changeset that maps values from params
    # to the schema we are %HeatTags.Message{}
    |> cast(params, @required_params)
    # calls a func validate_required() from Ecto.Changeset tells Ecto that
    # fields defined in @required_params must be validated as NOT NULL
    |> validate_required(@required_params)
    # validate length for field message
    |> validate_length(:message, min: 1, max: 140)
    # validate format to email (change the regex for the email validation regex)
    |> validate_format(:email, ~r/@/)
  end
end
