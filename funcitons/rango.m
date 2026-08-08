function [minIP, maxIP] = rango(ip, as_number)
% RANGO para una sola IP
% ip: string tipo '4.160.0.0'
% as_number: ASN (no usado aquí)

    binario = IP_a_binario(ip);
    minIP = bin2dec(binario);
    
    rango = 2^8 - 1;  % 256 direcciones
    maxIP = minIP + rango;
end
