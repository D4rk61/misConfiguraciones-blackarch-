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

#### - [Ajustes de Terminal](#Terminal)
#### - [Entorno de Escritorio](#Escritorio)



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

### Configuracion de los mirrors 

configuracion recomendada, en el archivo `vim /etc/pacman.d/mirrorlist` crear un backup como lo hemos hecho anteriormente, posterior agregaremos el siguiente [**mirrorlist**](configs_general/mirrorlist)