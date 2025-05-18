# toolkit-linux
Sistemas Operativosss

## 🧩 Scripts del Toolkit

### 📄 *ver_detalles_proceso.sh*

Esta función le solicita al usuario que ingrese el PID (Número de Identificación del Proceso) del cual desea ver información detallada. Utiliza el comando 'ps -p <PID>' para mostrar información como el usuario, el uso de CPU y memoria, el estado, el tiempo de inicio y el comando del proceso especificado.

🔍 Funcionamiento:

Al ejecutar la opción correspondiente en el menú, el script pedirá al usuario que ingrese el número PID del proceso que desea investigar.

Una vez que el usuario introduce el PID y presiona Enter, el script utiliza el comando ps -p <PID> -o pid,user,pcpu,pmem,vsz,rss,tty,stat,start,time,command para mostrar información relevante del proceso. Esta información incluye:

    PID: El identificador único del proceso.
    USER: El usuario propietario del proceso.
    %CPU: El porcentaje de uso de la CPU por el proceso.
    %MEM: El porcentaje de uso de la memoria RAM por el proceso.
    VSZ: El tamaño virtual de la imagen del proceso.
    RSS: El tamaño del conjunto residente (la porción de la memoria que realmente ocupa el proceso en la RAM).
    TTY: El terminal asociado al proceso (si existe).
    STAT: El estado actual del proceso (ej: S para sleeping, R para running).
    START: La hora o fecha en que se inició el proceso.
    TIME: La cantidad total de tiempo de CPU que el proceso ha utilizado.
    COMMAND: El comando que se ejecutó para iniciar el proceso.

Si el PID ingresado no corresponde a ningún proceso activo en el sistema, el script mostrará un mensaje indicando que no se encontró ningún proceso con ese PID.


### 📄 *terminar_proceso_suave.sh*

Esta función permite terminar un proceso en ejecución enviando una señal de terminación suave (SIGTERM). Le solicita al usuario que ingrese el PID del proceso que desea finalizar. Utilizando el comando 'kill <PID>' se envia la señal SIGTERM. Esta señal da al proceso la oportunidad de cerrarse de forma ordenada, guardando su estado si es necesario.

🔍 Funcionamiento:

Al seleccionar la opción correspondiente en el menú, el script pedirá al usuario que ingrese el número PID del proceso que desea terminar.

Antes de enviar la señal, el script preguntará al usuario si está seguro de que desea terminar el proceso con el PID ingresado. El usuario deberá ingresar "s" o "S" para confirmar y cualquier otra cosa para cancelar la operación.

Si el usuario confirma, el script utiliza el comando kill <PID> (que por defecto envía la señal SIGTERM) al proceso especificado.

Después de intentar enviar la señal, el script mostrará un mensaje indicando si la señal se envió correctamente. Sin embargo, es importante tener en cuenta que el script solo envía la señal; el proceso en sí decide si y cómo responder a ella. Algunos procesos pueden ignorar esta señal.

Importante: Utilizar la terminación suave es la forma recomendada de finalizar un proceso, ya que le permite realizar una limpieza antes de cerrarse. Solo en casos donde un proceso no responde a SIGTERM se debería considerar el uso de la terminación forzada (kill -9), la cual tus compañeros implementarán.


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
