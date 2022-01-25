defmodule AquamarineWeb.IncomeView do
  use AquamarineWeb, :view

  def render("index.json", %{incomes: incomes}) do
    %{data: render_many(incomes, __MODULE__, "income.json")}
  end

  def render("show.json", %{income: income}) do
    %{data: render_one(income, __MODULE__, "income.json")}
  end

  def render("income.json", %{income: income}) do
    %{
      id: income.id,
      description: income.description,
      datetime: income.datetime,
      amount: income.amount
    }
  end
end
