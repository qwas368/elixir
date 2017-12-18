defmodule Test do
  defmodule Test.Struct do
    defstruct fields: [] , field_types: [], results: []
    @type t :: %Test.Struct{fields: List, field_types: List, results: List}
  end
  def testf do
    ts = %Test.Struct{
      :fields => [],
      :results => []
    }
  end
end

IO.inspect Test.testf
