module StatFiles

using ReadStat, IteratorInterfaceExtensions, TableTraits, TableTraitsUtils
using DataValues, FileIO, TableShowUtils
import IterableTables

export load, File, @format_str

struct StatFile
    filename::String
end

function Base.show(io::IO, source::StatFile)
    file_ext = lowercase(splitext(source.filename)[2])
    filetype = if file_ext == ".dta"
        "STATA file"
    elseif file_ext == ".sav"
        "SPSS file"
    elseif file_ext == ".sas7bdat"
        "SAS file"
    else
        "file"
    end
    TableShowUtils.printtable(io, getiterator(source), filetype)
end

function Base.show(io::IO, ::MIME"text/html", source::StatFile)
    TableShowUtils.printHTMLtable(io, getiterator(source))
end

Base.Multimedia.showable(::MIME"text/html", source::StatFile) = true

function Base.show(io::IO, ::MIME"application/vnd.dataresource+json", source::StatFile)
    TableShowUtils.printdataresource(io, getiterator(source))
end

Base.Multimedia.showable(::MIME"application/vnd.dataresource+json", source::StatFile) = true

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
    if extension == ".dta"
        df = read_dta(file.filename)
    elseif extension == ".por"
        df = read_por(file.filename)
    elseif extension == ".sav"
        df = read_sav(file.filename)
    elseif extension == ".sas7bdat"
        df = read_sas7bdat(file.filename)
    else
        error("Unknown file type.")
    end

    it = TableTraitsUtils.create_tableiterator(df.data, df.headers)

    return it
end

end # module
