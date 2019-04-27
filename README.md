# StatFiles

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/queryverse/StatFiles.jl.svg?branch=master)](https://travis-ci.org/queryverse/StatFiles.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/lx7qmion1a8dggls/branch/master?svg=true)](https://ci.appveyor.com/project/queryverse/statfiles-jl/branch/master)
[![codecov.io](http://codecov.io/github/queryverse/StatFiles.jl/coverage.svg?branch=master)](http://codecov.io/github/queryverse/StatFiles.jl?branch=master)

## Overview

This package provides load support for Stata, SPSS, and SAS files
under the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) package.

## Installation

Use ``Pkg.add("StatFiles")`` in Julia to install StatFiles and its dependencies.

## Usage

### Load a Stata, SPSS, or SAS file

To read a Stata, SPSS, or SAS file into a ``DataFrame``, use the following julia code:

````julia
using StatFiles, DataFrames

df = DataFrame(load("data.dta"))
````

The call to ``load`` returns a ``struct`` that is an [IterableTable.jl](https://github.com/queryverse/IterableTables.jl), so it can be passed to any function that can handle iterable tables, i.e. all the sinks in [IterableTable.jl](https://github.com/queryverse/IterableTables.jl). Here are some examples of materializing a Stata, SPSS, or SAS file into data structures that are not a ``DataFrame``:

````julia
using StatFiles, DataTables, IndexedTables, TimeSeries, Temporal, Gadfly

# Load into a DataTable
dt = DataTable(load("data.dta"))

# Load into an IndexedTable
it = IndexedTable(load("data.dta"))

# Load into a TimeArray
ta = TimeArray(load("data.dta"))

# Load into a TS
ts = TS(load("data.dta"))

# Plot directly with Gadfly
plot(load("data.dta"), x=:a, y=:b, Geom.line)
````

### Using the pipe syntax

``load`` also support the pipe syntax. For example, to load a Stata, SPSS, or SAS file into a ``DataFrame``, one can use the following code:

````julia
using StatFiles, DataFrame

df = load("data.dta") |> DataFrame
````

The pipe syntax is especially useful when combining it with [Query.jl](https://github.com/queryverse/Query.jl) queries, for example one can easily load a Stata, SPSS, or SAS file, pipe it into a query, then pipe it to the ``save`` function to store the results in a new file.
