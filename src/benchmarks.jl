module benchmarks

using BenchmarkTools

# Benchmark function for running a command and measuring its execution time
function benchmark_run_command(command::AbstractString)
    result = @timed run(command; wait = true)
    return result
end

# Function to run the Hello World benchmarks for a specific language
function run_hello_world_benchmarks(language::AbstractString)
    script_folder = "script"
    folder = joinpath(script_folder, language)

    file_paths = readdir(folder)
    for file_path in file_paths
        full_path = joinpath(folder, file_path)

        println("Benchmarking $language Hello World:")
        benchmark_result = benchmark_run_command(full_path)
        println(benchmark_result)
    end
end

# Function to run all benchmarks
function benchmark_all()
    languages = ["julia", "python", "rust", "go"]

    println("Running Hello World Benchmarks:")
    for language in languages
        run_hello_world_benchmarks(language)
    end

    println("All benchmarks completed.")
end

end
