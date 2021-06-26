defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      response =
        conn
        |> get(Routes.imc_test(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Dani" => 23.671874999999996,
          "Diego" => 23.197828557000378,
          "Gabu" => 22.857142857142858,
          "Rafael" => 24.897060231734173,
          "Rodrigo" => 26.358024691358025
        }
      }

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.imc_test(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
