defmodule Qckpoll.Poll do
  use Qckpoll.Web, :model

  schema "poll" do
    field :title, :string

    timestamps
  end

  @required_fields ~w(title)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
