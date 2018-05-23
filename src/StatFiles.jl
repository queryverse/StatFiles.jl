module StatFiles

using ReadStat, IteratorInterfaceExtensions, TableTraits, TableTraitsUtils
using DataValues, FileIO
import IterableTables

export load

struct StatFile
    filename::String
end

function fileio_load(f::FileIO.File{FileIO.format"Stata"})
    return StatFile(f.filename)
end

function fileio_load(f::FileIO.File{FileIO.format"SPSS"})
    return StatFile(f.filename)
end

function fileio_load(f::FileIO.File{FileIO.format"SAS"})
    return StatFile(f.filename)
end

IteratorInterfaceExtensions.isiterable(x::StatFile) = true
TableTraits.isiterabletable(x::StatFile) = true

function IteratorInterfaceExtensions.getiterator(file::StatFile)
    filename, extension = splitext(file.filename)
    if extension==".dta"
        df = read_dta(file.filename)
    elseif extension==".por"
        df = read_por(file.filename)
    elseif extension==".sav"
        df = read_sav(file.filename)
    elseif extension==".sas7bdat"
        df = read_sas7bdat(file.filename)
    else
        error("Unknown file type.")
    end

    it = TableTraitsUtils.create_tableiterator(df.data, df.headers)

    return it
end

end # module
