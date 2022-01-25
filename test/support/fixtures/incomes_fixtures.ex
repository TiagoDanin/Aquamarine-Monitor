defmodule Aquamarine.IncomesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aquamarine.Incomes` context.
  """

  @doc """
  Generate a income.
  """
  def income_fixture(attrs \\ %{}) do
    {:ok, income} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        datetime: ~U[2022-01-24 22:12:00Z],
        description: "some description"
      })
      |> Aquamarine.Incomes.create_income()

    income
  end
end
