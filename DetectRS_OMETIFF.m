tic;
%%%%%%%%%%%%%%%%%%%            Selection          %%%%%%%%%%%%%%%%%%%
ometifflist = List_All_OMETIFF;

%%%%%%%%%%%%%%%%%%% Detect,Load,Save individual Z %%%%%%%%%%%%%%%%%%%
for i= 1:length(ometifflist)
    filename = ometifflist(i).name;
    path = strcat(ometifflist(i).folder, '\');
	DetectRS(filename,path);
end
%%%%%%%%%%%%%%%%%%%                               %%%%%%%%%%%%%%%%%%%
toc;