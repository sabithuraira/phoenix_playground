defmodule FirstApp.HelloController do
  use FirstApp.Web, :controller

  plug :assign_welcome_message, "Welcome Back"

  defp assign_welcome_message(conn, msg) do
	  assign(conn, :message, msg)
	end

  def index(conn, _params) do
  	conn
    #|> put_flash(:info, "Welcome to Phoenix, from flash info!")
    #|> put_flash(:error, "Let's pretend we have an error.")
    #|> put_layout(false)
    |> put_layout("second.html")
    |> render("index.html")
    #render conn, "index.html"
  end

  	def showtext(conn, %{"id" => id}) do
	  text conn, "Showing id #{id}"
	end


  	def showjson(conn, %{"id" => id}) do
	  json conn, %{id: id}
	end

	def showhtml(conn, %{"id" => id}) do
	  html conn, """
	     <html>
	       <head>
	          <title>Passing an Id</title>
	       </head>
	       <body>
	         <p>You sent in id #{id}</p>
	       </body>
	     </html>
	    """
	end

  def show(conn, %{"messenger" => messenger}) do
	  render conn, "show.html", nama: messenger
	end

	def api_json(conn, _params) do
	  	pages = [%{title: "foo"}, %{title: "bar"}]
	    render conn, "apijson.json", pages: pages
	end
end
