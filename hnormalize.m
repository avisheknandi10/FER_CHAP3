function nData = hnormalize(Data)
    nData = zeros(size(Data));
    for i = 1:size(Data,1)
        %normalize rows
        row = Data(i,:);
        mx = max(row);
        mn = min(row);
        nData(i,:) = (row-mn)/(mx-mn);  
    end
        
        