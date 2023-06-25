module benchmarks

export run_command

function build_program(file::AbstractString, lang::Symbol)
    if lang == :rust
        # Build Rust program
        cmd = `rustc $file`
        run(cmd)
    elseif lang == :go
        # Build Go program
        cmd = `go build $file`
        run(cmd)
    else
        error("Unsupported language: $lang")
    end
end

function execute_program(file::AbstractString, lang::Symbol)
    if lang == :rust || lang == :go
        # Execute Rust or Go program
        cmd = `./hello_world`
        run(cmd)
    elseif lang == :python
        # Execute Python program
        cmd = `python $file`
        run(cmd)
    elseif lang == :julia
        # Execute Julia program
        cmd = `julia $file`
        run(cmd)
    else
        error("Unsupported language: $lang")
    end
end

function run_language(lang::Symbol, file::AbstractString)
    build_program(file, lang)
    execute_program(file, lang)
end

function run_command()
    language_folders = ["rust", "go", "python", "julia"]
    
    for lang in language_folders
        files = readdir(joinpath(@__DIR__, lang))
        for file in files
            file_path = joinpath(@__DIR__, lang, file)
            @time run_language(Symbol(lang), file_path)
        end
    end
end

end  # module benchmarks
