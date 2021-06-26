defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists return the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Dani" => 23.671874999999996,
           "Diego" => 23.197828557000378,
           "Gabu" => 22.857142857142858,
           "Rafael" => 24.897060231734173,
           "Rodrigo" => 26.358024691358025
         }}

      assert response == expected_response
    end
  end

  test "when the wrong filename is given, returns an error" do
    params = %{"filename" => "banana.csv"}

    response = IMC.calculate(params)

    expected_response = {:error, "Error while opening the file"}

    assert response == expected_response
  end
end
