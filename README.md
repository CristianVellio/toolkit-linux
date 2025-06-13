<h1 align="center"> 🛠️ Toolkit de Administración Jr. </h1>
<div align="center">
<img src="https://github.com/user-attachments/assets/27c1f99f-f9b7-4059-98ac-8f396863f6a2" alt="tools" width="600" height="400">
</div>

<br>
<br>
<br>
Toolkit de Administración Jr. es una herramienta funcional basada en Bash, desarrollada para simplificar tareas básicas de administración en sistemas Linux (Ubuntu/Debian). Diseñada para ser utilizada por estudiantes, usuarios principiantes o administradores de sistemas en pequeñas startups o entornos educativos, este toolkit ofrece un menú interactivo y accesible desde la terminal que permite realizar tareas clave como monitoreo de procesos, análisis de recursos del sistema, gestión de usuarios, entre otras.

El proyecto se construyó bajo una estructura modular, utilizando scripts individuales para cada funcionalidad, lo que facilita la lectura, mantenimiento y extensión futura del sistema.
<br>
<br>
<br>
<h2 align="center"> 🧩 Scripts del Toolkit </h2>

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
<br>
<h2 align="center"> 🧩 Scripts de Procesos </h2>

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
<br>
<br>

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
<br>
<br>

### 📄 *terminar_proceso_suave.sh*

Esta función permite terminar un proceso en ejecución enviando una señal de terminación suave (SIGTERM). Le solicita al usuario que ingrese el PID del proceso que desea finalizar. Utilizando el comando 'kill <PID>' se envia la señal SIGTERM. Esta señal da al proceso la oportunidad de cerrarse de forma ordenada, guardando su estado si es necesario.

🔍 Funcionamiento:

Al seleccionar la opción correspondiente en el menú, el script pedirá al usuario que ingrese el número PID del proceso que desea terminar.

Antes de enviar la señal, el script preguntará al usuario si está seguro de que desea terminar el proceso con el PID ingresado. El usuario deberá ingresar "s" o "S" para confirmar y cualquier otra cosa para cancelar la operación.

Si el usuario confirma, el script utiliza el comando kill <PID> (que por defecto envía la señal SIGTERM) al proceso especificado.

Después de intentar enviar la señal, el script mostrará un mensaje indicando si la señal se envió correctamente. Sin embargo, es importante tener en cuenta que el script solo envía la señal; el proceso en sí decide si y cómo responder a ella. Algunos procesos pueden ignorar esta señal.

Importante: Utilizar la terminación suave es la forma recomendada de finalizar un proceso, ya que le permite realizar una limpieza antes de cerrarse. Solo en casos donde un proceso no responde a SIGTERM se debería considerar el uso de la terminación forzada (kill -9), la cual tus compañeros implementarán.
<br>
<br>

### 📄 terminar_proceso_forzado.sh
🔍 Funcionamiento:

Al selecionar este script implementa la función de terminar un proceso de forma forzada.
<br><br>

- Utiliza el comando (<code>kill -9 <PID></code>) para enviar la señal SIGKILL al proceso indicado.

- Elimina inmediatamente el proceso, sin darle oportunidad de liberar recursos.

- Solicita al usuario que ingrese el PID del proceso a finalizar.

- Brinda mensajes claros e informativos sobre el resultado de la acción.

- Incluye opción para volver al submenú de procesos.
<br>
<br>

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
<br>
<br>

### 📄 reanudar_proceso.sh 💤
🔍 Funcionamiento:

- Esta función permite reanudar un proceso que ha sido pausado o suspendido.
 
- Solicita al usuario que ingrese el PID (identificador del proceso) y pide confirmación antes de enviar la señal SIGCONT (código 18).
 
- La señal SIGCONT reanuda la ejecución de procesos detenidos mediante SIGSTOP o Ctrl+Z.
 
- Si la señal se envía correctamente, se muestra un mensaje confirmando la acción; de lo contrario, se informa de un error.
<br>
<br>

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

### 📄 *cambiar_prioridad_proceso.sh*

Este script permite modificar la prioridad de ejecución de un proceso específico utilizando el comando "renice".
La prioridad puede establecerse con un rango de **-20** (mayor prioridad) a **19** (menor prioridad), siempre que el usuario cuente con los permisos necesarios.

🔍 Funcionamiento:

1. Solicita al usuario el **PID** del proceso que desea modificar.
2. Solicita el nuevo valor de **prioridad** (nice).
3. Ejecuta el comando `renice` con los valores ingresados para cambiar la prioridad del proceso.

⚠️ **Importante:**  
Modificar la prioridad de procesos puede requerir privilegios elevados (por ejemplo, `sudo`) si el proceso no pertenece al usuario actual.
<br>
<br>
<br>

<h2 align="center"> 🧩 Scripts de Memoria </h2>

### 📄 *memoria.sh*
Este script representa el módulo de Gestión de Memoria, y es invocado desde main_toolkit.sh.

🔍 Funcionamiento:

Muestra un submenú específico con distintas opciones relacionadas al monitoreo del uso de memoria del sistema. Las funcionalidades disponibles incluyen:

- Ver el uso actual de RAM y SWAP

- Consultar un resumen de /proc/meminfo

- Obtener estadísticas de procesos y uso de memoria con vmstat

Cada funcionalidad está implementada en su propio archivo .sh dentro del directorio modulos/memoria/, y memoria.sh se encarga de invocarlos según la selección del usuario.

<br>
<br>
### 📄 *UsoRam.sh*
Este script permite visualizar el uso actual de la memoria RAM y la memoria SWAP del sistema (memoria virtual) , utilizando el comando free -h con una interfaz simple y legible para el usuario.

🔍 Funcionamiento:

- Limpia la pantalla para una mejor visualización.

- Muestra un título con formato en color cian.

- Ejecuta el comando free -h para mostrar el uso actual de la RAM y SWAP en un formato legible (por ejemplo, MB o GB).

- Espera que el usuario presione Enter para regresar al menú u otra sección del script.

<br>
<br>

### 📄 *vmstat.sh*
Este script proporciona un menú interactivo para visualizar estadísticas del sistema relacionadas con memoria, procesos y disco utilizando el comando vmstat. Está pensado como una herramienta accesible para usuarios que desean obtener información clave del sistema sin memorizar comandos.

🔍 Funcionamiento:

Al ejecutarlo, se muestra un menú con las siguientes opciones:

1_Ver resumen del sistema (vmstat -s)
Incluye análisis del uso de la memoria swap con advertencias si se detecta uso elevado.

2_Ver actividad en tiempo real (vmstat 1 5)
Muestra 5 muestras de estadísticas con intervalos de 1 segundo.

3_Ver estadísticas de disco (vmstat -d)

4_Ver paginación del disco sda (vmstat -p sda)

5_Ver memoria activa/inactiva (vmstat -a)

6_Ver número de procesos creados desde el arranque (vmstat -f)

7_Volver al menú anterior o salir

🛠️ Requisitos:

El comando vmstat debe estar instalado
<br>
<br>
<br>

<h2 align="center"> 🧩 Scripts de Disco </h2>

### 📄 *disco.sh*

Este script implementa el módulo de uso de disco y archivos del Toolkit de Administración Jr. Su objetivo es brindar a los usuarios una forma sencilla de obtener información clave relacionada con el uso del sistema de archivos.

🔍 Funcionamiento:

Al ejecutar `disco.sh`, se despliega un submenú interactivo con opciones para:

Ver espacio libre/usado en discos montados
Invoca el script `espacio_disco.sh`.

Calcular el tamaño de un archivo o directorio
Ejecuta el script `tamaño.sh`.

Listar archivos de un directorio
Llama a `listar_archivos.sh`.

Volver al menú principal
Finaliza la ejecución del submenú y devuelve el control a `main_toolkit.sh`.

🔁 El menú permanece activo hasta que el usuario elige la opción de volver.

💡 Este módulo está pensado para facilitar la gestión de espacio en disco, especialmente útil para verificar informacion sobre uso de particiones o limpiar archivos innecesarios.
<br>
<br>

### 📄 *especio_disco.sh*

Este script muestra un informe claro y visual del espacio en disco utilizado por las particiones montadas en el sistema.

🔍 Funcionamiento:

Utiliza el comando:

```bash
df -h --output=source,size,used,avail,pcent,target
```

Este comando muestra:

  - Sistema de archivos (`source`)

  - Tamaño total

  - Espacio usado

  - Espacio disponible

  - Porcentaje de uso

  - Punto de montaje

 Se omite la primera línea del encabezado con `tail -n +2` para mostrar solo los datos relevantes al usuario.

 Al finalizar, se espera que el usuario presione Enter para volver al submenú, evitando que la información desaparezca inmediatamente.

🎯 Objetivo:
Brindar una vista rápida del estado de almacenamiento en el sistema, muy útil para monitorear particiones llenas o identificar problemas de espacio antes de instalar software, hacer backups o guardar grandes volúmenes de datos.
<br>
<br>

### 📄 *listar_archivos.sh*

Este script permite listar archivos y directorios del sistema de forma interactiva desde la terminal. 

🔧 ¿Qué hace?
Ofrece un menú interactivo para:

Elegir un directorio (actual, /home, /root, personalizado, o todo el sistema).

Elegir el tipo de listado (simple, completo, recursivo).

Ver los resultados con ls, adaptado a la opción elegida.


📜 Estructura del Menú

El usuario puede elegir entre:

  Directorio actual (.)

  Directorio /home

  Directorio /root

  Ingresar una ruta manual

  Listar todo el sistema (/)

  Salir al menú anterior

Seleccionar Tipo de Listado

  ls: listado simple

  ls -l: listado con detalles (permisos, tamaño, etc.)

  ls -R: listado recursivo

  ls -lR: listado completo y recursivo
<br>
<br>

### 📄 *tamaño.sh*


🔍  Función calcular_tamaño()
 
  Esta función permite al usuario calcular el tamaño total de un archivo o directorio específico. Utiliza el comando 'du -sh <ruta>', donde:

  -s muestra solo el total, sin desglosar subdirectorios
 
  -h presenta el resultado en un formato legible (KB, MB, GB, etc.)
 
   Primero verifica si la ruta ingresada existe, luego solicita confirmación, y finalmente muestra el tamaño total si se confirma la operación.


<br>
<br>
<br>

<h2 align="center">⚙️ Requisitos de Ejecución</h2>

Para ejecutar correctamente el Toolkit, se requiere lo siguiente:

- Sistema operativo: Linux (preferentemente Ubuntu o Debian).
- Bash Shell.
  
<h3>Metodo 1:</h3>

1. Posicionarse en la carpeta donde esta ubicada la aplicacion
2. Utilizar el comando 'chmod -R a+rwx .' para darle permiso recursivo a toda la carpeta
   
<h3>Metodo 2:</h3>

- Permisos de ejecución para los scripts (`chmod +x nombre_script.sh`).
- Paquete `dos2unix` instalado (si los scripts fueron editados desde Windows):
  ```bash
  sudo apt update && sudo apt install dos2unix -y

**Convertir archivos si es necesario:**
  ```bash
dos2unix *.sh 


