defmodule AquamarineWeb.IncomeController do
  use AquamarineWeb, :controller
  alias Aquamarine.{Incomes, Incomes.Income}

  def create(conn, %{"income" => income} = _params) do
    {:ok, %Income{} = income} = Incomes.create_income(income)

    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.income_path(conn, :show, income))
    |> render("show.json", income: income)

    IO.inspect income
  end

  def show(conn, %{"id" => id} = _params) do
    income = Incomes.get_income!(id)

    conn
    |> put_status(:ok)
    |> render("show.json", income: income)
  end

  def index(conn, params) do
    incomes = Incomes.list_incomes()

    conn
    |> put_status(:ok)
    |> render("index.json", incomes: incomes)
  end
end
