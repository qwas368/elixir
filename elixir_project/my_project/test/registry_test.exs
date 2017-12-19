defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = start_supervised KV.Registry
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    IO.inspect "r1"
    assert KV.Registry.lookup(registry, "shopping") == :error

    IO.inspect "r2"
    KV.Registry.create(registry, "shopping") # call
    assert {:ok, bucket} = KV.Registry.lookup(registry, "shopping") # case

    IO.inspect "r3"
    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end
end
