using Documenter
using MakiePotts

makedocs(
    sitename = "MakiePotts.jl",
    authors = "Praneeth Merugu",
    modules = [MakiePotts],
    doctest = true,
    warnonly = false,
    pagesonly = true,
    checkdocs = :exports,
    remotes = nothing,
    format = Documenter.HTML(
        repolink = "https://github.com/PraneethMerugu/MakiePotts.jl",
    ),
    pages = ["Home" => "index.md", "API" => "api/makiepotts.md"],
)
