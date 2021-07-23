function filelist=Listint_All_OMETIFF

folderpath  = uigetdir( 'select folder');

if isempty(dir(folderpath))
    error('Invalid folder path.')
end

s = dir (folderpath) ;

% listing all the '.ome.tiff' files
str = {s.name}; 
idx = contains (str, '.ome.tiff');
filelist = s(idx);
clear str s idx

end


    