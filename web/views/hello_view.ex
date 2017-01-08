defmodule FirstApp.HelloView do
  use FirstApp.Web, :view

  def render("apijson.json", %{pages: pages}) do
  	#IO.inspect(pages, limit: :infinity)
    %{data: render_many(pages, FirstApp.HelloView, "page.json", as: :page)}
   	#we can use this for alternative
   	#Enum.map(pages, fn page ->
	#  render(FirstApp.HelloView, "page.json", page: page)
	#end)
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
end
