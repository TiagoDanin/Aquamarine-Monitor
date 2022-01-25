defmodule Aquamarine.IncomesTest do
  use Aquamarine.DataCase

  alias Aquamarine.Incomes

  describe "incomes" do
    alias Aquamarine.Incomes.Income

    import Aquamarine.IncomesFixtures

    @invalid_attrs %{amount: nil, datetime: nil, description: nil}

    test "list_incomes/0 returns all incomes" do
      income = income_fixture()
      assert Incomes.list_incomes() == [income]
    end

    test "get_income!/1 returns the income with given id" do
      income = income_fixture()
      assert Incomes.get_income!(income.id) == income
    end

    test "create_income/1 with valid data creates a income" do
      valid_attrs = %{amount: 120.5, datetime: ~U[2022-01-24 22:12:00Z], description: "some description"}

      assert {:ok, %Income{} = income} = Incomes.create_income(valid_attrs)
      assert income.amount == 120.5
      assert income.datetime == ~U[2022-01-24 22:12:00Z]
      assert income.description == "some description"
    end

    test "create_income/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Incomes.create_income(@invalid_attrs)
    end

    test "update_income/2 with valid data updates the income" do
      income = income_fixture()
      update_attrs = %{amount: 456.7, datetime: ~U[2022-01-25 22:12:00Z], description: "some updated description"}

      assert {:ok, %Income{} = income} = Incomes.update_income(income, update_attrs)
      assert income.amount == 456.7
      assert income.datetime == ~U[2022-01-25 22:12:00Z]
      assert income.description == "some updated description"
    end

    test "update_income/2 with invalid data returns error changeset" do
      income = income_fixture()
      assert {:error, %Ecto.Changeset{}} = Incomes.update_income(income, @invalid_attrs)
      assert income == Incomes.get_income!(income.id)
    end

    test "delete_income/1 deletes the income" do
      income = income_fixture()
      assert {:ok, %Income{}} = Incomes.delete_income(income)
      assert_raise Ecto.NoResultsError, fn -> Incomes.get_income!(income.id) end
    end

    test "change_income/1 returns a income changeset" do
      income = income_fixture()
      assert %Ecto.Changeset{} = Incomes.change_income(income)
    end
  end
end
