%% DetectRS_OMETIFF(Detect_Read_Save_OMETIFF)
% Load original ome-tiff from MESc into x-y-z-t (and c) structure array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB Toolbox for BioFormats is necessity, please download the toolbox
% at OME website, install and addPath in MATLAB
% ---------------------------------------
% Another competiter:
% Multipage TIFF stack by YoonOh Tak
% https://www.mathworks.com/matlabcentral/fileexchange/35684-multipage-tiff-stack
% can load data as x-y-tz ( or x-y-zt) faster than bfopen, 
% but not easy to know tz(or zt)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IMPORTANT: ome.tiff store data in this order: ZTC
%%% Plane/frame is labelled before ZTC (but not real data)
%%% so the label order is PZTC
%%% go to OME website for more info

% Load the ome.tiff file and get size of X,Y
tic;
[filename,path,FilterIndex] = uigetfile('*.tiff', 'Select file');
fullfilepath = strcat(path,filename);
RawData = bfopen(fullfilepath);
[sizeX,sizeY] = size(RawData{1,1}{1,1});

% Get size of Z, C, T, P
r = bfGetReader(fullfilepath);
sizeZ = r.getSizeZ();
sizeT = r.getSizeT();
sizeC = r.getSizeC();
sizeP = sizeZ*sizeT*sizeC;          % because total frame/plane = Z*T*C

% I like to deal with data in a struct array with field name (in MATLAB),
% so create a struct
RAWxyzt = struct;

% Store different colours separately, and it is the top for loop
% and create variables for it
for c = 1:sizeC
    fields= strcat('colour', num2str(c));
    data = cell([sizeP/sizeC 1]);
    mergdata = zeros([sizeX sizeY sizeZ], 'uint16');
    
% IMPORTANT! Order is ZTC, e.g.  item    Z  T  C
%                                  1     1  1  1
%                                  2     2  1  1
%                                  3     1  2  1
%                                  4     2  2  1
%                                  5     1  1  2
%                                  6     2  1  2
%                                  7     1  2  2
%                                  8     2  2  2
% so fold is used for next colour
    fold = (c-1)*sizeP/sizeC;
    for i = 1:sizeP/sizeC
        data{i} = (RawData{1,1}{i+(1*fold),1});
        
        % remainder after divison for Z
        z = rem(i,sizeZ);
        if z == 0
            z = sizeZ;
        end
        mergdata(:,:,z) = data{i};

        % quotient after divison for T
        t = i/sizeZ;
        if fix(t) == t
            RAWxyzt(t).(fields) = mergdata;
        else
        end
    end
end

% clear t i z c fold r 
% clear data fields finalraw mergdata

%  twimshow1({[finalraw(1:10).data1];[finalraw(1:10).data2]},{[1700 4000],[1700 4000]}); colormap jet;
toc;

%% save individual plane for motion correction of individual z
tic;
matdata = zeros([sizeX sizeY sizeZ sizeT], 'uint16');   % for conversion from struct to matrix
matxytz = zeros([sizeX sizeY sizeT sizeZ], 'uint16');   % for conversion from xyzt to xytz 
matxyt = zeros([sizeX sizeY sizeT], 'uint16');          % for final xyt matrix

% again, do the step for different colours
for c = 1:sizeC 
    fields= strcat('colour', num2str(c));
    % convert struct to matrix
    for t = 1 :sizeT
        matdata(:,:,:,t) = RAWxyzt(t).(fields);
    end

    % convert xyzt to xytz 
    matxytz = permute(matdata,[1 2 4 3]);

    % reduce dimension from xytz to xyt of individual z
    for z = 1: sizeZ
        for t = 1:sizeT
        matxyt(:,:,t) = matxytz(:,:,t,z);
        end
        
        % read-friendly version of output
        zstr = str('z', num2str(z));
        colstr = strcat('c', num2str(c)); 
        idx = strfind (filename, '.o');
        output = strcat ('SingleZ\', filename(1:idx), colstr, zstr, '.tiff');

%         output = strcat ('SingleZ\', filename(1:idx), sprintf('c%d',c), sprintf('p%d',z), '.tiff');
        outputpath = strcat (path, output);

        % if your system export ome.tiff with white background and you want
        % black background, use B to convert to black background
        bfsave(uint16((matxyt)), outputpath);                    % --- A
%         bfsave(uint16(imcomplement(matxyt)), outputpath);      % --- B

    end
end
% clear idx output outputpath 
% clear matdata matxytz matxyt 

% twimshow1({matxytz(:,:,:,1),matxytz(:,:,:,2)},{[],[]}), colormap jet;
toc;