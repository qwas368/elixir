defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    count_different_nucleotides(strand1, strand2)
  end

  def count_different_nucleotides(strand1, strand2, count \\ 0)
  def count_different_nucleotides([strand_h1 | strand_t1], [strand_h2 | strand_t2], count) do
    cond do
      strand_h1 == strand_h2 -> count_different_nucleotides(strand_t1, strand_t2, count)
      true -> count_different_nucleotides(strand_t1, strand_t2, count + 1)
    end
  end
  def count_different_nucleotides([], [], count), do: {:ok, count}
  def count_different_nucleotides([], _strand2, _count), do: {:error, "Lists must be the same length"}
  def count_different_nucleotides(_strand1, [], _count), do: {:error, "Lists must be the same length"}
end
