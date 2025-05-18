<h1 align="center"> 🛠️ Toolkit de Administración Jr. </h1>
<br>
<br>
Toolkit de Administración Jr. es una herramienta funcional basada en Bash, desarrollada para simplificar tareas básicas de administración en sistemas Linux (Ubuntu/Debian). Diseñada para ser utilizada por estudiantes, usuarios principiantes o administradores de sistemas en pequeñas startups o entornos educativos, este toolkit ofrece un menú interactivo y accesible desde la terminal que permite realizar tareas clave como monitoreo de procesos, análisis de recursos del sistema, gestión de usuarios, entre otras.

El proyecto se construyó bajo una estructura modular, utilizando scripts individuales para cada funcionalidad, lo que facilita la lectura, mantenimiento y extensión futura del sistema.

<h2 align="center"> 🧩 Scripts del Toolkit </h2>

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




