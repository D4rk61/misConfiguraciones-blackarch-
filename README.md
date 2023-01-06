# Configuracion de mi Sistema (Escritorio y Programas)
## Actualmente usando un **"[BlackArch](https://blackarch.org/)"**

---

![[Pasted image 20230104033607.png]]


**Nota:
Es importante antes de empezar crear un backup de algunos ficheros que tocaremos/modificaremos por si algo llega a salir mal o parecido**

Creacion de un backup:
```bash
# DIgamos que queremos crear un backup al archivo "escencial.txt"

ls 
escencial.txt

cp escencial.txt escencial.txt.backup

ls
escencial.txt escencial.txt.backup

# listo el .backup lo dejaremos, pero el que no tiene esa extension podremos hacerle lo que querramos
```
<br>

### Indice:

#### - [Reparar los mirrors](#Terminal)
#### - [Ajustes de Terminal](#Terminal)
#### - [Entorno de Escritorio](#Escritorio)
#### - [Aplicaciones Favoritas](#Aplicaciones)



# Terminal

**Comandos Basicos**
Auque este no sa un "tutorial" para comandos basicos en linux, siempre es importante tenerlos en mente, asi que aqui van (Comandos para la mayor cantidad de distribuciones linux)
```bash

# Manipulacion de archivos y directorios

mkdir carpeta1
rm carpeta1
mv carpeta1 nuevo_nombreCarpeta1

# Administacion de paquetes (pacman)

sudo pacman -Syy
sudo pacman -Syu
sudo pacman -Rs
sudo pacman -Syyu

# EN yay es lo mismo que pacman solo cambiamos la palabra

yay -Syy

```

**Terminal usada "Terminator"**

Archivo de configuracion de terminator, este archivo se encuentra en `~/.config/terminator/config` lo que se debe de hacer es reemplazar `config` por el que esta acontinuacion

```bash
sudo pacman -S terminator
```

Posterior con vim acceder e ingresar el siguiente [archivo-configuracion](terminal_configs/config)

<br>

**Administrador de Paquetes (yay)**
Este a mi punto de vista es el mejor administrador de paquetes para **Archlinux** y es parte indispensable para la mayoria de las cosas que tengo instaladas

```bash

sudo pacman -S git

# CLonaremos el repo
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

```

<br>

**Zsh - Parte Extensa**
Instalacion y "tunear" a **zsh**

```bash
sudo pacman -S zsh
```
Para tener esta terminal por defecto, realizaremos lo siguiente:

```bash
> chsh
> Nuevo intérprete de órdenes [/bin/zsh]: 

# Ingresamos lo siguiente

> /bin/zsh
```

Posterior cerramos y volvemos a abrir la terminal


Una vez estando aqui este es bien feo, asi que instalaremos "oh my zsh" via **yay**

```bash
# Esta version puede ser algo inestable, asi que posterior estara la ver. normal

yay -S oh-my-zsh-git

# version normal:

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

Una vez este instalado, si mal no recuerdo, este seguira siendo algo feo asi que procederemos a tunear zsh
**Powerlevel10k** - https://github.com/romkatv/powerlevel10k

![[Pasted image 20230104040843.png]]

Alli lo explica mejor, ya que es el repo oficial

Pero tambien misma historia podremos usar **yay para usar una version en desarrollo**


Pero los pasos son los siguiente:

1. Instalacion de la funte recomendada (opcional) 

https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

![[Pasted image 20230104040557.png]]


2. Agregar la antes descarga o el paquete de fuente de letra, para esto dejare el siguiente video 

https://youtu.be/AzTcKjcBD5w


3. Instalacion de **powerlevel10k**

https://github.com/romkatv/powerlevel10k#installation
Aqui hay varias opciones, entre ellas uar yay, pero en este caos usaremos la version de **ohmyzsh** ya que es la mas sencilla a mi parecer

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Luego de esto, iremos al archivo  de configuracion llamado: `~/.zshrc` y buscaremos la linea (mayormente en la linea 17-18):

![[Pasted image 20230104041216.png]]

borraremos la linea (lo que sea que diga en "ZSH_THEME") e ingresaremos:


```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Posterior a esto Pasaremos a esto pasaremos a instalar los plugins, **oh my zsh** ya los trae integrados solo es cuestion de agregarlos en un archivo de confg, (Algunos los tendremos que instalar manualmente, pero para esto instalamos anteriormente **yay** para que este proceso sea mucho mas facil)

**Nota:
Para este punto es buena idea, el cerrar la terminal y volverla a abrir o reiniciar el sistema para que estos cambios se apliquen, otro consejo es usar el siguiente comando para actualizar el arhcio `zshrc` el comando es:**

```bash
source ~/.zshrc
```

Por ultimo, para configurar esta shell (powerlevel) usaremos el siguiente comando:

```bash
p10k configure
```

Asi tal cual, para configurar la shell

<br>

Bueno ahora si, los plugins
**Instalacion de Plugins para zsh (oh my zsh)**

Para esto entraremos al archivo de:

```bash
vim ~/.zshrc
```

Y haremos lo siguiente:

![[Pasted image 20230104041931.png]]

Como mencione algunos plugins los tendremos que instalar por nuestra cuenta, asi que usaremos **yay** para esto, algunos ejemplos:

```bash
# Ayuda al escribir comandos 
yay -S oh-my-zsh-plugin-autosuggestions

# Resaltar sintaxis en bash-shell
yay -S oh-my-zsh-plugin-syntax-highlighting
```

Cabe siempre resaltar que al ejecutar comandos en yay, no los tendremos que ejecutar con **sudo** ya que posterior nos pedita confirmacion de sudo

<br>

Para mejorar nuestra terminal, al ejecutar el comando `ls` nos lista lo que este dentro del directorio, asi que instaremos **lsd** que es una mejora

```bash
yay -S lsd
```

**Nota:
Existen muchas mas configuraciones, me atrevo a decir que hasta semi-infinitas pero estas son las mas destacables a mi perspectiva, esta configuracion de "powerlevel10k" tambien se tendra que hacer para otros usuarios, por ejemplo el de sudo**


<br>


# Escritorio
### Entorno de escritorio usado xfce4

Lo se.. Es un entorno viejo o para pc con pocos recursos, pero este es excelente para desarrollo o yo lo siento mas comodo

- Cabe resaltar que este lo trae por defecto **blackarch** para le dare un pequeño retoque, en este punto realizaremos algunos **shorcuts** propios

_Shorcut:
Se refiere cuando usamos ciertas o cierta tecla y hace alguna accion_


<br>

La version que trae por defecto **blackarch** es bastante fea, asi que procederemos a retocarla

**Advertencia/Importante:
Antes de realizar este proceso procederemos a realizar una copia de seguridad (backup) esto lo haremos de la siguiente manera**


Esta parte del repo solo aplica si quieres usar xfce4 como tu entorno de escritorio, ya que si quieres usar algun otro como **gnome** o **kde** no servira de nada

1. Creacion del backup

```bash

# Ingresaremos a la siguiente carpera

cd ~/.conf
# Creremos una copia de seguridad de la carpeta
cp xfce4 backup_xfce4

```

2. Dejaremos el "backup_xfce4" de lado y nos centraremos en xfce4 la carpeta, posterior la borraremos usando

```bash
rm -r xfc4
```

3. Pegaremos la siguiente carpeta, (Llamada [**xfce4**](desktop_configs/xfce4) en el repositorio por si acaso) la pegaremos y esta tomara el lugar de la anterior carpeta de xfce4

4. Reiniciaremos la pc y listo 

5. **Plan B** en caso que haya algun problema, al ingresar nuestrar donde nos pide la contraseña y algo salga mal, no nos cargara el admin de pantalla, entonces tendremos que ingresar por via terminal a nuestro sistema de la siguiente manera


```bash
CTRL + ALT + F2/F3/F4
# Para F2 hay varias opciones no importa cual

cd ~/.config

# Paso importante, renombrar a nuestro backuo como el archivo que perdimos
mv backup_xfce4 xfce4

# Reinicio del sistema para que los cambios se apliquen

reboot
```

Si llega a pasar esto, se tendra que realizar de manera manual el proceso

**Nota:
No te asustes si en fondo de pantalla aparece un fondo como.. morado, solo es cuestion de cambiar el fondo de pantalla!** 
<br>

**Shorcuts para Xfce4**

1. Crearemos la misma historia del backup pero esta vez del archivo `xfce4-keyboard-shortcuts.xml` 

```bash
# Creacion del backup
cp xfce4-keyboard-shortcuts.xml xfce4-keyboard-shortcuts.xml.backup

rm xfce4-keyboard-shortcuts.xml

# Posterior a eliminar el antiguo y dejar el backup
```

2. Reemplazaremos el antiguo **dejaremos el backup en paz** y lo reemplazaremos por el siguiente: [archiv-shotcuts](desktop_configs/shorcuts/xfce4-keyboard-shortcuts)

**Nota:
Si en caso los enlaces no funcionan los archivos se encontraran en las carpetas del repositorio 
2do: Si llega a salir mal solo tendremos que quitarle el .backup al archivo antes creado y eliminaremos el que copiamos del repo, es decir:

```bash
rm [archivo/carpeta dañada]
mv archivo/carpeta.backup [archivo_actual]

# Es decir:

rm carpeta_nueva
mv carpeta_anituga.backup carpeta_nueva
```

<br>

# Mirrors
### Configuracion de los mirrors 
_Esto es semi escencial al momento de una nueva instalacion de un sisteama basado en blackarch ya que los repos y mirrors suelen estar desactualizados_

configuracion recomendada, en el archivo `vim /etc/pacman.d/mirrorlist` crear un backup como lo hemos hecho anteriormente, posterior agregaremos el siguiente [**mirrorlist**](configs_general/mirrorlist)

El hacer esto nos resolvera el problema de los mirrors, ya podremos ejecutar actualizaciones y demas!!

<br>

### Solucion de Errores
**Parte mas estresante...**

1. Solucionar un error al actualizar el sistema por primera vez, nos dara un error de mirrors o algo asi, por lo que cree la seccion anterior, posterior a esto, **forzaremos la actualizacion** ya que el sistema es algo antiguo.

Actualizaremos el sistema de la siguiente manera para ahorrar tiempo, (Aclaro que esta parte simpre me da algunos fallos asi que no estoy seguro si se solucionara todo)

```bash
sudo pacman -Syy --noconfirm && sudo pacman-key --refresh-keys && sudo pacman-key --populate archlinux && sudo pacman-key --populate blackarch 

# Posterior a esto es recomendable que el sistema se reinicie
reboot
```
2. Instalacion del paquete **keyring**
Para eso dejare el siguiente video https://youtu.be/qAjDSL28ums
Pero en un gran resumen, es pegar el siguiente comando, posterior a refrescar las claves gpg del paso 1

```bash
sudo pacman -S archlinux-keyring

# Posterior a esto cerramos la terminal y volvemos a abrirla y ejecutaremos el paso 3
```

3. **Momento de la instalacion, posterior de la actualizacion de las claves gpg**

```nash
sudo pacman -Syu --overwrite='*' --noconfirm 
```

Este "refresco de las bases de datos" y la actualizacion de bases de los mirrorlist sera mas que sufciente para que nuestro blackarch este a full!

Posterior, podras crear, instalar lo que tu quieras con tu sistema

_Listo! Acabamos de dejar el sistema **blackarch** en total uso, puedes seguir usando esta guia para ayudarte en tu instalacion o puedes instalar lo demas a tu gusto!_
<br>

# Aplicaciones

Usando yay mayormente instalaremos las aplicaciones que mas uso o las mejores aplicaciones o las mas tops (Siempre y todo esto basado en mi experiencia)


- **Only-Office** como alternativa de office
- **[Virtual-Box](https://denovatoanovato.net/instalar-virtualbox-en-archlinux/)** en esa pagina esta con mejor detalle la instalacion
- **ChatGPT** esta es una aplicacion web pero igual es **demmasiado util** 
- Como editor de texto uso **vim** posterior comenzare a usar neovim, pero mas adelante dare algunas configuraciones basicas para vim
- **SimpleScreenSaver**
- **Foliate** para leer libros
- **Jupyter-Lab** para desarrolo de python y ciencia de datos
- **Obsidian** para creacion de mi "cerebro digital" (organizacion de tareas y notas)
- **SuperTux** para matar el tiempo jaja
- **fguf** firewall o anti-malware
- **terminator** para emulador de terminal jaja creo que ya quedo claro y combinacion de **tmux** y **oh-my-tmux**
- **vscode** o code-oss para mi editor grafico 
- **nmap y zenmap** para escaneo de mi propia pc y para ver si un sitio es seguro
- **Stacer** para control de recrusos del pc
- **pseint** para elaborar mis ideas para posterior codigo y **pseudo-codigo**
- **telegram-desktop** comunizacion entre telefono y pc (linux)
- **redshift y safe-eyes** para proteger la vista  

_Mas adelante como mencione mostrare/creare un script en bash que al ejecutarlo instale todo por automatico_

<br>

###### Archivo de configuracion de **vim**
Para configurar vim de la mejor manera instalando syntaxis y demas deberas de ir al siguiente archivo y si no existe se debera de crear: `~/.vimrc` 
Y para aplicar cambios ante este se deberra de usar el comandos  `source ~/.vimrc` usar el siguiente archivo de texto

```bash

set clipboard=unnamedplus
set showmode
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
syntax on
set number
set cursorline
set sw=2
set number 
set ruler
set showmatch
set mouse=a
set numberwidth=1
set showcmd
set clipboard=unnamed
set encoding=utf-8
set background=dark
set title
filetype indent on

```

Si asi lo deseas tambien estara en la carpeta de **scripts** solo usas: `ls -la` para listar los archivos ocultos y lo mueves a la ruta dicha anteriormente `.vimrc`

###### oh-my-tmux
https://github.com/gpakosz/.tmux En este repositorio estara la configuracion para **tmux** que es una ayuda para la terminal, si no aqui los comandos necesarios para instalarlo **Nota: Esto se debe instalar tanto en el usuario normal como en el root** 

```bash
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

Uno por uno, no todos de golpe o usar `&&` para separarlos