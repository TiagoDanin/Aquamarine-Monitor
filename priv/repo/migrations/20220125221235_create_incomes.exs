defmodule Aquamarine.Repo.Migrations.CreateIncomes do
  use Ecto.Migration

  def change do
    create table(:incomes) do
      add :description, :string
      add :datetime, :utc_datetime
      add :amount, :float

      timestamps()
    end
  end
end
