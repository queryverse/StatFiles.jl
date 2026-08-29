using Documenter, StatFiles

makedocs(
	modules = [StatFiles],
	sitename = "StatFiles.jl",
	format = Documenter.HTML(analytics = "UA-132838790-1"),
	warnonly = [:missing_docs],
	pages = [
        "Introduction" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/queryverse/StatFiles.jl.git"
)
