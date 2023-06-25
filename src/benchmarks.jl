# benchmark.jl

using BenchmarkTools

# Language-specific run commands
const RUN_COMMANDS = Dict(
    "python" => "python script/languages/python/hello.py",
    "rust" => "./script/languages/rust/hello",
    "go" => "./script/languages/go/hello"
)

function benchmark_programs()
    for (lang, run_cmd) in RUN_COMMANDS
        println("Benchmarking $lang...")
        time = @elapsed run(run_cmd)
        println("Execution time for $lang: $time seconds.")
        println()
    end
end

# Run the benchmarking process
benchmark_programs()
