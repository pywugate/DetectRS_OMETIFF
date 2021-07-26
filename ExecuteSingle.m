tic;
%%%%%%%%%%%%%%%%%%%           Selection         %%%%%%%%%%%%%%%%%%%
[filename, path] = uigetfile('*.ome.tiff', 'Choose a file to open');

%%%%%%%%%%%%%%%%%%%   Question: Invert colour?  %%%%%%%%%%%%%%%%%%%
group = 'Updates';
pref =  'ColourInversion';
title = 'Inverting';
quest = {'Do you want to invert colour?'...
    'e.g. White background with Black data, BUT you want the opposite  '...
    'The decision is for all the files in same foler'};
pbtns = {'Yes','No'};
[pval,tf] = uigetpref(group,pref,title,quest,pbtns);

%%%%%%%%%%%%%%%%%%% Load data, Save individual Z %%%%%%%%%%%%%%%%%%%
switch pval
    case No
        DetectRS_OMETIFF(filename,path);
    case Yes
        DetectRS_OMETIFF_inverC(filename,path);
end
%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%
toc;
