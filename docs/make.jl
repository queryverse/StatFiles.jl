using Documenter, StatFiles

makedocs(
	modules=[StatFiles],
	sitename="StatFiles.jl",
	analytics="UA-132838790-1",
	pages=[
        "Introduction" => "index.md"
    ]
)

deploydocs(
    repo="github.com/queryverse/StatFiles.jl.git"
)
