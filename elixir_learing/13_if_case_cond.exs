x = :rand.uniform(5)
IO.puts x
case x do
  1 -> IO.puts "nice!"
  2 -> IO.puts "vary nice!"
  3 -> IO.puts "mm..... vary nice!"
  _ -> IO.puts "default"
end

cond do
  2 == 2 -> IO.puts "mm....."
  1 == 1 -> IO.puts "nice!" # not run
end

if 1==1 do
  IO.puts "mm....."
end
