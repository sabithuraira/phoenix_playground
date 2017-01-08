defmodule FirstApp.User do
  use FirstApp.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :birth, Ecto.Date
    field :age, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :birth, :age])
    |> validate_required([:name, :email, :birth, :age])
    |> validate_length(:name, min: 3)
    |> validate_length(:email, min: 5)
    |> validate_format(:email, ~r/@/, message: "Please fix your email format")
  end
end
