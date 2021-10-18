# topas2matlab
by Nick Nelson <npnelson3@gmail.com>

# Basic Features
`topas2matlab(filename,DoseGridType)` converts csv-binned TOPAS outputs to a Matlab array where the DoseGridType is either Cylindrical or Rectilinear. The function will evauluate the dimensions of the dose grid (1D, 2D, or 3D voxels) and places the respective TOPAS values into a 1D, 2D, or 3D array. 'topas2matlab_bin()' converts binary-binned TOPAS outputs to a Matlab array.

# Basic Usage
```matlab
% For csv-binned data
file = 'TestData/3D.csv';
topas2matlab(file,'Rectilinear');
% For binary-binned data
headerFile = 'TestData/Dij.binheader';
doseFile = 'TestData/Dij.bin';
[Dose] = readBinHeader(headerFile);
[Dose.Data] = topas2matlab_bin(doseFile);
```

