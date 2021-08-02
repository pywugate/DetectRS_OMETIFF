function filelist=Listint_All_OMETIFF

rootdir  = uigetdir( 'select folder');

if isempty(dir(rootdir))
    error('Invalid folder path.')
end

s = dir (fullfile(rootdir, '**\*.ome.tiff*'));

% listing all the '.ome.tiff' files
str = {s.name}; 
idx = contains (str, '.ome.tiff');
filelist = s(idx);
clear str s idx

end


    