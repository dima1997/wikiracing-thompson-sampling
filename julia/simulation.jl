using ArgParse
using YAML
using JSON

PARSER = ArgParseSettings()
@add_arg_table PARSER begin
    "--config"
        help = "Path to graph configuration file"
        arg_type = String
        default  = "./config/simulation.yaml"
    # "--simulation"
    #     help = "Path to simulation configuration file"
    #     arg_type = String
    #     default  = "./config/simulation.yaml"
end

function main()
    args = parse_args(ARGS, PARSER)
    cfg = YAML.load_file(args["config"])
    graph = nothing
    open(cfg["graph_path"]) do file
        graph = JSON.parse(read(file, String))
    end
    println(graph)
end

main()