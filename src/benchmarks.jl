module benchmarks

using BenchmarkTools

function run_hello_world_benchmark(language::String, extension::String)
    script_path = "script/$language/helloworld.$extension"
    if isfile(script_path)
        @info "Benchmarking $language Hello World:"
        @benchmark run(`$language $script_path`) setup=(BenchmarkTools.compilecache())
    else
        @warn "No Hello World script found for $language"
    end
end

function run_fibonacci_benchmark(language::String, extension::String)
    script_path = "script/$language/fibonacci.$extension"
    if isfile(script_path)
        @info "Benchmarking $language Fibonacci:"
        @benchmark run(`$language $script_path`) setup=(BenchmarkTools.compilecache())
    else
        @warn "No Fibonacci script found for $language"
    end
end

function run_mandelbrot_benchmark(language::String, extension::String)
    script_path = "script/$language/mandelbrot.$extension"
    if isfile(script_path)
        @info "Benchmarking $language Mandelbrot:"
        @benchmark run(`$language $script_path`) setup=(BenchmarkTools.compilecache())
    else
        @warn "No Mandelbrot script found for $language"
    end
end

function benchmark_all()
    languages = readdir("script")
    for language in languages
        extension = get_file_extension(language)
        if !isempty(extension)
            run_hello_world_benchmark(language, extension)
            run_fibonacci_benchmark(language, extension)
            run_mandelbrot_benchmark(language, extension)
        else
            @warn "Unsupported language: $language"
        end
    end
end

function get_file_extension(language::String)
    if language == "go"
        return "go"
    elseif language == "rust"
        return "rs"
    elseif language == "python"
        return "py"
    else
        return ""
    end
end

end
