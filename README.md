# toolkit-linux
Sistemas Operativosss

## 🧩 Scripts del Toolkit

### 📄 *abrir_monitor_procesos.sh*

Este script se encarga de abrir una herramienta de monitoreo de procesos del sistema. Verifica si htop está instalado; si lo está, lo ejecuta. Si no, recurre al comando top.

🔍 Funcionamiento:

Muestra un mensaje de prueba para verificar que el script se ejecuta.

Verifica si el comando htop está disponible en el sistema:

Si está instalado, lo ejecuta.

Si no está instalado, ejecuta top como alternativa.

Ambas herramientas permiten observar procesos, uso de CPU, memoria, y más en tiempo real.

### 📄 *validar_entrada.sh*

Este script contiene funciones que pueden ser importadas por otros scripts para validar entradas del usuario, como por ejemplo si un PID es válido.

🔍 Funciones incluidas:

es_entero_positivo(valor)
- Verifica si el valor ingresado es un número entero positivo.

pid_existe(pid)
- Verifica si el número ingresado corresponde a un PID existente en el sistema.

Para usar estas funciones desde otro archivo, se debe importar el script con source:

source ./validar_entrada.sh
