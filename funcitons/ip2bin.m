%Primera función
function f = IP_a_binario(IP)
%Esta función pasa una IP en forma de octetos a binario en formato string
%siguiendo los mismos pasos que en clase
    Ip1 = split(string(IP), '.'); %separamos por puntos convirtiendo a string
    Ip12 = str2double(Ip1); %pasamos a bloque de numeros
    Ip12C = dec2bin(Ip12, 8); %pasa a binario (los números binarios los trata como carácteres cada dígito)
    IP12BO = string(Ip12C); %el array de caracteres lo pasaremos a string
    f = (IP12BO(1) + IP12BO(2) + IP12BO(3) + IP12BO(4));
end