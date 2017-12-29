module StatFiles

using ReadStat, IteratorInterfaceExtensions, TableTraits, TableTraitsUtils
using DataValues, SASLib
import FileIO
import IterableTables

struct StatFile
    filename::String
end

function load(f::FileIO.File{FileIO.format"Stata"})
    return StatFile(f.filename)
end

function load(f::FileIO.File{FileIO.format"SPSS"})
    return StatFile(f.filename)
end

function load(f::FileIO.File{FileIO.format"SAS"})
    return StatFile(f.filename)
end

IteratorInterfaceExtensions.isiterable(x::StatFile) = true
TableTraits.isiterabletable(x::StatFile) = true

function IteratorInterfaceExtensions.getiterator(file::StatFile)
    filename, extension = splitext(file.filename)
    if extension==".dta"
        data, header = read_dta(file.filename)
    elseif extension==".por"
        data, header = read_por(file.filename)
    elseif extension==".sav"
        data, header = read_sav(file.filename)
    elseif extension==".sas7bdat"
        x = readsas(file.filename)
        header = x[:column_symbols]
        data = [x[:data][i] for i in header]
        # data, header = read_sas7bdat(file.filename)
    else
        error("Unknown file type.")
    end

    println(typeof(data[1]))

    it = TableTraitsUtils.create_tableiterator(data, header)

    return it
end

end # module
