doc = Inspect.Algebra.concat(Inspect.Algebra.empty, "fasdfaadfsdfasfasfdoo")
doc = Inspect.Algebra.glue("olá", " ", "mundo")
doc = Inspect.Algebra.group(doc)
doc
|> Inspect.Algebra.format(10000)
|> IO.inspect
|> IO.iodata_to_binary()
|> IO.inspect
