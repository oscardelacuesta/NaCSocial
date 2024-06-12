# Credito: Oscar de la Cuesta
# palentino.es
# Fecha: 2024-06-10
# Versión: 1.0

# Borrar la pantalla al iniciar y mostrar créditos en ASCII art
Clear-Host

# ASCII Art para los créditos
$asciiArt = @"
  ____       _ _           _           _           
 |  _ \ __ _| (_) ___ __ _| |__   ___ | | ___  ___ 
 | |_) / _` | | |/ __/ _` | '_ \ / _ \| |/ _ \/ __|
 |  __/ (_| | | | (_| (_| | | | | (_) | |  __/\__ \
 |_|   \__,_|_|_|\___\__,_|_| |_|\___/|_|\___||___/
                                                   
      palentino.es
  Fecha: 11-06-2024
     Versión: 1.0

     Conversor para entradas en webs que no permiten negrita ni cursiva, ejemplo: Linkedin

"@
Write-Host $asciiArt -ForegroundColor Cyan

# Función para convertir caracteres a Unicode negrita
function ConvertToBold {
    param (
        [string]$inputText
    )

    $INCR_MAY = 120211
    $INCR_MIN = 120205

    $output = ""
    foreach ($char in $inputText.ToCharArray()) {
        $ascii = [int][char]$char

        if ($ascii -ge 65 -and $ascii -le 90) {
            # MAYUSCULAS
            $unicodeValue = $ascii + $INCR_MAY
            $boldChar = [char]::ConvertFromUtf32($unicodeValue)
        } elseif ($ascii -ge 97 -and $ascii -le 122) {
            # minusculas
            $unicodeValue = $ascii + $INCR_MIN
            $boldChar = [char]::ConvertFromUtf32($unicodeValue)
        } else {
            # Otros caracteres (incluyendo espacio)
            $boldChar = $char
        }
        $output += $boldChar
    }
    return $output
}

# Función para convertir caracteres a Unicode cursiva
function ConvertToItalic {
    param (
        [string]$inputText
    )

    $INCR_MAY = 120263
    $INCR_MIN = 120257

    $output = ""
    foreach ($char in $inputText.ToCharArray()) {
        $ascii = [int][char]$char

        if ($ascii -ge 65 -and $ascii -le 90) {
            # MAYUSCULAS
            $unicodeValue = $ascii + $INCR_MAY
            $italicChar = [char]::ConvertFromUtf32($unicodeValue)
        } elseif ($ascii -ge 97 -and $ascii -le 122) {
            # minusculas
            $unicodeValue = $ascii + $INCR_MIN
            $italicChar = [char]::ConvertFromUtf32($unicodeValue)
        } else {
            # Otros caracteres (incluyendo espacio)
            $italicChar = $char
        }
        $output += $italicChar
    }
    return $output
}

# Solicitar al usuario elegir entre negrita y cursiva
Write-Host ""
Write-Host "Elige el formato de texto (negrita/cursiva):" -NoNewline
$choice = Read-Host

# Convertir la elección a minúsculas para manejar ambas opciones
$choice = $choice.ToLower()

# Solicitar la cadena de texto al usuario
Write-Host ""
Write-Host "Escribe el texto a transformar (y pulse INTRO):" -NoNewline
$CADENA = Read-Host

# Inicializar la variable de salida
$outputText = ""

# Convertir el texto basado en la elección del usuario
if ($choice -eq "negrita") {
    $outputText = ConvertToBold -inputText $CADENA
} elseif ($choice -eq "cursiva") {
    $outputText = ConvertToItalic -inputText $CADENA
} else {
    Write-Host "Opción no válida. Por favor, elige 'negrita' o 'cursiva'."
    exit
}

# Mostrar el texto transformado si no está vacío
if ($outputText -ne "") {
    Write-Host ""
    Write-Host "Texto transformado:"
    Write-Host $outputText

    # Copiar el resultado al portapapeles
    $outputText | Set-Clipboard
    Write-Host ""
    Write-Host "El texto transformado ha sido copiado al portapapeles."
} else {
    Write-Host ""
    Write-Host "No se generó ningún texto transformado."
}

# Pausar para ver el resultado
pause

