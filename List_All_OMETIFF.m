function ometifflist=List_All_OMETIFF

rootdir  = uigetdir( 'select folder');

if isempty(dir(rootdir))
    error('Invalid folder path.')
end

% listing all the '.ome.tiff' files
ometifflist = dir (fullfile(rootdir, '**\*.ome.tiff*'));
clear rootdir;

% if want to list all files and filter out the ometiff
% s = dir (fullfile(rootdir));
% str = {s.name}; 
% idx = contains (str, '.ome.tiff');
% ometifflist = s(idx);
% clear str s idx

end


    