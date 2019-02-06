using StatFiles
using IteratorInterfaceExtensions
using TableTraits
using DataValues
using Test

@testset "StatFiles" begin

ar = load("types.dta") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == (vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == (vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == (vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))
@test TableTraits.isiterabletable(ar) == true
@test IteratorInterfaceExtensions.isiterable(ar) == true

ar = load("types.sas7bdat") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == (vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == (vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == (vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))
@test TableTraits.isiterabletable(ar) == true
@test IteratorInterfaceExtensions.isiterable(ar) == true

ar = load("types.sav") |> IteratorInterfaceExtensions.getiterator |> collect

@test length(ar) == 3
@test ar[1] == (vfloat=DataValue{Float32}(3.14), vdouble=DataValue(3.14), vlong=DataValue{Int32}(2), vint=DataValue{Int16}(2), vbyte=DataValue{Int8}(2), vstring=DataValue("2"))
@test ar[2] == (vfloat=DataValue{Float32}(7.), vdouble=DataValue(7.), vlong=DataValue{Int32}(7), vint=DataValue{Int16}(7), vbyte=DataValue{Int8}(7), vstring=DataValue("7"))
@test ar[3] == (vfloat=DataValue{Float32}(), vdouble=DataValue{Float64}(), vlong=DataValue{Int32}(), vint=DataValue{Int16}(), vbyte=DataValue{Int8}(), vstring=DataValue(""))
@test TableTraits.isiterabletable(ar) == true
@test IteratorInterfaceExtensions.isiterable(ar) == true

end

@testset "Show" begin

ar = load("types.dta")

@test sprint((stream,data)->show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2</td><td>2</td><td>2</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7</td><td>7</td><td>7</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"

ar = load("types.sas7bdat")

@test sprint((stream,data)->show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2.0</td><td>2.0</td><td>2.0</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"

ar = load("types.sav")

@test sprint((stream,data)->show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2.0</td><td>2.0</td><td>2.0</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"

end
