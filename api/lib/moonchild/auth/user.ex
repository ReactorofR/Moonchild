defmodule Moonchild.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias  Moonchild.Auth.User
  alias Comeonin.Argon2


  schema "users" do
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password_hash])
    |> validate_required([:username, :password_hash])
    |> put_pass_hash()
  end
  
  defp put_pass_hash (%Ecto.Changeset{valid?: true, changes: %{password_hash: password_hash}} = changeset) do
    change(changeset, password_hash: Argon2.hashpwsalt(password_hash))
  end
  defp put_pass_hash(chageset), do: changeset
end
