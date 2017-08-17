module StatFiles

using ReadStat, TableTraits, DataValues, DataFrames
import FileIO

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

TableTraits.isiterable(x::StatFile) = true
TableTraits.isiterabletable(x::StatFile) = true

function TableTraits.getiterator(file::StatFile)
    filename, extension = splitext(file.filename)
    if extension==".dta"
        dt = read_dta(file.filename)
    elseif extension==".por"
        dt = read_por(file.filename)
    elseif extension==".sav"
        dt = read_sav(file.filename)
    elseif extension==".sas7bdat"
        dt = read_sas7bdat(file.filename)
    else
        error("Unknown file type.")
    end

    it = getiterator(dt)

    return it
end

end # module
