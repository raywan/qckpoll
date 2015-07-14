defmodule Qckpoll.PollController do
  use Qckpoll.Web, :controller

  alias Qckpoll.Poll

  plug :scrub_params, "poll" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    poll = Poll |> Repo.all
    render(conn, "index.html", poll: poll)
  end

  def new(conn, _params) do
    changeset = Poll.changeset(%Poll{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"poll" => poll_params}) do
    changeset = Poll.changeset(%Poll{}, poll_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Poll created successfully.")
      |> redirect(to: poll_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poll = Poll |> Repo.all
    render(conn, "show.html", poll: poll)
  end

  def edit(conn, %{"id" => id}) do
    poll = Repo.get(Poll, id)
    changeset = Poll.changeset(poll)
    render(conn, "edit.html", poll: poll, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poll" => poll_params}) do
    poll = Repo.get(Poll, id)
    changeset = Poll.changeset(poll, poll_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Poll updated successfully.")
      |> redirect(to: poll_path(conn, :index))
    else
      render(conn, "edit.html", poll: poll, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poll = Repo.get(Poll, id)
    Repo.delete(poll)

    conn
    |> put_flash(:info, "Poll deleted successfully.")
    |> redirect(to: poll_path(conn, :index))
  end
end
