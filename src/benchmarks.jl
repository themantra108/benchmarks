module benchmarks

export run_command

const PKGDIR = pkgdir("benchmarks")

function build_rust()
    # Specify the path to hello_world.rs
    rust_file = joinpath(PKGDIR, "hello_world.rs")

    # Build Rust program
    cmd = `rustc $rust_file`
    run(cmd)
end

function run_rust()
    # Execute Rust program
    cmd = `./hello_world`
    run(joinpath(PKGDIR, cmd))
end

function build_go()
    # Specify the path to hello_world.go
    go_file = joinpath(PKGDIR, "hello_world.go")

    # Build Go program
    cmd = `go build $go_file`
    run(cmd)
end

function run_go()
    # Execute Go program
    cmd = `./hello_world`
    run(joinpath(PKGDIR, cmd))
end

function run_python()
    # Specify the path to hello_world.py
    python_file = joinpath(PKGDIR, "hello_world.py")

    # Execute Python program
    cmd = `python $python_file`
    run(cmd)
end

function run_julia()
    # Specify the path to hello_world.jl
    julia_file = joinpath(PKGDIR, "hello_world.jl")

    # Execute Julia program
    cmd = `julia $julia_file`
    run(cmd)
end

function run_command()
    # Build and run benchmarks
    @time build_rust()
    @time run_rust()
    
    @time build_go()
    @time run_go()
    
    @time run_python()
    @time run_julia()
end

end  # module benchmarks
