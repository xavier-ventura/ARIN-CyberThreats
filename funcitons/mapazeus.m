function [] = mapazeus(archivo, color)
    % Obtener las coordenadas geográficas correspondientes a las direcciones IP
    latitlacnic = archivo(:, 1);
    longlacnic = archivo(:, 2);
    
    % Mostrar los puntos en el mapa correspondientes a las direcciones IP
    geoshow(latitlacnic, longlacnic, 'DisplayType', 'point', 'Marker', '.', 'MarkerEdgeColor', color, 'MarkerFaceColor', color);
end
