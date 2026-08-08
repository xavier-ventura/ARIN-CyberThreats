function r = esta(ip, limites)
    r = any(ip >= limites(:,1) & ip <= limites(:,2));
end
