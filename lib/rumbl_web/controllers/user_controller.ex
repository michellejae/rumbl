defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Accounts
  alias Rumbl.Accounts.User
  # this basically says make sure we authenicate on these two kind of requests
  plug :authenticate_user when action in [:index, :show]
# controller defines all the CRUD options we set in router (get, delete, post, put)
# calls on accounts context's to get data from it
# then calls render for template
  def index(conn, _params) do
      users = Accounts.list_users()
      render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_registration(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
    {:ok, user} ->
      conn
      |> RumblWeb.Auth.login(user)
      |> put_flash(:info, "#{user.name} created!")
      |> redirect(to: Routes.user_path(conn, :index))
    {:error, %Ecto.Changeset{} = changeset} ->
      # this is leterally calling the tempplate and passing in the failed validations
      render(conn, "new.html", changeset: changeset)
    end
  end



end
