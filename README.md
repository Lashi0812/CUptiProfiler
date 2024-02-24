# Profile the Kernel Using CUpti profiling API

```mermaid
sequenceDiagram
    participant Device
    participant Session
    participant ConfigurationImage as Configuration Image
    participant CounterDataImage as Counter Data Image
    participant Event
    participant Counter
    participant Metric
    participant Pass
    participant Range



    note over ConfigurationImage: Configures Contain desire metric
    note over CounterDataImage: Store the collected metrics

    rect rgb(200, 150, 255) 
        note right of Device: Multiple Sessions
        Device->>Session: Allocates resources
    end


    Session->>CounterDataImage: Contains
    Session->>ConfigurationImage: Contains

    Event->>Counter: Counts occurrences
    Counter->>Metric: Used to calculate

    note over Range: Multiple kernels
    Pass->>Range: Consists of
    loop Multiple Replay
        Replay->>CounterDataImage: Per unique range-stack
    end

    Session->>Replay: Runs series of
```



* **CUDA_INJECTION64_PATH** is set to a shared library
* **INJECTION_KERNEL_COUNT**: This sets the number of kernels in a session
* **INJECTION_METRICS**: This sets the metrics to gather, separated by space, comma,or semicolon.  Default metrics are:
            sm__cycles_elapsed.avg
            gpu__time_duration.sum

```sh
#build example
bazel build //src:reduce 

#build shared lib
bazel build --config=rules_cuda //lib:injection_shared_using_rules_cuda 

#profile
env INJECTION_KERNEL_COUNT=2 CUDA_INJECTION64_PATH=./bazel-bin/lib/libinjection.so bazel-bin/src/reduce 16777216 256 256 1
```

| Range Name | Metric Name               | Metric Value (ns)|
|------------|---------------------------|------------------|
| 0          | gpu__time_duration.sum    | 73920.000000     |
| 1          | gpu__time_duration.sum    | 1472.000000      |
| 0          | sm__cycles_elapsed.avg    | 185964.296875    |
| 1          | sm__cycles_elapsed.avg    | 3650.703125      |
