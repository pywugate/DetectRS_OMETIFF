tic;
%%%%%%%%%%%%%%%%%%%            Selection          %%%%%%%%%%%%%%%%%%%
filelist = List_All_OMETIFF;

%%%%%%%%%%%%%%%%%%% Detect,Load,Save individual Z %%%%%%%%%%%%%%%%%%%
for i= 1:length(filelist)
    filename = filelist(i).name;
    path = strcat(filelist(i).folder, '\');
	DetectRS(filename,path);
end
%%%%%%%%%%%%%%%%%%%                               %%%%%%%%%%%%%%%%%%%
toc;