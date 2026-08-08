function arin = calcularLimitesIPs(arin)
    % Convierte IP tipo 'x.x.x.x' a número decimal
    ip2dec = @(ipStr) uint32(sscanf(ipStr, '%d.%d.%d.%d')' * [16777216; 65536; 256; 1]);

    % Asegúrate de trabajar con celdas de texto
    if isstring(arin.IP)
        ipList = cellstr(arin.IP);
    else
        ipList = arin.IP;
    end

    % Convierte IP base a número
    n = numel(ipList);
    ipDec = zeros(n,1,'uint32');
    for i = 1:n
        if ~strcmp(ipList{i}, '*')  % Evita valores especiales como '*'
            ipDec(i) = ip2dec(ipList{i});
        end
    end

    % Calcula IP final
    ipFin = ipDec + uint32(arin.cantidadIP) - 1;

    % Asigna a la tabla
    arin.limiteInferior = ipDec;
    arin.limiteSuperior = ipFin;
end
