# compile.jl

# Language-specific compile commands
const COMPILE_COMMANDS = Dict(
    "rust" => "cd script/languages/rust && cargo build --release",
    "go" => "cd script/languages/go && go build -o hello"
)

function compile_programs()
    for (lang, compile_cmd) in COMPILE_COMMANDS
        println("Compiling $lang...")
        run(compile_cmd)
        println("Compilation complete for $lang.")
        println()
    end
end

# Run the compilation process
compile_programs()
