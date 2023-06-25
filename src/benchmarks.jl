module benchmarks

const PKGDIR = pkgdir(benchmarks)

export run_command

function run_rust(filename::String)
    # Specify the path to the Rust file
    rust_file = joinpath(PKGDIR, "script", "rust", "$filename.rs")

    # Build Rust program
    cmd = `rustc $rust_file`
    run(cmd)
    
    # Execute Rust program
    cmd = `./$filename`
    run(cmd)
end

function run_go(filename::String)
    # Specify the path to the Go file
    go_file = joinpath(PKGDIR, "script", "go", "$filename.go")
    
    # Build Go program
    cmd = `go build $go_file`
    run(cmd)
    
    # Execute Go program
    cmd = `./$filename`
    run(cmd)
end

function run_python(filename::String)
    # Specify the path to the Python file
    python_file = joinpath(PKGDIR, "script", "python", "$filename.py")
    
    # Execute Python program
    cmd = `python3 $python_file`
    run(cmd)
end

function run_julia(filename::String)
    # Specify the path to the Julia file
    julia_file = joinpath(PKGDIR, "script", "julia", "$filename.jl")
    
    # Execute Julia program
    cmd = `julia $julia_file`
    run(cmd)
end

files = ["hello_world"]

function run_command()
    # Run benchmarks
    for file in files
        @time run_rust(file)
        @time run_go(file)
        @time run_python(file)
        @time run_julia(file)
    end
end

end  # module benchmarks
