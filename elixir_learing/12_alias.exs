#  ===============================================
defmodule Girl.Sister do
  def wanna do
    IO.puts(:stdio, "wanna sister")
  end
end

alias Girl.Sister
Sister.wanna
#  ==============================================
import List, only: [delete: 2]
# first([1, 2, 3]) <-- compile error
IO.inspect delete([1,2,3], 1)
