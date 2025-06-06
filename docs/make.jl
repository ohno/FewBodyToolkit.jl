using FewBodyToolkit, Documenter, Literate, DocumenterCitations, Plots, Antique, Interpolations

bib = CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"))

# Convert example scripts to markdown
Literate.markdown("examples/example1D.jl", joinpath(@__DIR__, "src"), name="example1D",flavor=Literate.DocumenterFlavor())
Literate.markdown("examples/example2D.jl", joinpath(@__DIR__, "src"), name="example2D",flavor=Literate.DocumenterFlavor())
Literate.markdown("examples/example3D.jl", joinpath(@__DIR__, "src"), name="example3D",flavor=Literate.DocumenterFlavor())
Literate.markdown("examples/3B1D_23body.jl", joinpath(@__DIR__, "src"), name="3B1D_23body",flavor=Literate.DocumenterFlavor())
Literate.markdown("examples/1D_2+1.jl", joinpath(@__DIR__, "src"), name="1D_2+1",flavor=Literate.DocumenterFlavor())
Literate.markdown("examples/ISGL_HD+.jl", joinpath(@__DIR__, "src"), name="ISGL_HD+",flavor=Literate.DocumenterFlavor())


DocMeta.setdocmeta!(FewBodyToolkit, :DocTestSetup, :(using FewBodyToolkit); recursive=true)

makedocs(;
  sitename   = "FewBodyToolkit.jl",
  modules    = [FewBodyToolkit],
  format     = Documenter.HTML(;
    canonical = "https://lhapp27.github.io/FewBodyToolkit.jl",
    edit_link = "main",
    assets    = String[],
  ),
  pages      = [
    "Home" => "index.md",
    "Basis Functions" => "BasisFunctions.md",
     "Examples" => [
            "Overview" => "examples.md",
            "2B: Example 1D" => "example1D.md",
            "2B: Example 2D" => "example2D.md",
            "2B: Example 3D" => "example3D.md",
            "3B1D: Consistency with 2-body" => "3B1D_23body.md",
            "3B1D: 2+1 system" => "1D_2+1.md",
            "3B3D: HD+ system" => "ISGL_HD+.md",
        ],
    "API"  => "api.md",
    "References" => "references.md",
  ],
  plugins=[bib],
)

deploydocs(;
    repo = "github.com/lhapp27/FewBodyToolkit.jl.git",
    devbranch = "main",
)