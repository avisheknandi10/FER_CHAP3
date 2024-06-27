% Scan CK+ database and Generate SIGNATURES
PATH = 'C:\DB\CK+\Emotion\';
FILES = dir([PATH,'**\*.txt']);

lmrk = [18,20,22,23,25,27,37,38,41,40,43,44,47,46,32,34,36,49,55,52,58];
%lmrk = 1:2:68;   
lenT = nchoosek(length(lmrk),3);
% Fuzzy Tringel Sinature
%FTS = zeros(length(FILES),lenT,5);
% Centroid Distance Signature
CDS = zeros(length(FILES),lenT,6);
% Angel Signature
%TSS = zeros(length(FILES),lenT);
% no of images --> length(FILES)
% no of tringels --> lenT
% no of fuzzy measures --> 5

EMO = zeros(length(FILES),1);

h = waitbar(0,'Please wait computing Signatures ...');

for i = 1:length(FILES)
    disp(i)
    
    name = FILES(i).name;
    folder = FILES(i).folder;
    foldername = [folder,'\',name];
    EMO(i) = dlmread(foldername);
    
    endpath = strrep(name(1:8),'_','\');
    fullpath = strrep([PATH,endpath,'\'],'Emotion',...
                      'Landmarks');
    
    files = dir([fullpath,'*.txt']);
    
    name = files(end).name;
    folder = files(end).folder;
    foldername = [folder,'\',name];
    
    temp = dlmread(foldername);
    pts = temp(lmrk,:);
    
    %FTS(i,:,:) = fuzzy_tringle_signature(pts); % mu_i
    CDS(i,:,:) = centroid_distance_signature(pts); %di/ri
    %TSS(i,:,:) = triangle_side_signature(pts);
    
    waitbar(i / length(FILES))
    
end

close(h)

I = eye(7);
EMO2 = I(EMO,:); 

%TSS = real(TSS);
        
        