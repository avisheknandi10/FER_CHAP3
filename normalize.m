function N = normalize(DATA)
    Mn = min(DATA,2);
    Mx = max(DATA,[],2);
    N = (DATA - Mn)./(Mx - Mn);
end