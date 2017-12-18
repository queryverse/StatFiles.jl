using FileIO
using StatFiles
using IteratorInterfaceExtensions
using TableTraits
using NamedTuples
using DataValues
using Base.Test

@testset "StatFiles" begin

ar = load("types.dta") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == @NT(vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == @NT(vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == @NT(vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))


ar = load("types.sas7bdat") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == @NT(vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == @NT(vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == @NT(vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))


ar = load("types.sav") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == @NT(vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == @NT(vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == @NT(vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))

end
