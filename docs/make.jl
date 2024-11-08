
using Documenter


# English docs
makedocs(;
    #modules=[YukiNagai],
    authors="Yuki Nagai <cometscome@gmail.com>",
    repo="https://github.com/cometscome/YukiNagai/blob/{commit}{path}#L{line}",
    sitename="Yuki Nagai",
    doctest=false,
    format=Documenter.HTML(;
        prettyurls=true,
        canonical="https://cometscome.github.io",
        assets=String[],
        lang="en",
    ),
    source="src_en",
    build="build_en",
    pages=[
        "Home" => "index.md",
        #"PDF documents" => "pdf.md",
        #"History" => "history.md",
        #"SNS and etc." => "sns.md",
        #"GitHub pages" => "githubpages.md",
    ],
)

# Japanese docs
makedocs(;
    #modules=[YukiNagai],
    authors="Yuki Nagai <cometscome@gmail.com>",
    repo="https://github.com/cometscome/YukiNagai/blob/{commit}{path}#L{line}",
    sitename="Yuki Nagai",
    doctest=false,
    format=Documenter.HTML(;
        prettyurls=true,
        canonical="https://cometscome.github.io",
        assets=String[],
        lang="ja",
    ),
    source="src_ja",
    build="build_ja",
    pages=[
        "Home" => "index.md",
        #    "CV" => "cv.md",
        #    "これまでやってきたこと" => "koremade.md",
        #    "物理ノート" => "notes.md",
        "著書サポート" => [
            "1週間で学べる！　Julia数値計算プログラミング(KS情報科学専門書)" => "books/greenjulia.md",
            "Juliaではじめる数値計算入門" => "books/GihyoJulia/gihyojulia.md",
        ],
    ],
)

#=
for (root, dirs, files) in (walkdir("docs/build_en") ∪ walkdir("docs/build_ja"))
    for file in files
        if file == "index.html"
            path_html = joinpath(root, file)
            script = read(path_html, String)
            script = replace(script, ">Version<" => ">Language / 言語<")
            write(path_html, script)
        end
    end
end
=#


deploydocs(;
    target="build_en",
    devurl="en",
    repo="github.com/cometscome/YukiNagai"
)

deploydocs(;
    target="build_ja",
    devurl="ja",
    repo="github.com/cometscome/YukiNagai"
)