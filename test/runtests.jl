using FileIO
using IterableTables
using DataFrames
using Base.Test

@testset "StatFiles" begin

df = load(joinpath(Pkg.dir("ReadStat"), "test", "types.dta")) |> DataFrame

@test size(df) == (3,6)

end
