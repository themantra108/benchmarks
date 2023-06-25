module benchmarks

export run_command

function build_program(file::AbstractString, lang::Symbol)
    if lang == :rust
        cmd = `rustc $file`
    elseif lang == :go
        cmd = `go build $file`
    else
        error("Unsupported language: $lang")
    end
    run(cmd)
end

function execute_program(file::AbstractString, lang::Symbol)
    if lang == :rust || lang == :go
        cmd = `./$file`
    elseif lang == :python
        cmd = `python $file`
    elseif lang == :julia
        cmd = `julia $file`
    else
        error("Unsupported language: $lang")
    end
    run(cmd)
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
