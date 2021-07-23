%
%%%%%%%%%%%%%%%%%%%         Selection        %%%%%%%%%%%%%%%%%%%
tic;
filelist = List_All_OMETIFF;
%
%%%%%%%%%%%%%%%%%%% Question: Invert colour? %%%%%%%%%%%%%%%%%%%
group = 'Updates';
pref =  'ColourInversion';
title = 'Inverting';
quest = {'Do you want to invert colour?'...
    'e.g. White background with Black data,  BUT you want the opposite  '...
    'The decision is for all the files in same foler'};
pbtns = {'Yes','No'};
[pval,tf] = uigetpref(group,pref,title,quest,pbtns);
%
%%%%%%%%%%%%%%%%%%%     Save individual Z    %%%%%%%%%%%%%%%%%%%
for i= 1:length(filelist)
    filename = filelist(i).name;
    path = strcat(filelist(i).folder, '\');
    switch pval
        case 'no'
            DetectRS_OMETIFF(filename,path);        % if you don't need inversion
        case 'yes'
            DetectRS_OMETIFF_inverC(filename,path); % if you need inversion
    end
end
toc;
%