function tabla = countActionHackingVariety(TT, mainField, subField, varietyField)
% Cuenta la variedad de hackeos en el campo específico
% TT: tabla o struct array
% mainField: campo principal, ejemplo 'action'
% subField: subcampo, ejemplo 'hacking'
% varietyField: campo dentro de subField, ejemplo 'variety'

    variedades = {};

    for i = 1:length(TT)
        a = TT(i).(mainField);
        if isstruct(a) && isfield(a, subField)
            hacking = a.(subField);
            if isstruct(hacking) && isfield(hacking, varietyField)
                varField = hacking.(varietyField);
                % varField puede ser celda o char o struct array
                if iscell(varField)
                    for j = 1:numel(varField)
                        if ischar(varField{j})
                            variedades{end+1} = varField{j};
                        elseif isstruct(varField{j}) && isfield(varField{j}, 'value')
                            variedades{end+1} = varField{j}.value;
                        end
                    end
                elseif ischar(varField)
                    variedades{end+1} = varField;
                elseif isstruct(varField) && isfield(varField, 'value')
                    variedades{end+1} = varField.value;
                end
            end
        end
    end

    % Contar ocurrencias
    [varUnicas, ~, idx] = unique(variedades);
    conteo = accumarray(idx(:), 1);

    % Crear tabla
    tabla = table(string(varUnicas(:)), conteo, 'VariableNames', {'VariedadHackeo', 'Conteo'});

    % Ordenar descendente
    tabla = sortrows(tabla, 'Conteo', 'descend');
end

