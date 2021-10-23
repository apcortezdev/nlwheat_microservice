defmodule HeatTags.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    # this migration runs all changes stipulated here
    create table(:messages) do
      add :message, :string # field message type string
      add :username, :string # field username type string
      add :email, :string # field email type string

      timestamps() # add a inserted_at and updated_at w/ timestamps
    end
  end
end
