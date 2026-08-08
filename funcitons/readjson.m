function data = readjson(filename, expectedFields)
    % Lee un archivo JSON y devuelve solo los campos esperados (si existen)

    % Abrir archivo
    fid = fopen(filename, 'r');
    if fid == -1
        error('No se pudo abrir el archivo: %s', filename);
    end

    % Leer contenido como texto
    raw = fread(fid, inf, '*char')';
    fclose(fid);

    % Decodificar JSON
    jsonData = jsondecode(raw);

    % Si no se especifican campos, devuelve todo
    if nargin < 2 || isempty(expectedFields)
        data = jsonData;
        return;
    end

    % Crear estructura con solo los campos esperados
    data = struct();
    for i = 1:length(expectedFields)
        field = expectedFields{i};
        if isfield(jsonData, field)
            data.(field) = jsonData.(field);
        else
            data.(field) = []; % Campo vacío si no existe
        end
    end
end

