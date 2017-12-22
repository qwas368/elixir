defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = start_supervised KV.Registry
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    IO.inspect "test 1"
    assert KV.Registry.lookup(registry, "shopping") == :error

    IO.inspect "test 2"
    KV.Registry.create(registry, "shopping") # call
    assert {:ok, bucket} = KV.Registry.lookup(registry, "shopping") # case

    IO.inspect "test 3"
    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1

    IO.inspect "test 4"
    Agent.stop(bucket)

    IO.inspect "test 5"
    KV.Registry.stop(registry)
  end

  test "removes buckets on exit", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :normal)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end
end
