function DecimalIPs = convertirIPColumnaDecimal(IPs)
    % Esta función convierte una columna de IPs en formato string o cell a su valor decimal,
    % pasando por el formato binario.
    
    % Paso 1: Dividir las IPs en sus octetos
    bin = cellfun(@(x) str2double(strsplit(x, '.')), IPs, 'UniformOutput', false);  % Separar en octetos
    
    % Paso 2: Convertir cada octeto a binario con 8 bits
    bin = cellfun(@(x) cellfun(@(y) dec2bin(y, 8), num2cell(x), 'UniformOutput', false), bin, 'UniformOutput', false);
    
    % Paso 3: Unir los 4 octetos binarios en una sola cadena binaria
    IPBin = cellfun(@(x) strcat(x{:}), bin, 'UniformOutput', false);
    
    % Paso 4: Convertir la cadena binaria a decimal
    DecimalIPs = cellfun(@(x) bin2dec(x), IPBin);
    
    % Devolver el resultado
    return;
end
