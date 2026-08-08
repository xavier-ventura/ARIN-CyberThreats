function Into = contar_limites(X,Repu)

    [limInf, limSup] = limites(X.IP, X.cantidadIP);

    IPDec = IP_a_dec(Repu.IP);

    for i=1:length(limInf)
        if i==1
            Into=(limInf(i)<=IPDec)&(limSup(i)>=IPDec);
        end
        Into=or(and((limInf(i)<=IPDec),(limSup(i)>=IPDec)),Into);
    end