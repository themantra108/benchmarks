module benchmarks

export run_command

function run_rust()
    # Specify the path to hello_world.rs
    rust_file = joinpath(@__DIR__, "hello_world.rs")

    # Build Rust program
    cmd = `rustc $rust_file`
    run(cmd)
    
    # Execute Rust program
    cmd = `./hello_world`
    run(cmd)
end

function run_go()
    # Build Go program
    cmd = `go build hello_world.go`
    run(cmd)
    
    # Execute Go program
    cmd = `./hello_world`
    run(cmd)
end

function run_python()
    # Execute Python program
    cmd = `python hello_world.py`
    run(cmd)
end

function run_julia()
    # Execute Julia program
    cmd = `julia hello_world.jl`
    run(cmd)
end

function run_command()
    # Run benchmarks
    @time run_rust()
    # @time run_go()
    @time run_python()
    @time run_julia()
end

end  # module benchmarks
