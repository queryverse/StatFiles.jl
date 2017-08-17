using FileIO
using TableTraits
using IterableTables
using DataFrames
using Base.Test

@testset "StatFiles" begin

df = load("types.dta") |> DataFrame

@test size(df) == (3,6)

df = load("types.sas7bdat") |> DataFrame

@test size(df) == (3,6)

df = load("types.sav") |> DataFrame

@test size(df) == (3,6)

# df = load("types.por") |> DataFrame

# @test size(df) == (3,6)

statfile = load("types.dta")

@test isiterable(statfile) == true

end
