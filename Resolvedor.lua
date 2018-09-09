-- Resolvedor de Division Sintetica
-- Por Jose_Varela

-- Inicializa todo lo que utilizaremos para
-- el proceso.
local TablasParaTomar, ValorPorMultiplicar, Resultado, FuturosValores
local NumeroSerie = 1
local SeriesCompletadas = {};
local TablaOriginal = ""
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
local Textos = {
    Bienvenida = "Bienvenido al resolvedor de Divisiones Sintéticas.\nPor Jose_Varela, 2018.\nEl programa cae en la licencia MIT.\nPara más información, veá el archivo LICENSE includo con el programa.",
    PreguntaInicial = "¿Desea que los resultados se muestren en una tabla? (y/n)",
    IngresarValor = "Por favor, ingrese un valor para Multiplar la tabla: ",
    Cancelado = "No valor fue agregado, cancelando..."
};

local PermitirTablas
os.execute("clear")
repeat
    io.write(
    "----------------\n"..
    Textos["Bienvenida"]
    .."\n----------------\n"..
    Textos["PreguntaInicial"]
    )
    io.flush()
    PermitirTablas=io.read()
until PermitirTablas=="y" or PermitirTablas=="n" or PermitirTablas==""

if PermitirTablas == "y" then
    print("Habilitando soporte de tablas.\n\n")
    PermitirTablas = true
else
    print("Tablas se mantendrán apagadas.\n\n")
    PermitirTablas = false
end

TablasParaTomar = {-9,0,216,-1053,3645,-8748,8748};

if not TablaOriginal then
    for i=1,#TablasParaTomar do
        TablaOriginal = TablaOriginal .. "    "..TablasParaTomar[i].."   "
    end
end
--ValorPorMultiplicar = 6
function RemoverInnecesario()
    if #SeriesCompletadas ~= NumeroSerie then
        table.remove(SeriesCompletadas, #SeriesCompletadas)
        RemoverInnecesario()
    else
        Dar_Resultado()
    end
end

function Dar_Resultado()
    if #SeriesCompletadas ~= NumeroSerie then
        RemoverInnecesario()
    end
    os.execute("clear")
    print(Textos["Cancelado"])
    if NumeroSerie > 1 then
        print("\n ---------------- Series Completadas ----------------" )
        print("Valor Original: "..TablaOriginal)
        for i=1,#SeriesCompletadas do
            print( "Serie "..i..": ".. SeriesCompletadas[i] )
        end
        print(" --------------------------------" )
    end
    return
end

function Inicio()
    local ValorPorMultiplicar
        io.write("Serie "..NumeroSerie.."\n"..Textos["IngresarValor"])
        io.flush()
        ValorPorMultiplicar=io.read()

    if tonumber(ValorPorMultiplicar) == nil then
        NumeroSerie = NumeroSerie-1
        Dar_Resultado()
        return
    end

    if ValorPorMultiplicar and string.len(tonumber(ValorPorMultiplicar)) > 0 then
        print("\n\n")

        ResultadoTabla = {};
        FuturosValores = {};

        local ValorParaComenzar = 1
        for i=1,#TablasParaTomar do
            ValorParaComenzar = ValorParaComenzar * (ValorPorMultiplicar) + TablasParaTomar[i]
            if PermitirTablas then
                ResultadoTabla[i] = "   "..ValorParaComenzar.."  ";
            end
            FuturosValores[i] = ValorParaComenzar
            print("Valor "..i..": "..ValorParaComenzar)
        end

        -- Termina con el resultado final, que será en dos tablas.
        print("Valor final:"..ValorParaComenzar)
        if PermitirTablas then
            ResultadoFinal = ''
            ValoresTomados = ''
            for i=1,#TablasParaTomar do
                ValoresTomados = ValoresTomados .. "   "..TablasParaTomar[i].."  "
            end
            for i=1,#ResultadoTabla do
                ResultadoFinal = ResultadoFinal .. ResultadoTabla[i]
            end
            SeriesCompletadas[#SeriesCompletadas+1] = ResultadoFinal
            os.execute("clear")
            print(" ---------------- Tabla de Resultado ----------------" )
            print(" 1   ".. ValoresTomados )
            print(" 1   ".. ResultadoFinal )
            print(" ---------------- Fin de Tabla ----------------")
        end

        if ValorParaComenzar == 0 then
            print("Este valor (w="..ValorPorMultiplicar..") es raiz!\nComenzando la siguente...\n\n\n")
            table.remove(FuturosValores, #FuturosValores)
            TablasParaTomar = FuturosValores
            NumeroSerie = NumeroSerie + 1
            Inicio()
        else
            print("No termina siendo raíz, intenta con otro valor.")
            Inicio()
        end

    else
        print("\nEl valor no es un número!\nComenzando el programa...")
        Inicio()
    end
end

Inicio()

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
