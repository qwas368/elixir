# haha this is not tuple
%{one: variable1, two: variable2} = %{one: 1, two: 2}
IO.puts variable1+variable2

# this is tuple
{:one, :two, variable3} = {:one, :two, 3}
IO.puts variable3
