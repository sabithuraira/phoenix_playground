defmodule FirstApp.UserTest do
  use FirstApp.ModelCase

  alias FirstApp.User

  @valid_attrs %{age: 42, birth: %{day: 17, month: 4, year: 2010}, email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
