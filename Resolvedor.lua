-- Resolvedor de Division Sintetica
-- Un proceso corriendo en StepMania 5.
-- Por Jose_Varela
-- Esta parte no importa, es solamente como fondo.
-------------------------------------------------------
local t = Def.ActorFrame{};

t[#t+1] = Def.Quad{
    OnCommand=function(self)
        self:FullScreen():diffuse(Color.Black);
    end;
};
t[#t+1] = LoadFont("Common Normal")..{
    Text="Checa la terminal!";
    OnCommand=cmd(Center);
};
-------------------------------------------------------

-- Inicializa todo lo que utilizaremos para
-- el proceso.
local TablasParaTomar, ValorPorMultiplicar, Resultado

local MostrarEnTabla = true
--[[
    Esto ya tomará en cuenta que ya resolviste la parte de conseguir el valor
    a descomponer.
    Por ejemplo:

    Proveniente de:
    (w^2+9)(w-3)^3(w^2-36)=0
    |
    blabablablabla
    |
    P7(w)=w^2-9w^6+216w^4-1053w^3+3545w^2-8748w+8748 = 0

    Tomaremos lo que tenemos de datos, y lo llevaros al convertidor.
]]

-- Cambia estos dos valores para comenzar la operación.
-------------------------
TablasParaTomar = {-9,0,216,-1053,3645,-8748,8748};
ValorPorMultiplicar = 6
-------------------------
ResultadoTabla = {};

local ValorParaComenzar = 1
for i=1,#TablasParaTomar do
    ValorParaComenzar = ValorParaComenzar * (ValorPorMultiplicar) + TablasParaTomar[i]
    if MostrarEnTabla then
        ResultadoTabla[i] = "   "..ValorParaComenzar.."  ";
    end
    print("Valor "..i..": "..ValorParaComenzar)
end

-- Termina con el resultado final, que será en dos tablas.
print("Valor final:"..ValorParaComenzar)
if MostrarEnTabla then
    ResultadoFinal = ''
    ValoresTomados = ''
    for i=1,#TablasParaTomar do
        ValoresTomados = ValoresTomados .. "   "..TablasParaTomar[i].."  "
    end
    for i=1,#ResultadoTabla do
        ResultadoFinal = ResultadoFinal .. ResultadoTabla[i]
    end
    print(" ---------------- Tabla de Resultado ----------------" )
    print("Valor Utilizado: ".. ValorPorMultiplicar )
    print(" 1   ".. ValoresTomados )
    print(" 1   ".. ResultadoFinal )
    print(" ---------------- Fin de Tabla ----------------" )
end

if ValorParaComenzar == 0 then
    print("Este valor (w="..ValorPorMultiplicar..") es raiz!")
else
    print("No termina siendo raíz, intenta con otro valor.")
end

return t;

--[[
Copyright (c) 2018 Jose_Varela

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]
