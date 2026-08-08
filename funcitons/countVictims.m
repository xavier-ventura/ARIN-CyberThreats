function tabla = countVictims(TT, fieldname, idField)
% Cuenta ocurrencias de víctimas únicas en TT.(fieldname).(idField)
% TT: struct array con datos
% fieldname: campo principal (ej. 'victim')
% idField: campo identificador dentro de fieldname (ej. 'victim_id')

    valores = {};  % para acumular todos los IDs

    for i = 1:length(TT)
        if isfield(TT(i), fieldname)
            campo = TT(i).(fieldname);
            if isstruct(campo) && isfield(campo, idField)
                val = campo.(idField);
                if iscell(val)
                    for j = 1:numel(val)
                        if ischar(val{j}) || isstring(val{j})
                            valores{end+1} = char(val{j});
                        elseif isstruct(val{j}) && isfield(val{j}, 'value')
                            valores{end+1} = val{j}.value;
                        end
                    end
                elseif ischar(val) || isstring(val)
                    valores{end+1} = char(val);
                elseif isstruct(val) && isfield(val, 'value')
                    valores{end+1} = val.value;
                end
            elseif iscell(campo)
                for j = 1:numel(campo)
                    if ischar(campo{j}) || isstring(campo{j})
                        valores{end+1} = char(campo{j});
                    end
                end
            elseif ischar(campo) || isstring(campo)
                valores{end+1} = char(campo);
            end
        end
    end

    % Limpiar valores vacíos o nulos
    valores = valores(~cellfun(@isempty, valores));

    % Contar ocurrencias
    [unicos, ~, idx] = unique(valores);
    conteo = accumarray(idx(:), 1);

    % Asegurarse que unicos y conteo son vectores columna
    tabla = table(string(unicos(:)), conteo(:), 'VariableNames', {'VictimID', 'Conteo'});

    % Ordenar tabla descendente por conteo
    tabla = sortrows(tabla, 'Conteo', 'descend');
end

