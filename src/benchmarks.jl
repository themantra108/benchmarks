module benchmarks

const PKGDIR = pkgdir(benchmarks)

export run_command

function run_rust()
    # Specify the path to hello_world.rs
    rust_file = joinpath(PKGDIR,"script", "rust", "hello_world.rs")

    # Build Rust program
    cmd = `rustc $rust_file`
    run(cmd)
    
    # Execute Rust program
    cmd = `./hello_world`
    run(cmd)
end

function run_go()
    # Specify the path to hello_world.go
    go_file = joinpath(PKGDIR,"script", "go", "hello_world.go")
    
    # Build Go program
    cmd = `go build $go_file`
    run(cmd)
    
    # Execute Go program
    cmd = `./hello_world`
    run(cmd)
end

function run_python()
    # Specify the path to hello_world.py
    python_file = joinpath(PKGDIR,"script", "python", "hello_world.py")
    
    # Execute Python program
    cmd = `python3 $python_file`
    run(cmd)
end

function run_julia()
    # Specify the path to hello_world.jl
    julia_file = joinpath(PKGDIR,"script", "julia", "hello_world.jl")
    
    # Execute Julia program
    cmd = `julia $julia_file`
    run(cmd)
end

function run_command()
    # Run benchmarks
    @time run_rust()
    @time run_go()
    @time run_python()
    @time run_julia()
end

end  # module benchmarks