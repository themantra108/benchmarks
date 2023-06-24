module benchmarks

using BenchmarkTools
using Filesystem

# Benchmark function for running a command and measuring its execution time
function benchmark_run_command(command::AbstractString)
    result = @timed run(command; wait = true)
    return result
end

# Function to run the Hello World benchmarks
function run_hello_world_benchmarks(folder::AbstractString)
    file_paths = readdir(folder)
    for file_path in file_paths
        full_path = joinpath(folder, file_path)
        ext = Filesystem.extension(full_path)
        language = ext[2:end]

        println("Benchmarking $language Hello World:")
        benchmark_result = benchmark_run_command(full_path)
        println(benchmark_result)
    end
end

# Function to run the Fibonacci benchmarks
function run_fibonacci_benchmarks(folder::AbstractString, n::Int)
    file_paths = readdir(folder)
    for file_path in file_paths
        full_path = joinpath(folder, file_path)
        ext = Filesystem.extension(full_path)
        language = ext[2:end]

        println("Benchmarking $language Fibonacci for n = $n:")
        command = "$full_path $n"
        benchmark_result = benchmark_run_command(command)
        println(benchmark_result)
    end
end

# Function to run the Mandelbrot benchmarks
function run_mandelbrot_benchmarks(folder::AbstractString, width::Int, height::Int)
    file_paths = readdir(folder)
    for file_path in file_paths
        full_path = joinpath(folder, file_path)
        ext = Filesystem.extension(full_path)
        language = ext[2:end]

        println("Benchmarking $language Mandelbrot for width = $width, height = $height:")
        command = "$full_path $width $height"
        benchmark_result = benchmark_run_command(command)
        println(benchmark_result)
    end
end

# Function to run all benchmarks
function benchmark_all()
    script_folder = "script"

    println("Running Hello World Benchmarks:")
    run_hello_world_benchmarks(joinpath(script_folder, "julia"))
    run_hello_world_benchmarks(joinpath(script_folder, "python"))
    run_hello_world_benchmarks(joinpath(script_folder, "rust"))
    run_hello_world_benchmarks(joinpath(script_folder, "go"))

    println("Running Fibonacci Benchmarks:")
    run_fibonacci_benchmarks(joinpath(script_folder, "julia"), 30)
    run_fibonacci_benchmarks(joinpath(script_folder, "python"), 30)
    run_fibonacci_benchmarks(joinpath(script_folder, "rust"), 30)
    run_fibonacci_benchmarks(joinpath(script_folder, "go"), 30)

    println("Running Mandelbrot Benchmarks:")
    run_mandelbrot_benchmarks(joinpath(script_folder, "julia"), 800, 600)
    run_mandelbrot_benchmarks(joinpath(script_folder, "python"), 800, 600)
    run_mandelbrot_benchmarks(joinpath(script_folder, "rust"), 800, 600)
    run_mandelbrot_benchmarks(joinpath(script_folder, "go"), 800, 600)

    println("All benchmarks completed.")
end

end
