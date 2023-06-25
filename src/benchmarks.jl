module benchmarks

export run_command

function build_languages(languages::Vector{String})
    for language in languages
        folder = joinpath(@__DIR__, language)
        for file in readdir(folder)
            path = joinpath(folder, file)
            if !isdir(path)
                if language == "rust"
                    cmd = `rustc $path`
                    run(cmd)
                elseif language == "go"
                    cmd = `go build $path`
                    run(cmd)
                end
            end
        end
    end
end

function run_languages(languages::Vector{String})
    for language in languages
        folder = joinpath(@__DIR__, language)
        for file in readdir(folder)
            path = joinpath(folder, file)
            if !isdir(path)
                if language == "rust"
                    cmd = `./$(basename(file, ".rs"))`
                    run(cmd)
                elseif language == "go"
                    cmd = `./$(basename(file, ".go"))`
                    run(cmd)
                elseif language == "python"
                    cmd = `python $path`
                    run(cmd)
                elseif language == "julia"
                    cmd = `julia $path`
                    run(cmd)
                end
            end
        end
    end
end

function run_command()
    languages = ["rust", "go", "python", "julia"]

    @time build_languages(languages)
    @time run_languages(languages)
end

end  # module benchmarks
