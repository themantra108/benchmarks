function run_hello_world_benchmark(language::String, extension::String)
    script_dir = dirname(@__FILE__)
    script_path = joinpath(script_dir, "script", language, "helloworld.$extension")
    if isfile(script_path)
        @info "Running $language Hello World:"
        if language == "rust"
            run(`rustc --crate-name helloworld $script_path -o $script_dir/script/$language/helloworld`)
            run(`$script_dir/script/$language/helloworld`)
        elseif language == "julia"
            run(`julia --project=$script_dir $script_path`)
        elseif language == "python"
            run(`python $script_path`)
        else
            run(`$language $script_path`)
        end
    else
        @warn "No Hello World script found for $language"
    end
end
