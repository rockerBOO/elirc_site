defmodule ElircSite.PageController do
  use ElircSite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  # collect email
  def save_email(conn, %{"email" => email}) do
    mongo = Mongo.connect!

    emails = mongo
      |> Mongo.db("elirc_site")
      |> Mongo.Db.collection("emails")

    %{email: email}
      |> Mongo.Collection.insert_one(emails)
      |> elem(1)
      |> IO.inspect

    redirect conn, to: "/"
  end
end
