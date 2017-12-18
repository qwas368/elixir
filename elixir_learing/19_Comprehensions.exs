IO.inspect for n <- [1,2,3], do: n*n
{:ok, current_dir} = File.cwd
dirs = [current_dir]
for dir <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    path2 = path,
    File.regular?(path) do
        IO.inspect File.stat!(path2).size
    end
