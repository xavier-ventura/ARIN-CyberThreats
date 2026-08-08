%Segunda función
function f = Binario_a_IP(IP)
%Esta función pasa una IP en binario a formarto octetos en string
    vect4 = strread(string(IP), '%8s'); %trocea la IP en octetos
    vect4;
    Ip12 = string(bin2dec(vect4)); %pasa a binario (los números binarios los trata como carácteres cada dígito)
    f = join(Ip12,"."); %une las partes de una IP con puntos
end