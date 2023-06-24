module benchmarks

using BenchmarkTools

# Execute a Python script from Julia
function run_python_script(script_path::AbstractString)
    cmd = `python $script_path`
    run(cmd)
end

# Benchmark Hello World script for a specific language
function run_hello_world_benchmark(language::String, extension::String)
    script_path = joinpath("script", language, "helloworld.$extension")
    if isfile(script_path)
        @info "Benchmarking $language Hello World:"
        if language == "rust"
            @benchmark run(`rustc --crate-name helloworld $script_path -o script/$language/helloworld`)
            @benchmark run(`script/$language/helloworld`)
        elseif language == "julia"
            @benchmark run(`julia --project=. $script_path`)
        elseif language == "python"
            @benchmark run_python_script(script_path)
        else
            @benchmark run(`$language $script_path`)
        end
    else
        @warn "No Hello World script found for $language"
    end
end

# Benchmark all Hello World scripts
function benchmark_all()
    languages = ["julia", "python", "go", "rust"]
    extensions = ["jl", "py", "go", "rs"]

    for (language, extension) in zip(languages, extensions)
        run_hello_world_benchmark(language, extension)
    end
end

end  # module benchmarks
