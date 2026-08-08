function tabla = countAction(TT, fieldname)
    valores = {};
    
    for i = 1:length(TT)
        if isfield(TT(i), fieldname)
            campo = TT(i).(fieldname);
            if isstruct(campo)
                subfields = fieldnames(campo);
                valores = [valores; subfields]; % acumulamos los nombres de los subcampos
            end
        end
    end

    % Contar ocurrencias
    [tiposUnicos, ~, idx] = unique(valores);
    conteo = accumarray(idx(:), 1);

    % Crear tabla
    tabla = table(categorical(tiposUnicos(:)), conteo, ...
        'VariableNames', {'TipoAtaque', 'Conteo'});

    tabla = sortrows(tabla, 'Conteo', 'descend');
end
