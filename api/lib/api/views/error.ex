defmodule API.Views.Error do
  def render("422.json", %{error: error}) do
    %{
      code: 422,
      message: "422 - Unprocessable Entity",
      error: error
    }
  end
end
