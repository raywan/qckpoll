defmodule QckpollSpike.Poll do
  use QckpollSpike.Web, :model

  schema "polls" do
    field :title, :string
    field :author, :string

    timestamps
  end

  @required_fields ~w(title author)
  @optional_fields ~w()

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
