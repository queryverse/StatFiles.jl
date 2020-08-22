using StatFiles
using IteratorInterfaceExtensions
using TableTraits
using DataValues
using Test

@testset "StatFiles" begin

    ar = load("types.dta") |> IteratorInterfaceExtensions.getiterator |> collect

    @test length(ar) == 3
    @test ar[1] == (vfloat = DataValue{Float32}(3.14), vdouble = DataValue(3.14), vlong = DataValue{Int32}(2), vint = DataValue{Int16}(2), vbyte = DataValue{Int8}(2), vstring = DataValue("2"))
    @test ar[2] == (vfloat = DataValue{Float32}(7.), vdouble = DataValue(7.), vlong = DataValue{Int32}(7), vint = DataValue{Int16}(7), vbyte = DataValue{Int8}(7), vstring = DataValue("7"))
    @test ar[3] == (vfloat = DataValue{Float32}(), vdouble = DataValue{Float64}(), vlong = DataValue{Int32}(), vint = DataValue{Int16}(), vbyte = DataValue{Int8}(), vstring = DataValue(""))
    @test TableTraits.isiterabletable(load("types.dta")) == true
    @test IteratorInterfaceExtensions.isiterable(load("types.dta")) == true

    ar = load("types.sas7bdat") |> IteratorInterfaceExtensions.getiterator |> collect

    @test length(ar) == 3
    @test ar[1] == (vfloat = DataValue{Float32}(3.14), vdouble = DataValue(3.14), vlong = DataValue{Int32}(2), vint = DataValue{Int16}(2), vbyte = DataValue{Int8}(2), vstring = DataValue("2"))
    @test ar[2] == (vfloat = DataValue{Float32}(7.), vdouble = DataValue(7.), vlong = DataValue{Int32}(7), vint = DataValue{Int16}(7), vbyte = DataValue{Int8}(7), vstring = DataValue("7"))
    @test ar[3] == (vfloat = DataValue{Float32}(), vdouble = DataValue{Float64}(), vlong = DataValue{Int32}(), vint = DataValue{Int16}(), vbyte = DataValue{Int8}(), vstring = DataValue(""))
    @test TableTraits.isiterabletable(load("types.sas7bdat")) == true
    @test IteratorInterfaceExtensions.isiterable(load("types.sas7bdat")) == true

    ar = load("types.sav") |> IteratorInterfaceExtensions.getiterator |> collect

    @test length(ar) == 3
    @test ar[1] == (vfloat = DataValue{Float32}(3.14), vdouble = DataValue(3.14), vlong = DataValue{Int32}(2), vint = DataValue{Int16}(2), vbyte = DataValue{Int8}(2), vstring = DataValue("2"))
    @test ar[2] == (vfloat = DataValue{Float32}(7.), vdouble = DataValue(7.), vlong = DataValue{Int32}(7), vint = DataValue{Int16}(7), vbyte = DataValue{Int8}(7), vstring = DataValue("7"))
    @test ar[3] == (vfloat = DataValue{Float32}(), vdouble = DataValue{Float64}(), vlong = DataValue{Int32}(), vint = DataValue{Int16}(), vbyte = DataValue{Int8}(), vstring = DataValue(""))
    @test TableTraits.isiterabletable(load("types.sav")) == true
    @test IteratorInterfaceExtensions.isiterable(load("types.sav")) == true

end

@testset "Show" begin

    ar = load("types.dta")

    @test sprint((stream, data) -> show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2</td><td>2</td><td>2</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7</td><td>7</td><td>7</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"
    @test sprint((stream, data) -> show(stream, "application/vnd.dataresource+json", data), ar) ==
"{\"schema\":{\"fields\":[{\"name\":\"vfloat\",\"type\":\"number\"},{\"name\":\"vdouble\",\"type\":\"number\"},{\"name\":\"vlong\",\"type\":\"integer\"},{\"name\":\"vint\",\"type\":\"integer\"},{\"name\":\"vbyte\",\"type\":\"integer\"},{\"name\":\"vstring\",\"type\":\"string\"}]},\"data\":[{\"vfloat\":3.14,\"vdouble\":3.14,\"vlong\":2,\"vint\":2,\"vbyte\":2,\"vstring\":\"2\"},{\"vfloat\":7.0,\"vdouble\":7.0,\"vlong\":7,\"vint\":7,\"vbyte\":7,\"vstring\":\"7\"},{\"vfloat\":null,\"vdouble\":null,\"vlong\":null,\"vint\":null,\"vbyte\":null,\"vstring\":\"\"}]}"
    @test sprint(show, ar) == "3x6 STATA file\nvfloat │ vdouble │ vlong │ vint │ vbyte │ vstring\n───────┼─────────┼───────┼──────┼───────┼────────\n3.14   │ 3.14    │ 2     │ 2    │ 2     │ \"2\"    \n7.0    │ 7.0     │ 7     │ 7    │ 7     │ \"7\"    \n#NA    │ #NA     │ #NA   │ #NA  │ #NA   │ \"\"     "

    @test showable("text/html", ar) == true
    @test showable("application/vnd.dataresource+json", ar) == true

    ar = load("types.sas7bdat")

    @test sprint((stream, data) -> show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2.0</td><td>2.0</td><td>2.0</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"
    @test sprint((stream, data) -> show(stream, "application/vnd.dataresource+json", data), ar) ==
"{\"schema\":{\"fields\":[{\"name\":\"vfloat\",\"type\":\"number\"},{\"name\":\"vdouble\",\"type\":\"number\"},{\"name\":\"vlong\",\"type\":\"number\"},{\"name\":\"vint\",\"type\":\"number\"},{\"name\":\"vbyte\",\"type\":\"number\"},{\"name\":\"vstring\",\"type\":\"string\"}]},\"data\":[{\"vfloat\":3.140000104904175,\"vdouble\":3.14,\"vlong\":2.0,\"vint\":2.0,\"vbyte\":2.0,\"vstring\":\"2\"},{\"vfloat\":7.0,\"vdouble\":7.0,\"vlong\":7.0,\"vint\":7.0,\"vbyte\":7.0,\"vstring\":\"7\"},{\"vfloat\":null,\"vdouble\":null,\"vlong\":null,\"vint\":null,\"vbyte\":null,\"vstring\":\"\"}]}"
    @test sprint(show, ar) == "3x6 SAS file\nvfloat │ vdouble │ vlong │ vint │ vbyte │ vstring\n───────┼─────────┼───────┼──────┼───────┼────────\n3.14   │ 3.14    │ 2.0   │ 2.0  │ 2.0   │ \"2\"    \n7.0    │ 7.0     │ 7.0   │ 7.0  │ 7.0   │ \"7\"    \n#NA    │ #NA     │ #NA   │ #NA  │ #NA   │ \"\"     "

    @test showable("text/html", ar) == true
    @test showable("application/vnd.dataresource+json", ar) == true

    ar = load("types.sav")

    @test sprint((stream, data) -> show(stream, "text/html", data), ar) == "<table><thead><tr><th>vfloat</th><th>vdouble</th><th>vlong</th><th>vint</th><th>vbyte</th><th>vstring</th></tr></thead><tbody><tr><td>3.14</td><td>3.14</td><td>2.0</td><td>2.0</td><td>2.0</td><td>&quot;2&quot;</td></tr><tr><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>7.0</td><td>&quot;7&quot;</td></tr><tr><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>#NA</td><td>&quot;&quot;</td></tr></tbody></table>"
    @test sprint((stream, data) -> show(stream, "application/vnd.dataresource+json", data), ar) ==
"{\"schema\":{\"fields\":[{\"name\":\"vfloat\",\"type\":\"number\"},{\"name\":\"vdouble\",\"type\":\"number\"},{\"name\":\"vlong\",\"type\":\"number\"},{\"name\":\"vint\",\"type\":\"number\"},{\"name\":\"vbyte\",\"type\":\"number\"},{\"name\":\"vstring\",\"type\":\"string\"}]},\"data\":[{\"vfloat\":3.140000104904175,\"vdouble\":3.14,\"vlong\":2.0,\"vint\":2.0,\"vbyte\":2.0,\"vstring\":\"2\"},{\"vfloat\":7.0,\"vdouble\":7.0,\"vlong\":7.0,\"vint\":7.0,\"vbyte\":7.0,\"vstring\":\"7\"},{\"vfloat\":null,\"vdouble\":null,\"vlong\":null,\"vint\":null,\"vbyte\":null,\"vstring\":\"\"}]}"
    @test sprint(show, ar) == "3x6 SPSS file\nvfloat │ vdouble │ vlong │ vint │ vbyte │ vstring\n───────┼─────────┼───────┼──────┼───────┼────────\n3.14   │ 3.14    │ 2.0   │ 2.0  │ 2.0   │ \"2\"    \n7.0    │ 7.0     │ 7.0   │ 7.0  │ 7.0   │ \"7\"    \n#NA    │ #NA     │ #NA   │ #NA  │ #NA   │ \"\"     "

    @test showable("text/html", ar) == true
    @test showable("application/vnd.dataresource+json", ar) == true

end
