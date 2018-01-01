defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn(c, acc) -> if c == nucleotide do
      acc + 1
    else
      acc
    end end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0},
    fn(c, acc) -> case c do
      ?A -> %{acc | ?A => acc[?A] + 1}
      ?T -> %{acc | ?T => acc[?T] + 1}
      ?C -> %{acc | ?C => acc[?C] + 1}
      ?G -> %{acc | ?G => acc[?G] + 1}
    end end)
  end
end

IO.inspect NucleotideCount.count('GGGGGTAACCCGG', ?T)
