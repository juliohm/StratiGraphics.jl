# StratiGraphics.jl

*A tool for creating 3D stratigraphy from 2D flow images.*

[![][travis-img]][travis-url] [![][julia-pkg-img]][julia-pkg-url] [![][codecov-img]][codecov-url]

![StratiGraphics Animation](docs/stratigraphics.gif)

## Installation

Get the latest stable release with Julia's package manager:

```julia
Pkg.add("StratiGraphics")
```

## Usage

Given a set of images representing flow:

![Flow Images](docs/flowimages.png)

Repeatedly perform image quilting to evolve a landscape:

```julia
reals = landsim(imgs, nreal=2)
```

The obtained surfaces can then be stacked and voxelized to produce 3D stratigraphic models:

```julia
for real in reals
  landstack!(real)
  model = voxelize(real)
end
```

![Voxelized Models](docs/voxelmodel.png)

[travis-img]: https://travis-ci.org/juliohm/StratiGraphics.jl.svg?branch=master
[travis-url]: https://travis-ci.org/juliohm/StratiGraphics.jl

[julia-pkg-img]: http://pkg.julialang.org/badges/StratiGraphics_0.6.svg
[julia-pkg-url]: http://pkg.julialang.org/?pkg=StratiGraphics

[codecov-img]: https://codecov.io/gh/juliohm/StratiGraphics.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/juliohm/StratiGraphics.jl
