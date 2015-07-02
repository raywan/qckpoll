defmodule Qckpoll.PollTest do
  use Qckpoll.ModelCase

  alias Qckpoll.Poll

  @valid_attrs %{title: "some content", user: nil}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Poll.changeset(%Poll{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Poll.changeset(%Poll{}, @invalid_attrs)
    refute changeset.valid?
  end
end
