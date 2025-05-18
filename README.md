<h1 align="center"> 🛠️ Toolkit de Administración Jr. </h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/27c1f99f-f9b7-4059-98ac-8f396863f6a2" alt="tools" width="600" height="400">
</div>

<br>
<br>
<br>
Toolkit de Administración Jr. es una herramienta funcional basada en Bash, desarrollada para simplificar tareas básicas de administración en sistemas Linux (Ubuntu/Debian). Diseñada para ser utilizada por estudiantes, usuarios principiantes o administradores de sistemas en pequeñas startups o entornos educativos, este toolkit ofrece un menú interactivo y accesible desde la terminal que permite realizar tareas clave como monitoreo de procesos, análisis de recursos del sistema, gestión de usuarios, entre otras.

El proyecto se construyó bajo una estructura modular, utilizando scripts individuales para cada funcionalidad, lo que facilita la lectura, mantenimiento y extensión futura del sistema.

<h2 align="center"> 🧩 Scripts del Toolkit </h2>

### 📄 *ver_detalles_proceso.sh*

Esta función le solicita al usuario que ingrese el PID (Número de Identificación del Proceso) del cual desea ver información detallada. Utiliza el comando 'ps -p <PID>' para mostrar información como el usuario, el uso de CPU y memoria, el estado, el tiempo de inicio y el comando del proceso especificado.

🔍 Funcionamiento:

Al ejecutar la opción correspondiente en el menú, el script pedirá al usuario que ingrese el número PID del proceso que desea investigar.

Una vez que el usuario introduce el PID y presiona Enter, el script utiliza el comando ps -p <PID> -o pid,user,pcpu,pmem,vsz,rss,tty,stat,start,time,command para mostrar información relevante del proceso. Esta información incluye:

- PID: El identificador único del proceso.
- USER: El usuario propietario del proceso.
- %CPU: El porcentaje de uso de la CPU por el proceso.
- %MEM: El porcentaje de uso de la memoria RAM por el proceso.
- VSZ: El tamaño virtual de la imagen del proceso.
- RSS: El tamaño del conjunto residente (la porción de la memoria que realmente ocupa el proceso en la RAM).
- TTY: El terminal asociado al proceso (si existe).
- STAT: El estado actual del proceso (ej: S para sleeping, R para running).
- START: La hora o fecha en que se inició el proceso.
- TIME: La cantidad total de tiempo de CPU que el proceso ha utilizado.
- COMMAND: El comando que se ejecutó para iniciar el proceso.

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
<br>
<br>
### 📄 *validar_entrada.sh*

Este script contiene funciones que pueden ser importadas por otros scripts para validar entradas del usuario, como por ejemplo si un PID es válido.

🔍 Funciones incluidas:

es_entero_positivo(valor)
- Verifica si el valor ingresado es un número entero positivo.

pid_existe(pid)
- Verifica si el número ingresado corresponde a un PID existente en el sistema.

Para usar estas funciones desde otro archivo, se debe importar el script con source:

source ./validar_entrada.sh
<br>
<br>
### 📄 *main.sh*

Este es el script principal del toolkit. 

🔍 Funcionamiento:

Se encarga de presentar el menú general al usuario, desde donde se puede acceder a los distintos módulos del sistema:
- Gestión de procesos
- Información de memoria
- Uso de disco y archivos
- Administración de usuarios y grupos
- Chequeos de seguridad
- Salir

Cada opción del menú ejecuta scripts independientes, ubicados en carpetas específicas dentro de <code>`modulos/`</code>. El menú permanece activo hasta que el usuario elige salir.
<br>
<br>
### 📄 *procesos.sh*

Este script representa el módulo de Gestión de Procesos, y es invocado desde <code>`main_toolkit.sh`</code>.

🔍 Funcionamiento:

Muestra un submenú específico con distintas opciones relacionadas al control y monitoreo de procesos en el sistema. Entre las funcionalidades que ofrece:

Listar todos los procesos
- Ver detalles por PID
- Terminar procesos (suavemente o de forma forzada)
- Suspender/reanudar procesos
- Cambiar la prioridad (nice value)
- Abrir el monitor en tiempo real (<code>`top`</code>)

Cada funcionalidad se encuentra implementada en su propio archivo .<code>`.sh`</code>, y <code>`procesos.sh`</code> se encarga de invocarlos según la selección del usuario.
<br>
<br>
### 📄 *listar_procesos_todos.sh*

🔍 Funcionamiento:

Este script implementa la función de mostrar todos los procesos en ejecución.
<br>
<br>

- Utiliza el comando (<code>`ps aux`</code>) para mostrar la lista completa.
- Muestra los resultados con formato y encabezado.
- Incluye una opción para volver al submenú de procesos.
- Brinda una interfaz amigable, clara y con mensajes informativos para el usuario.

Este archivo es parte del módulo de procesos, ubicado típicamente en (<code>`modulos/procesos/`</code>).


### 📄 Forzar_proceso.sh
🔍 Funcionamiento:

Al selecionar este script implementa la función de terminar un proceso de forma forzada.
<br><br>

- Utiliza el comando (<code>kill -9 <PID></code>) para enviar la señal SIGKILL al proceso indicado.

- Elimina inmediatamente el proceso, sin darle oportunidad de liberar recursos.

- Solicita al usuario que ingrese el PID del proceso a finalizar.

- Brinda mensajes claros e informativos sobre el resultado de la acción.

- Incluye opción para volver al submenú de procesos.


### 📄 suspender_proceso.sh 💤
🔍 Funcionamiento:

Este script implementa la función de suspender un proceso temporalmente.
<br><br>

- Utiliza el comando (<code>kill -19 <PID></code>) para enviar la señal SIGSTOP.

- El proceso queda detenido, pero puede reanudarse más tarde con kill -18 &lt;PID&gt;.

- Solicita al usuario que ingrese el PID del proceso a suspender.

- Informa al usuario si la suspensión fue exitosa o no.

- Incluye opción para volver al submenú de procesos.

- Este archivo es parte del módulo de procesos, ubicado típicamente en (<code>modulos/procesos/</code>).

### 📄 reanudar_proceso.sh 💤
🔍 Funcionamiento:

- Esta función permite reanudar un proceso que ha sido pausado o suspendido.
 
- Solicita al usuario que ingrese el PID (identificador del proceso) y pide confirmación antes de enviar la señal SIGCONT (código 18).
 
- La señal SIGCONT reanuda la ejecución de procesos detenidos mediante SIGSTOP o Ctrl+Z.
 
- Si la señal se envía correctamente, se muestra un mensaje confirmando la acción; de lo contrario, se informa de un error.
 
<br>
<br>

<h2>⚙️ Requisitos de Ejecución</h2>

Para ejecutar correctamente el Toolkit, se requiere lo siguiente:

- Sistema operativo: Linux (preferentemente Ubuntu o Debian).
- Bash Shell.
- Permisos de ejecución para los scripts (`chmod +x nombre_script.sh`).
- Paquete `dos2unix` instalado (si los scripts fueron editados desde Windows):
  ```bash
  sudo apt update && sudo apt install dos2unix -y

**Convertir archivos si es necesario:**
  ```bash
dos2unix *.sh
