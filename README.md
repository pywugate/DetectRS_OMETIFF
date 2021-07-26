# DETECTRS_OMETIFF

DETECT_Read_Save_OMETIFF was designed to ease the use of ImageJ/Fiji for manual separation of single plane from multiple-ZTC image files (i.e. TIFF).

####

#### Why do you need DETECTRS_OMETIFF?

After the acquisition of multi-stack and multi-colour time series images, some pre-rocessings need to be done before analysis.

For example, the animal moving makes the motion correction a necessary step; and we need to separate individual Z for motion correction.

Users often manually do these tasks in ImageJ, Icy or other softwares: 1. read files, 2. re-order hyper-stack, 3. split, etc.

Although they are wonderful apps with friendly GUI, mouse-moving and clicking are still time-consuming.

An automatic and quick method to do all the data in same folder is a solution.


## What can DETECTRS_OMETIFF do?
DETECTRS_OMETIFF can read X,Y,Z,T,C value from OME.TIFF and separate single-/multi- Z/T/C images into individual Z file(s).

### It means if you make MATLAB do the bulk conversion of multiple files for you, you earn much coffee time.

(But if the order of data is not standard OME ZTC order, I don't promise that ^^.)

###

## Libraries used:
1. MATLAB basics
2. MATLAB Toolbox for BioFormats from OME website: *openmicroscopy.org/bio-formats/downloads/*

###

## Photo and/or Video

![Concept](https://github.com/pywugate/DetectRS_OMETIFF/blob/main/Slide.JPG)

## Reference 
TBA/TBD
