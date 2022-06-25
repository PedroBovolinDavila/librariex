defmodule Librariex.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def invalid_id_format_error, do: build(:bad_request, "Invalid id format!")
  def user_not_found_error, do: build(:not_found, "User not found!")
end
