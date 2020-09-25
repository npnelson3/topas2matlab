# topas2matlab
by Nick Nelson <npnelson3@gmail.com>

# Basic Features
topas2matlab(2) converts binned TOPAS outputs to a Matlab array. The function will evauluate the dimensions of the dose grid (1D, 2D, or 3D voxels) and place the respective TOPAS values into a 1D, 2D, or 3D array.

# Basic Usage
file = 'TestData/3D.csv'
topas2matlab(file)