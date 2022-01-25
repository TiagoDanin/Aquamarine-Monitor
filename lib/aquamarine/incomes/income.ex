defmodule Aquamarine.Incomes.Income do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incomes" do
    field :amount, :float
    field :datetime, :utc_datetime
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(income, attrs) do
    income
    |> cast(attrs, [:description, :datetime, :amount])
    |> validate_required([:description, :datetime, :amount])
  end
end
