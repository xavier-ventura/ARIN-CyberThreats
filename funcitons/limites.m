function [limInf, limSup] = limites(IPs, cantidad)
    decimal = IP_a_dec(IPs);
    limInf = decimal;
    limSup = decimal + cantidad;
end 


