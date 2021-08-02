tic;
%%%%%%%%%%%%%%%%%%%            Selection          %%%%%%%%%%%%%%%%%%%
[filename, path] = uigetfile('*.ome.tiff', 'Choose a file to open');

%%%%%%%%%%%%%%%%%%% Detect,Load,Save individual Z %%%%%%%%%%%%%%%%%%%
DetectRS(filename,path);

%%%%%%%%%%%%%%%%%%%                               %%%%%%%%%%%%%%%%%%%
toc;
