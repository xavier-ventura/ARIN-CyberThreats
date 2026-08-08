function tabla = countActorsVariety(TT)
    valores = {};
    subcampos = {'external', 'internal', 'partner', 'unknown', 'secondary'}; 
    
    for i = 1:length(TT)
        if isfield(TT(i), 'actor')
            actor = TT(i).actor;
            for s = 1:length(subcampos)
                sc = subcampos{s};
                if isfield(actor, sc)
                    campo = actor.(sc);
                    if isstruct(campo) && isfield(campo, 'variety')
                        val = campo.variety;
                        if isempty(val)
                            continue
                        end
                        if iscell(val)
                            for j = 1:numel(val)
                                if ~isempty(val{j})
                                    valores{end+1} = char(val{j});
                                end
                            end
                        elseif ischar(val) || isstring(val)
                            valores{end+1} = char(val);
                        end
                    end
                end
            end
        end
    end
    
    valores = valores(~cellfun(@isempty, valores)); % quitar vacíos
    
    if isempty(valores)
        warning('No se encontraron variedades de actores');
        tabla = table();
        return
    end
    
    [tiposUnicos, ~, idx] = unique(valores);
    conteo = accumarray(idx(:), 1);

    % Aquí van los disp para depurar
    disp(['Número tiposUnicos: ', num2str(length(tiposUnicos))])
    disp(['Número conteo: ', num2str(length(conteo))])
    disp('tiposUnicos:')
    disp(tiposUnicos)
    disp('conteo:')
    disp(conteo)
    disp(['Número total valores: ', num2str(length(valores))])
    disp('Primeros 10 valores:')
    disp(valores(1:min(10,end)))

    if length(tiposUnicos) ~= length(conteo)
        error('Inconsistencia en tamaño de datos: tiposUnicos y conteo difieren.')
    end
    
    tabla = table(string(tiposUnicos), conteo, 'VariableNames', {'TipoActor', 'Conteo'});
    tabla = sortrows(tabla, 'Conteo', 'descend');
end
