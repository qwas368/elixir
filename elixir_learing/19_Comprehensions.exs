# IO.inspect for n <- [1,2,3], do: n*n
# {:ok, current_dir} = File.cwd
# dirs = [current_dir]
# for dir <- dirs,
#     file <- File.ls!(dir),
#     path = Path.join(dir, file),
#     path2 = path,
#     File.regular?(path) do
#         IO.inspect File.stat!(path2).size
#     end
#
# IO.inspect  [{:a, 1}, {:b, 2}]
#
# n = 12
# result =  for a <- 1..n-2,
#           b <- a+1..n-1,
#           c <- b+1..n,
#           a + b >= c,
#           a*a + b*b == c*c,
#           do: {a, b, c}
# IO.inspect result

IO.inspect ?\s

pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
IO.inspect for <<c <- "hello world">>, into: "", do: <<c>>
