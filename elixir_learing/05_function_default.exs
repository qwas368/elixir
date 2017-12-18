defmodule Default do
  def function(name \\ "GG") do
    if name == "GG" do
      IO.puts("haha, this is GG")
    else
      IO.puts("oh, mmmm.......")
    end
  end
end

Default.function
Default.function(G)
