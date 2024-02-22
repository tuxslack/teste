#!/bin/bash


################################################################
#
# Script_Name: ypartclone.sh
#
# Description: Eu preciso de uma ferramenta que eu possa criar uma imagem de partição do sistema instalado de modo que eu possa usá-la em outro HD em outra Máquina.
# Norton Ghost, Acronis True Image, Macrium Reflect.
#
# No caso de máquinas Windows tem até o recurso do SysPrep para limpar referências de Drivers e Chave Serial, permitindo, a partir de uma cópia dessa partição em 
# um DVD, realizar instalações em outras máquinas sem conflito de hardware e com sua própria liçenca.
#
# 
# partclone - O utilitário para clonar e restaurar uma partição.
#

# Clona a partição numa imagem junto com a MBR (.mbr) e tabela de partição (.sf) para uma futura restauração de imagem em um HD de mesma capacidade.



# Uma grande dificuldade de administradores de sistema é a perda de tempo quando o assunto é reinstalar o sistema. Quando temos várias 
# máquinas com o mesmo hardware (ou parecido) podemos fazer a clonagem dos HD. Para este fim temos vários programas que fazem a clonagem, 
# mas no geral só podem ser feitos abrindo as máquinas e colocando o HD a ser clonado. Este procedimento gera uma série de transtornos 
# como ter que abrir as máquinas e algumas vezes o HD tem de ser iguais, sem contar que você só pode fazer uma máquina por vez.

# O Ghost cria imagens compactadas e com isto você pode criar um HD clonado.  Com o Ghost podemos criar a imagem 
# da máquina já montada e configurada e hospedá-la em um servidor FTP ou servidor SAMBA de forma compactada, possibilitando baixar pela rede montando em 
# vários computadores ao mesmo tempo e de forma bastante rápida. O sistema monta imagem de HDs completos ou apenas partições. Pessoalmente 
# prefiro a imagem do HD completo por causa da MBR que também é copiada desta forma. Você pode criar a imagem de um HD pequeno, assim se 
# adapta a HDs maiores, mas nunca o contrário. O restante do HD você particiona depois para usar como disco de dados ou coisa parecida. 

# Configurando o servidor

# Para fazermos a clonagem dos HDs, precisamos de um servidor para armazenar elas e depois podermos baixar para os demais computadores. 


# Clonagem e restauração de sistema
# Clonar partições do HD no Linux
# Realiza a clonagem de HD/SSD


# Program to start saving or restoring image.
# 
# Partclone uma ferramenta de restauração e clonagem de partição. Ele nos fornecerá utilitários 
# para fazer cópias de backup e restaurar partições. Ele foi projetado para maior compatibilidade da biblioteca 
# do sistema de arquivos. Foi desenvolvido pelo NCHC Free Software Labs em Taiwan.
# 
# Variedade de formatos suportados, eles incluem: ext2, ext3, ext4, hfs +, reiserfs, reiser4, btrfs, vmfs3, vmfs5, 
# xfs, jfs, ufs, ntfs, fat (12/16/32), exfat, f2fs e nilfs.
#
# Date: 
# written by: Fernando
# Web Site:
# Version : 0.2
# History : 0.2 - Added Logic for Ubuntu 17.10 and 18.04 detection 
#               - Updated the polkit section
#               - New formatting and structure  
#           0.1 - Initial Script       
# Disclaimer : Script provided AS IS. Use it at your own risk....
#
# Relate bugs para  thomas@nchc.org.tw ou http://partclone.org (Yu-Chin Tsai)
#
##################################################################


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/yad/Criar-menu-com-radiolist
# https://cleitonbueno.com/linux-estudando-e-explorando-o-21/
# https://ubunlog.com/pt/partclone-software-gratuito-la-clonacion-particiones-e-imagenes/
# https://github.com/Thomas-Tsai/partclone
# https://partclone.org/help/
# https://theholyjava.wordpress.com/2010/08/10/disk-backup-with-clonezilla/
# https://manpages.ubuntu.com/manpages/trusty/man8/partclone.8.html
# https://www.edivaldobrito.com.br/como-usar-o-partclone-no-linux/
# https://sobrelinux.info/questions/832484/failed-to-use-partclone-program-to-save-or-restore-an-image
# https://github.com/linuxhw
# https://superuser.com/questions/833697/clonezilla-what-are-all-these-files
# https://doc.lagout.org/Others/rmll/02-lsm2015-clonezilla-v1.1.pdf
# https://www.vivaolinux.com.br/topico/Hard-on-Linux/Deletou-a-TABELA-de-particao-acidentalmente-com-GPARTED
# https://wiki.archlinux.org/title/Partitioning_(Portugu%C3%AAs)
# https://www.hardware.com.br/artigos/clonagem-backup-partimage/
# https://www.certificacaolinux.com.br/backup-do-mbr-com-o-comando-dd/
# https://www.shellscriptx.com/2016/12/estrutura-condicional-if-then-elif-else-fi.html
# https://www.vivaolinux.com.br/artigo/Criar-CD-de-instalacao-a-partir-do-HD/
# https://www.tecmundo.com.br/sistema-operacional/113499-8-sistemas-operacionais-alternativos-windows-voce-precisa-conhecer.htm
# https://canaltech.com.br/hardware/como-clonar-um-hd-para-um-ssd-211318/
# https://www.avg.com/pt/signal/how-to-clone-a-hard-drive
# https://clonezilla.org/
# https://www.youtube.com/watch?v=IgOjDrfvLy4
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=4566




# Convert Clonezilla partition image into ISO?
 
# cd /home/partimag/YOURIMAGE/
# touch hda2.img
# cat dir/hda2.ntfs-ptcl-img.gz.* | gzip -d -c | partclone.restore -C -s - -o hda2.img
# mount -o loop hda2.img /mnt

# https://www.linuxquestions.org/questions/linux-software-2/convert-clonezilla-partition-image-into-iso-4175602088/



# Gravando imagens num compartilhamento da rede ou localmente
#
# Os clientes podem montar as pastas compartilhadas através do comando:
# mount -t nfs 192.168.0.1:/home/arquivos /home/arquivos
#
# Onde o “192.168.0.1:/home/arquivos” é o endereço do servidor, seguido pela pasta que está sendo compartilhada e 
# o “/home/arquivos” é a pasta local onde o compartilhamento está sendo montado.
#
# Para que a alteração seja definitiva você deve adicionar este comando no arquivo /etc/fstab. A sintaxe neste arquivo 
# fica um pouco diferente, mas os parâmetros são basicamente os mesmos. O comando acima ficaria assim se adicionado no fstab:
#
# 192.168.0.1:/home/arquivos /home/arquivos nfs defaults 0 0

# No Kurumin 2.0 em diante você pode compartilhar arquivos com outras máquinas e acessar os compartilhamentos mais facilmente através dos ícones no Iniciar > Sistema

# Você pode salvar e restaurar imagens em uma pasta montada via NFS da mesma forma que faria com um arquivo local.


# Livro: Entendendo e Dominando o Linux
#
# https://github.com/free-educa/books/blob/main/books/Livro%20de%20Entendendo%20e%20Dominando%20o%20Linux.pdf



# Qual o sistema de arquivo do Mac - Apple File System (APFS)?
#
# APFS é um sistema de arquivos criado pela Apple para as versões mais modernas do macOS. Ele t
# ambém é utilizado nos sistemas operacionais dos outros produtos da empresa, como iOS, IpadOS, 
# watchOS e tvOS. Saiba mais sobre o APFS e quais benefícios ele traz para o seu dispositivo Apple.



# ==========================================================================================

# Variaveis global:


# Arquivo de log

log="/tmp/partclone.log"


descricao="Script de manutenção de sistema"
versao="versão 0.2"
autor="Fernando Souza"
data="Janeiro de 2024"
# site1="YouTube - @fernandosuporte"
site="https://www.youtube.com/@fernandosuporte/videos"


# ==========================================================================================





clear


verificar(){


# ==========================================================================================


# Instalação automática de programas


# systemrescue-11.00-amd64.iso não tem "lsb_release"

# which lsb_release

# version=$(lsb_release -d | awk -F":" '/Description/ {print $2}')


version=$(cat /etc/os-release | grep "PRETTY_NAME=" | cut -d= -f2 | sed 's/"//g')
# Void Linux
# Ubuntu 23.10



# REFERÊNCIAS:

# https://listman.redhat.com/archives/fedora-users-br/2007-September/msg00019.html


# ==========================================================================================

pacotes="/tmp/pacote.log"

 

# Dependências:


# No arquivo "systemrescue-11.00-amd64.iso" não tem os pacotes: yad e xterm

echo "yad
xterm
split
gparted
gpart
cfdisk
dmidecode
lshw
lspci
lsblk
parted
dd
sfdisk
gpart
testdisk
fdisk
mount
umount
date
ntfs-3g
setxkbmap
ntfsfix
bc
sed
ip
cut
sort
mkdir
rsync
smartctl
inxi
partclone.chkimg
gdisk
xfce4-terminal
pv
smbclient
cryptsetup
df" > "$pacotes"



# Não tem como verificar a instalação do pacote "cifs-utils" com comando which no Void Linux.



# ou no laço while?


#  Declarando um array chamado pacotes

# declare -a pacotes=("pacote1" "pacote2" "pacote3" "pacoteN"...)




# REFERÊNCIAS:

 
# TestDisk - Um utilitário que suporta recuperação de partições perdidas em ambos MBR e GPT.

# https://www.cgsecurity.org/index.html?testdisk.html


# gpart - Um utilitário que descobre o conteúdo de uma tabela de partições MBR destruída. Sua utilização está explicada no manual do gpart.

# https://github.com/baruch/gpart





# ==========================================================================================

# Inicio do loop while

while read -r pacote
do
  


     which "$pacote" 1> /dev/null 2> /dev/null

     if [ $? == "0" ] ; then

                echo "Programa $pacote localizado..." 
                
	else

clear
	
echo "
Programa $pacote não esta instalado." 

 
# Detecção de distribuição Linux
 
              
#---------------------------------------------------#
# Etapa 0 - Tente detectar a versão do sistema....  #
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
/bin/echo -e "\e[1;33m!   Detectando a versão do sistema            # \e[0m"
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
echo



if [[ "$version" = *"Void Linux"* ]];
then



# Quando o nome do pacote no repositorio oficial da distribuição Linux é diferente do nome que é usando junto do comando which.


if [ "$pacote" == "partclone.chkimg" ];
   then
   
      # Trocar o nome do pacote pelo nome que esta no repositorio oficial da distribuição Linux
      
      $pacote="partclone"
      
      
      echo "$pacote"
      
fi  




if [ "$pacote" == "gdisk" ];
   then
   
      # Trocar o nome do pacote pelo nome que esta no repositorio oficial da distribuição Linux
      
      
# Verifique se o pacote "gdisk" está instalado no seu sistema. 

# O comando gdisk no Linux é similar ao fdisk e permite manipular e criar partições. Ele foi especialmente criado para lidar com partições GPT.
# Este novo esquema de tabela de alocação de partições foi criado para funcionar com os novos firmwares das placas-mãe EFI e UEFI.


# No Void Linux:
#
# $ xbps-query -Rs  gptfdisk
# [-] gptfdisk-1.0.9_3 GPT fdisk text-mode partitioning tool

# xbps-install -Suvy gptfdisk  
    
      $pacote="gptfdisk"
      

      
      echo "$pacote"
      
fi 




   
	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


    echo ""
    echo -e "\e[01;44m \033[01;37m ╔═════════════════════════════════╗   \033[0m"
    echo -e "\e[01;44m \033[01;37m ║ Instalando aplicativos via xbps ║   \033[0m"
    echo -e "\e[01;44m \033[01;37m ╚═════════════════════════════════╝█  \033[0m"
    echo -e "\e[01;44m \033[01;37m  ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  \033[0m"
    echo ""
    
echo "
Instalando o $pacote...
"

xbps-install -Suy "$pacote"

sleep 10
clear


   elif [[ "$version" = *"Slackware"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Para selecionar um mirror

# nano /etc/slackpkg/mirrors


# Antes que o slackpkg possa ser usado, ele precisa ter uma lista atual de pacotes e suas versões e que pode ser baixada automaticamente 
# pela própria ferramenta assim que um mirror for selecionado. Para selecionar um mirror, apenas descomente um único URL no arquivo 
# /etc/slackpkg/mirrors. Observe que os links são classificados por versões de lançamento do Slackware, portanto, certifique-se de que o 
# link selecionado esteja na mesma versão em que você está interessado. É recomendado, embora não obrigatório, que você use o mirror 
# mirrors.slackware.com, já que aquele irá redirecioná-lo automaticamente para o espelho mais próximo geograficamente.

# Então, execute: 

# slackpkg update gpg


# Para atualizar a lista de pacotes

# slackpkg update


# Para pesquisar por pacotes nos repositórios.

slackpkg search "$pacote"

# slackpkg file-search "$pacote"


if [ $? -eq 0 ];
   then
   
echo "Pacote $pacote encontrado nos repositórios oficiais..."


echo "
Instalando o $pacote...
"

# Instala o pacote você precisar confirmar com "yes/no ,S/N"...

slackpkg install "$pacote"   
  

sleep 10
clear

else


echo -e "\e[00;31mPacote $pacote não encontrado nos repositórios oficiais... \e[00m"

# SlackBuilds: https://slackbuilds.org/


# Instalar pacotes com Sbopkg

which sbopkg  1> /dev/null 2> /dev/null || echo "Pacote Sbopkg não esta instalado." # exit


# Sua primeira tarefa é sincronizar com o repositório do SlackBuilds.org - Ou seja, você 
# permite que o sbopkg crie uma cópia local de todas as entradas do SlackBuild do 
# servidor remoto, para a versão do Slackware que você está executando. Você pode usar 
# o primeiro item de menu na tela principal baseada em curses, ou então você pode fazer 
# isso a partir da linha de comando:

sbopkg -r

sqg -p "$pacote"

sbopkg -ki "$pacote"



# REFERÊNCIAS:

# https://docs.slackware.com/pt-br:howtos:slackware_admin:building_packages_with_sbopkg


# http://www.dicas-l.com.br/arquivo/instalando_pacotes_binarios_no_slackware.php
# https://docs.slackware.com/pt-br:slackware:slackpkg


sleep 10
clear
      
fi  




   elif [[ "$version" = *"Fedora"* ]] || [[ "$version" = *"Mageia"* ]] || [[ "$version" = *"Scientific Linux"* ]] || [[ "$version" = *"CentOS"* ]] || [[ "$version" = *"Rocky Linux"* ]] || [[ "$version" = *"Oracle Linux"* ]];
   then

	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Verificar qual o gerenciador de pacote esta usando (yum ou dnf)

which yum

if [ $? -eq 0 ];
   then
 
# -------------------------------------------------------------------------------------------------
   
echo "
Gerenciador de pacote: yum
"

# Para pesquisar por pacotes nos repositórios.

# Podemos encontrar um pacote usando não apenas o nome exato, mas digitando uma palavra-chave, 
# de modo que a ferramenta faça as correspondências com os arquivos do sistema. 

# yum search "$pacote"


echo "
Instalando o $pacote...
"

yum install "$pacote"


sleep 10
clear

# REFERÊNCIAS:

# https://e-tinet.com/yum/
# https://plus.diolinux.com.br/t/centos-ubuntu-server-ou-debian-para-rodar-um-postgresql-e-um-apache-tomcat/60217
# https://diolinux.com.br/editorial/mudancas-no-centos.html
# https://wiki.mageia.org/en/Mageia_9_Notas_de_Lan%C3%A7amento_pt-BR#DNF:_o_gerenciador_de_pacotes_alternativo
# https://fastoslinux.wordpress.com/2019/07/02/mageia-o-primo-do-fedora/
# https://wiki.mageia.org/en/Mageia_9_Notas_de_Lan%C3%A7amento_pt-BR


# -------------------------------------------------------------------------------------------------


else

# -------------------------------------------------------------------------------------------------

echo "
Gerenciador de pacote: dnf
"

# O DNF foi bifurcado do YUM.


# Substituto do CentOS?

# Antigo CentOS (Red Hat) => CentOS Stream, Rocky Linux, AlmaLinux OS (fork do CentOS), Oracle Linux



# Rocky Linux (Criado pelo cofundador original do CentOS, Gregory Kurtzer)
#
#
# Tudo começou com um comentário de blog.
#
# Em 8 de dezembro de 2020, a Red Hat anunciou que iria descontinuar o desenvolvimento do CentOS, 
# que é uma versão downstream pronta para produção do Red Hat Enterprise Linux, em favor de uma nova 
# variante de desenvolvimento upstream desse sistema operacional conhecido como "CentOS Stream". Em 
# resposta, o fundador original do CentOS, Gregory Kurtzer, anunciou através um comentário no site do 
# CentOS que iniciaria novamente um projeto para atingir os objetivos originais do CentOS. Seu nome foi 
# escolhido como uma homenagem ao co-fundador do CentOS, Rocky McGaugh. Em 12 de dezembro, o repositório 
# de código do Rocky Linux havia se tornado o repositório de tendência no GitHub.



# REFERÊNCIAS:

# Site do projeto: https://rockylinux.org/download/
# https://github.com/rocky-linux
# https://forums.rockylinux.org/
# https://www.reddit.com/r/RockyLinux/
# https://pt.linux-console.net/?p=20623
# https://www.edivaldobrito.com.br/rocky-linux-um-substituto-do-centos-pronto-para-empresas/
# https://pt.linux-console.net/?p=20623
# https://sempreupdate.com.br/rocky-linux-9-tudo-o-que-voce-precisa-saber/
# https://sempreupdate.com.br/as-principais-distribuicoes-linux-alternativas-ao-centos-para-2023/



# Para pesquisar por pacotes nos repositórios.

# dnf search "$pacote"


echo "
Instalando o $pacote...
"

dnf install "$pacote" 


sleep 10
clear

# No Fedora os repositórios são sincronizados toda vez que o DNF é utilizado. Sempre ao executar 
# comandos para pesquisar, instalar ou remover pacotes, é como se o sistema executasse um "apt update"
# de forma automática, desta forma você sempre estará com os repositórios atualizados ao efetuar 
# qualquer transação.  
#
# Tal característica pode tornar o processo alguns segundos mais lento, dependendo da velocidade da 
# sua conexão, mas também o torna, de certa forma mais simples e eficaz. Assim, para atualizar o 
# sistema no Fedora precisamos utilizar apenas um comando, que é o seguinte:  
#
# dnf update

# -------------------------------------------------------------------------------------------------

      
fi



   elif [[ "$version" = *"Alpine Linux"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Habilitar Repositório (Remover #)

# nano /etc/apk/repositories

echo "
Atualizar apk...
"

apk update


# Para pesquisar por pacotes nos repositórios.

# apk search "$pacote"


echo "
Instalando o $pacote...
"

apk add "$pacote" 


sleep 10
clear

# REFERÊNCIAS:

# https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper
# https://homelaber.com.br/alpine-linux-uma-nova-distro-linux-ligth-que-vale-a-pena-conhecer/
# https://wiki.projetoroot.com.br/index.php/Alpine_Linux
# https://medium.com/@aquilaluizinho/como-instalar-o-docker-no-alpine-linux-8c7f51ac26c1


   elif [[ "$version" = *"Debian"* ]] || [[ "$version" = *"Ubuntu"* ]] || [[ "$version" = *"Devuan"* ]] || [[ "$version" = *"Deepin"* ]] || [[ "$version" = *"PureOS"* ]]  || [[ "$version" = *"Parrot OS"* ]] || [[ "$version" = *"elementary"* ]] || [[ "$version" = *"Zorin OS"* ]] || [[ "$version" = *"Pop!_OS"* ]] || [[ "$version" = *"Linux Mint"* ]] || [[ "$version" = *"Kali"* ]];
   then

# O "MX Linux" usa o "PRETTY_NAME" Debian no arquivo /etc/os-release.

	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


apt update

# Para pesquisar por pacotes nos repositórios.

# apt-get search $pacote


echo "
Instalando o $pacote...
"

apt install -y "$pacote"


sleep 10
clear

# REFERÊNCIAS:

# https://github.com/pop-os/pop/issues/2146
# https://itsfoss.com/check-linux-mint-version/



   elif [[ "$version" = *"Manjaro Linux"* ]] || [[ "$version" = *"SystemRescue 11.00"* ]] || [[ "$version" = *"Artix Linux"* ]]  || [[ "$version" = *"Arch Linux"* ]];
   then

echo "
SystemRescue 11.00 usa a base do Arch Linux.

Gerenciador de pacotes Pacman.
"


/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"



# Descobrindo o nome de um pacote
#
# Algumas vezes o nome do pacote não é tão óbvio. Por exemplo, o leitor de PDF chama-se okular, mas este não é o 
# nome do pacote. Para descobrirmos o nome exato (antes de seguir com a instalação) utilizamos o seguinte comando.
#
pacman -Ssy "$pacote" 2>> "$log"


# O terminal retornará o seguinte nome kdegraphics-okular Agora você pode instalá-lo seguindo o comando: pacman -Sy "$pacote"

if [ $? -eq 0 ];
   then
   
echo "Pacote $pacote encontrado nos repositórios oficiais..."

# Atenção: Ao instalar pacotes no Arch, evite atualizar a lista de pacotes sem atualizar o sistema 
# (por exemplo, quando um pacote não é encontrado nos repositórios oficiais). Na prática, não execute 
# o comando pacman -Sy nome_pacote, pois isso poderia levar para problemas de dependências. 

echo "
Instalando o $pacote...
"

# Instala o pacote sem precisar confirmar com "yes/no ,S/N"...

pacman -Sy "$pacote" --noconfirm
  

sleep 10
clear

else


echo -e "\e[00;31mPacote $pacote não encontrado nos repositórios oficiais... \e[00m"

       
fi  


# REFERÊNCIAS:
 
# https://empresadigital.net.br/como-instalar-e-remover-programas-no-arch-linux/
# https://wiki.archlinux.org/title/Pacman_(Portugu%C3%AAs)
# https://forum.biglinux.com.br/d/3005-comandos-b%C3%A1sicos-do-pacman--pamac-no-site-big-linux
# https://forum.biglinux.com.br/d/1160-dica-pacman-ou-pamac-no-terminal-do-biglinux
# https://bbs.archlinux.org/viewtopic.php?id=281731
# https://www.vivaolinux.com.br/topico/Xubuntu/para-que-serve-etcos-release-e-etclsb-release
# https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
# https://plus.diolinux.com.br/t/instalando-programas-facilmente-no-manjaro/4558?u=elppans
# https://github.com/pop-os/shell/issues/387




   elif [[ "$version" = *"openSUSE"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Gerenciando pacotes com Zypper

# Você pode instalar pacotes com o YaST, mas também pode gerenciar pacotes na linha de comando com o Zypper. 
#
# O openSUSE até usa o formato RPM deste último.


# Para atualizar seu sistema, use este comando:

# zypper update


echo "
Instalando o $pacote com o Zypper...
"

zypper install "$pacote"


sleep 10
clear

# REFERÊNCIAS:

# https://plus.diolinux.com.br/t/o-que-e-o-opensuse-tudo-o-que-voce-precisa-saber/41744
# https://www.vivaolinux.com.br/topico/Suse/Base-do-OpenSuse
# https://pt.opensuse.org/P%C3%A1gina_Principal
# https://pt.opensuse.org/Portal:Zypper
# https://diolinux.com.br/sistemas-operacionais/opensuse/opensuse-tumbleweed-e-leap.html
# https://sempreupdate.com.br/a-historia-do-opensuse-linux/
# https://pt.opensuse.org/Gerenciamento_de_pacotes




   elif [[ "$version" = *"Gentoo"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Gerenciando pacotes (Portage)


# Para atualizar seu sistema, use este comando:



echo "
Instalando o $pacote...
"

# O Portage é algo completamente diferente: ele puxa o código-fonte de um programa e o compila antes de instalar.

emerge --ask "$pacote"


sleep 10
clear

# REFERÊNCIAS:

# https://wiki.gentoo.org/wiki/Handbook:Parts/Installation/Base/pt-br
# https://wiki.gentoo.org/wiki/Handbook:Parts/Installation/Tools/pt-br
# https://www.edivaldobrito.com.br/instalar-programas-no-linux-via-terminal/



   elif [[ "$version" = *"Exherbo Linux"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Gerenciando pacotes (Paludis)



# Para atualizar seu sistema, use este comando:




echo "
Instalando o $pacote...
"


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/artigo/Exherbo-Linux-sacrificando-a-cabra
# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=15570



   elif [[ "$version" = *"Solus"* ]];
   then


	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"


# Gerenciando pacotes (Eopkg)



# Para atualizar seu sistema, use este comando:



echo "
Instalando o $pacote...
"

eopkg install "$pacote"


sleep 10
clear

# REFERÊNCIAS:

# https://www.edivaldobrito.com.br/instalar-programas-no-linux-via-terminal/


else


/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
/bin/echo -e "\e[1;31mSeu sistema não está executando o Void Linux.\e[0m"
/bin/echo -e "\e[1;31mO script foi testado apenas no Void Linux...\e[0m"
/bin/echo -e "\e[1;31mO script está saindo...\e[0m"
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"

echo

exit

fi

                
#		exit
		
     fi




done < "$pacotes"

# Fim do loop while


sleep 10
clear


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Shell-Script/Como-funciona-o-comando-WHILE-internamente-quando-utilizamos-o-READ
# https://gist.github.com/natefoo/814c5bf936922dad97ff



# ==========================================================================================


# Removendo o arquivo temporario

rm -Rf "$pacotes"



# ==========================================================================================

    echo -e "\e[00;31m 
Precauções:

    Como o risco de perda de dados não pode ser descartado, é importante antes de iniciar a operação.

    Fazer backup de dados de dispositivos afetados.

    Identificar corretamente os volumes ou partições a serem modificadas.
      
   \e[00m"
   
   
# ==========================================================================================


}







# ==========================================================================================

# Verificar Root

if ! [ $(id -u) = 0 ]; then echo "Por favor, execute este script como SUDO ou ROOT!" && yad --title="" --on-top --center --timeout=30 --text="Por favor, execute este script como SUDO ou ROOT!"  ; exit ; fi


# ==========================================================================================



echo -e "\n\e[1;34m
#----------------------------------------------------#
#   $descricao - $versao     #
#   Escrito por $autor - $data     #
#   $site  #
#----------------------------------------------------#
\e[0m"


echo -e "\n\e[1;31m
Certifique-se de realizar backup de seus dados antes de qualquer 
operação de clonagem e restauração de sistema.
\e[0m\n"

echo -e "\n\e[1;34mPor que usar esse script?

Para o caso de ocorrer um problema;
Um vírus raro pode atacar o sistema corrompendo alguns dados importantes; 
Sua empresa ou você pode ser alvo de Ransomware;
Pode falhar disco rígido (HD) / SSD muito em breve.

\e[0m"


# ==========================================================================================



    case "$1" in

        --clonar|-c)
        
clear

# Chamar a função verificar

verificar

 
        
          echo "Clonar HD"




# Exemplo de clonagem de HD:
          
# ls -hl
# total 8,1G
# -rwxr-xr-x 1 fernando fernando  21K out 29  2018 Info-dmi.txt
# -rwxr-xr-x 1 fernando fernando  19K out 29  2018 Info-lshw.txt
# -rwxr-xr-x 1 fernando fernando 2,2K out 29  2018 Info-lspci.txt
# -rwxr-xr-x 1 fernando fernando  170 out 29  2018 Info-packages.txt
# -rwxr-xr-x 1 fernando fernando   93 out 29  2018 Info-saved-by-cmd.txt
# -rwxr-xr-x 1 fernando fernando  460 out 29  2018 blkdev.list
# -rwxr-xr-x 1 fernando fernando 8,9K out 29  2018 clonezilla-img
# -rwxr-xr-x 1 fernando fernando    4 out 29  2018 disk
# -rwxr-xr-x 1 fernando fernando   20 out 29  2018 parts
# -rwxr-xr-x 1 fernando fernando   37 out 29  2018 sda-chs.sf
# -rwxr-xr-x 1 fernando fernando 1,0M out 29  2018 sda-hidden-data-after-mbr
# -rwxr-xr-x 1 fernando fernando  512 out 29  2018 sda-mbr
# -rwxr-xr-x 1 fernando fernando  504 out 29  2018 sda-pt.parted
# -rwxr-xr-x 1 fernando fernando  421 out 29  2018 sda-pt.parted.compact
# -rwxr-xr-x 1 fernando fernando  361 out 29  2018 sda-pt.sf
# -rwxr-xr-x 1 fernando fernando   33 out 29  2018 sda1.info
# -rwxr-xr-x 1 fernando fernando 253M out 29  2018 sda1.ntfs-ptcl-img.gz.aa
# -rwxr-xr-x 1 fernando fernando 2,0G out 29  2018 sda2.ntfs-ptcl-img.gz.aa
# -rwxr-xr-x 1 fernando fernando 2,0G out 29  2018 sda2.ntfs-ptcl-img.gz.ab
# -rwxr-xr-x 1 fernando fernando 2,0G out 29  2018 sda2.ntfs-ptcl-img.gz.ac
# -rwxr-xr-x 1 fernando fernando 1,8G out 29  2018 sda2.ntfs-ptcl-img.gz.ad
# -rwxr-xr-x 1 fernando fernando  29M out 29  2018 sda5.ntfs-ptcl-img.gz.aa
# -rwxr-xr-x 1 fernando fernando 193M out 29  2018 sda6.ext4-ptcl-img.gz.aa








# Para identifica os discos

echo "
Dispositivo localizados:
"


# fdisk -l | grep /dev/sd | awk '{print $1 " " $5 " " $7}' > /tmp/particao.log

# fdisk -l | grep /dev/sd  > /tmp/particao.log



# fdisk -l | grep Disco | awk '{print $2}'| sort  | cut -d: -f1 


fdisk -l | grep /dev/sd | grep Disk  | awk '{print $2}'| sort  | cut -d: -f1     2>> "$log"
# fdisk -l | grep /dev/sd | grep Disco | awk '{print $2}'| sort  | cut -d: -f1

# /dev/sdb
# /dev/sda

# Com o sort organizaremos a saída do comando em ordem crescente.

echo "
"

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT    2>> "$log"

# lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT > /tmp/particao.log


# Trocar TODAS ocorrências de uma palavra por outra palavra

# sed -i '1 s/KNAME/NOME/g'                   /tmp/particao.log
# sed -i '1 s/TYPE/TIPO/'                     /tmp/particao.log
# sed -i '1 s/FSTYPE/Sistema/'                /tmp/particao.log
# sed -i '1 s/SIZE/TAMANHO/g'                 /tmp/particao.log
# sed -i '1 s/LABEL/RÓTULO/g'                 /tmp/particao.log
# sed -i '1 s/MOUNTPOINT/PONTO DE MONTAGEM/g' /tmp/particao.log

# "s" substitui um trecho de texto por outro
# -i  altera o arquivo
# "g" no final (como se usa o d e p) altera todas as ocorrências
#  1  Você pode restringir o comando SED para substituir a string em uma linha específica.


# Deleta todas as linhas que contém a palavra "Disco" no arquivo
# sed -i '/Disco/d' /tmp/particao.log


# cat /tmp/particao.log

# /dev/sdb1 40,5G Linux
# /dev/sdb3 425,3G Estendida
# /dev/sdb5 2G Linux
# /dev/sdb6 356,4G HPFS/NTFS/exFAT


# REFERÊNCIAS:

# https://elias.praciano.com/2017/10/formate-automaticamente-a-saida-dos-seus-comandos-linux-em-tabelas/


# rm -Rf /tmp/particao.log



# REFERÊNCIAS:

# https://br.ccm.net/faq/8483-sed-excluir-uma-ou-mais-linhas-de-um-arquivo
# https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
# http://www.zago.eti.br/script/sed.html
# https://thobias.org/doc/sosed.html
# https://raullesteves.medium.com/tratamento-de-texto-pelo-terminal-cat-cut-grep-tr-uniq-short-paste-9f1d7286b3cc
# https://www.vivaolinux.com.br/topico/Comandos/Comando-Shell-Script-para-retirar-todos-os-numeros-de-um-arquivo-de-texto



echo "
Qual o dispositivo que será usado na clonar? Ex: /dev/sda"
read HD

clear

# Verificar se a variavel $HD é nula

[ -z "$HD" ] && { echo "O valor não pode ser nulo... Informe um HD/SSD para ser clonado." ; exit ; }


echo "
"
parted "$HD" unit MiB print   2>> "$log"


# REFERÊNCIAS:

# https://papy-tux.legtux.org/doc1274/index.html



echo '
Qual a partição do HD/SSD que gostaria de clonar? Ex: '$HD'1'
read ClonarParticao


clear

# Verificar se a variavel $ClonarParticao é nula

[ -z "$ClonarParticao" ] && { echo "O valor não pode ser nulo... Informe uma partição para ser clonada." ; exit ; }



# Certifique-se de que ambas as partições estejam desmontadas

# sudo umount $HD{1...9} 2> /dev/null


# Certifique-se de que a partição de destino esteja desmontada

clear

umount "$ClonarParticao"  1> /dev/null  2>> "$log"

# Tratamento de erros para o umount

[ $? -eq 0 ] && echo "Partição $ClonarParticao desmontada com sucesso..." ||   { echo -e "\e[00;31mFalha ao desmontar a partição $ClonarParticao \e[00m" ; }


# REFERÊNCIAS:

# https://mazer.dev/pt-br/linux/dicas/como-identificar-erro-no-script-shell-interromper/



# Para identificar o sistema de arquivo da partição

sistema_de_arquivo=$(lsblk -rno FSTYPE "$ClonarParticao" | head -n 1)



echo "
Onde gostaria que salvar a imagem da partição $ClonarParticao? Ex: /media/backup/clonezilla/Windows_8.1_Pro-$(date +%d-%m-%Y)-img/"
read local_da_imagem_da_particao


# Verificar se a variavel $local_da_imagem_da_particao é nula

[ -z "$local_da_imagem_da_particao" ] && { echo "O valor não pode ser nulo... Informe um local para salvar a imagem da partição." ; exit ; }



# Verifica se a pasta "$local_da_imagem_da_particao" existe e caso ela não exista cria.

if [ ! -d "${local_da_imagem_da_particao}" ]
then
     mkdir -p "${local_da_imagem_da_particao}"  2>> "$log"
fi

# https://plus.diolinux.com.br/t/script-de-pos-instalacao-sugestoes-e-correcoes/39003/10





clear

echo "
Gerando relatórios sobre esse hardware...
"
sleep 2


# Para imprimir colunas selecionadas de dispositivos de bloco.

lsblk -o KNAME,NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,MODEL > "$local_da_imagem_da_particao"/blkdev.list


# lsblk --ascii -n -o name,mountpoint


# REFERÊNCIAS:

# https://acervolima.com/comando-lsblk-no-linux-com-exemplos/
# https://elias.praciano.com/2022/05/obtenha-informacoes-dos-seus-sistemas-de-arquivos-com-o-lsblk/
# https://forums.linuxmint.com/viewtopic.php?t=337961



# Verificar se o hardware é idêntico na hora de volta a imagem para o HD/SSD.

dmidecode > "$local_da_imagem_da_particao"/Info-dmi.txt
lshw      > "$local_da_imagem_da_particao"/Info-lshw.txt

lspci     > "$local_da_imagem_da_particao"/Info-lspci.txt
lspci -n >> "$local_da_imagem_da_particao"/Info-lspci.txt


parted -ls > "$local_da_imagem_da_particao"/sda-pt.parted

# parted -ls > "$local_da_imagem_da_particao"/sda-pt.parted.compact


# OPÇÕEs:

#   -l, --list                      lista modelos de partições em todos os dispositivos de bloco
#   -s, --script                    nunca pede intervenção do usuário



# lscpu
# inxi -C
# hwinfo --cpu

echo "
Processador: `cat /proc/cpuinfo | grep -i "model name" | cut -d: -f2 | head -n 1`

Memória RAM:

`free -m`

`dmidecode --type 17`


Placa-mãe:

`dmidecode --type 1`

" > "$local_da_imagem_da_particao"/dados.txt


# REFERÊNCIAS:

# https://sempreupdate.com.br/maneiras-de-exibir-detalhes-do-processador-no-terminal-linux/
# https://www.vivaolinux.com.br/dica/Como-verificar-o-TIPO-e-o-TAMANHO-da-memoria-RAM-no-Linux-com-bonus



inxi -v7azy > "$local_da_imagem_da_particao"/inxi.txt


echo "
" >> "$local_da_imagem_da_particao"/inxi.txt

inxi -Fxz >> "$local_da_imagem_da_particao"/inxi.txt


echo "
" >> "$local_da_imagem_da_particao"/inxi.txt

inxi --admin --filter --cpu --machine >> "$local_da_imagem_da_particao"/inxi.txt


# REFERÊNCIAS:

# https://forum.manjaro.org/t/very-unstable-system/126455/25
# https://sempreupdate.com.br/como-clonar-disco-usando-o-linux/
# https://forums.opensuse.org/t/virtualbox-kernel-driver-no-loading-secureboot-enabled-how-to-sign-modules/146160/19



echo "Módulos carregados:
`lsmod`
" > "$local_da_imagem_da_particao"/modulos_carregados.txt



echo "
Para sistema/hardware que reiniciar aleatoriamente com bastante frequência.

Você precisa examinar os logs dos segundos antes da reinicialização, não depois. 

Os logs do dmesg têm  data e hora: [0.000000] ocorre na reinicialização, então 
mostrar informações antes da reinicialização, é útil.

Tente olhar o final de um dmesg anterior: /var/log/dmesg.log.0. Veja também /var/log/syslog. 



Os motivos mais comuns para reinicializações inesperadas e não registradas são hardware: 
Superaquecimento ou morte de fontes de alimentação.


Interpretando a leitura de logs de erros do dmesg:
" > "$local_da_imagem_da_particao"/dmesg.txt

dmesg | grep -i "error\|warn\|fail" >> "$local_da_imagem_da_particao"/dmesg.txt

# dmesg | grep failed

# dmesg | egrep -i 'virtualbox|vbox'




# Para verificar o espaço em uso e a quantidade disponível do disco. 

echo "
Exibe informações sobre espaço, livre e ocupado, das partições do sistema.

" > "$local_da_imagem_da_particao"/discos_montados.txt

df -h -T >> "$local_da_imagem_da_particao"/discos_montados.txt




# REFERÊNCIAS:

# https://forums.linuxmint.com/viewtopic.php?t=227444
# https://forums.linuxmint.com/viewtopic.php?t=169388
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=1566
# https://guialinux.uniriotec.br/df/



# Vai ajuda na hora de volta a imagem para o HD/SSD (para identifica se a tabela é MBR ou GPT)

# fdisk -l  "$HD" | grep "Tipo de rótulo do disco:" | cut -d: -f2 
# dos

fdisk -l "$HD" > "$local_da_imagem_da_particao"/fdisk.txt



# fdisk -l  /dev/sdc
# Disco /dev/sdc: 7,45 GiB, 8004304896 bytes, 15633408 setores
# Modelo de disco: Cruzer Blade    
# Unidades: setor de 1 * 512 = 512 bytes
# Tamanho de setor (lógico/físico): 512 bytes / 512 bytes
# Tamanho E/S (mínimo/ótimo): 512 bytes / 512 bytes
# Tipo de rótulo do disco: dos
# Identificador do disco: 0xd3526add
# 
# Dispositivo Inicializar Início      Fim  Setores Tamanho Id Tipo
# /dev/sdc1                 2048 15632383 15630336    7,5G  7 HPFS/NTFS/exFAT


# REFERÊNCIAS:

# https://www.dedoimedo.com/computers/partition-table-backup-restore.html



lsblk > "$local_da_imagem_da_particao"/lsblk.txt



sleep 2
clear

echo "
=== INFORMAÇÕES ===

Partição que será clonada => $ClonarParticao

Sistema de arquivo da partição $ClonarParticao => $sistema_de_arquivo
Local onde será salvo a imagem da partição $ClonarParticao => $local_da_imagem_da_particao


Dispositivo de origem

Fabricante:           $(smartctl -i $ClonarParticao | grep -i "Model Family:"     | cut -d: -f2 | sed  "s/^[[:space:]]\+//g" | sed  "s/[[:space:]]$\+//g")
Modelo:               $(smartctl -i $ClonarParticao | grep -i "Device Model:"     | cut -d: -f2 | sed  "s/[[:space:]]\+//g")
Número de série:      $(smartctl -i $ClonarParticao | grep -i "Serial Number:"    | cut -d: -f2 | sed  "s/[[:space:]]\+//g")
Versão do firmware:   $(smartctl -i $ClonarParticao | grep -i "Firmware Version:" | cut -d: -f2 | sed  "s/[[:space:]]\+//g")
Capacidade:           $(smartctl -i $ClonarParticao | grep -i "User Capacity:"    | cut -d: -f2 | sed  "s/[[:space:]]\+//g" | cut -d[ -f2 | sed 's/]//')
Taxa de rotação:      $(smartctl -i $ClonarParticao | grep -i "Rotation Rate:"    | cut -d: -f2 | sed  "s/[[:space:]]\+//g")
O suporte SMART está: $(smartctl -i $ClonarParticao | grep -i "SMART support is:" | sed -n '2p' | cut -d: -f2 | sed  "s/[[:space:]]\+//g")

" | tee "$local_da_imagem_da_particao"/SMART.log


# REFERÊNCIAS:

# https://www.hostgator.com.br/blog/como-usar-o-comando-tee-do-linux/









# Opção para ser usada no VirtualBox:

teste=$(smartctl -i  "$ClonarParticao" | grep -i "Device Model:" | cut -d":" -f2 | sed  "s/^[[:space:]]\+//g" | sed  "s/[[:space:]]$\+//g")


if [ "$teste" == "VBOX HARDDISK" ];
   then

teste="PASSED" 


else


# É maquina fisica

echo "
Saúde do HD/SSD
"
# smartctl -H  $ClonarParticao

teste=$(smartctl -H  "$ClonarParticao" | cut -d: -f2 | sed  "s/[[:space:]]\+//g" | sed -n '5p')

 
fi
   


# PASSED

if [ "$teste" == "PASSED" ];
   then
   
    echo "O dispositivo $ClonarParticao esta bom."

sleep 5


# === START OF READ SMART DATA SECTION ===
# SMART overall-health self-assessment test result: PASSED




# Como saber se HD está em GPT ou MBR no Linux?


# sudo parted -ls /dev/sda  | grep "Tabela de partições:" | cut -d: -f2 | sed  "s/[[:space:]]\+//g"
#
# Atenção: Não foi possível abrir /dev/sr0 para leitura e escrita (Sistema de arquivos somente para leitura). /dev/sr0 foi aberto somente-leitura.
# Atenção: O descritor da controladora (driver) informa que o tamanho físico de bloco é 512 bytes, mas o Linux informa que é 2048 bytes.
# msdos
# msdos
# unknown


# Tipo de tabela de partição

# Valores "dos" para MBR e valor "gpt" para gpt

# formato_da_tabela_de_particoes=$(fdisk -l  $HD | grep "Tipo de rótulo do disco:"  | cut -d: -f2 | sed  "s/[[:space:]]\+//g")
# dos







# Identificar se esta usando MBR ou GPT no HD/SSD


# Há dois principais tipos de tabelas de partição disponíveis: 

# Master Boot Record (MBR)
# Tabela de Partição GUID (GPT) 


# Valores: "msdos" para MBR e "gpt" para gpt

formato_da_tabela_de_particoes=$(parted -s $HD -- print | grep -E '^Partition Table: (gpt|msdos)$' | head -n 1 | sed 's,^Partition Table: \([a-z]\+\)$,\1,' | grep -E '^[a-z]+$')
# formato_da_tabela_de_particoes=$(parted -s $HD -- print | grep -E '^Tabela de partições: (gpt|msdos)$' | head -n 1 | sed 's,^Tabela de partições: \([a-z]\+\)$,\1,' | grep -E '^[a-z]+$')


if [ "$formato_da_tabela_de_particoes" == "msdos" ];
   then
   echo "
   msdos
   "

sleep 1
clear
   
echo "
Fazendo backup do MBR...
"

sleep 5
clear

# Tanto o gerenciador de boot quanto a tabela de particionamento do HD são salvos no primeiro setor do HD, a famosa trilha MBR, que contém apenas 512 bytes. Destes, 
# 446 bytes são reservados para o setor de boot, enquanto os outros 66 bytes guardam a tabela de partição.

# Ao trocar de sistema operacional, você geralmente subscreve a MBR com um novo gerenciador de boot, mas a tabela de particionamento só é modificada ao criar ou deletar 
# partições. Se por acaso os 66 bytes da tabela de particionamento forem subscritos ou danificados, você perde acesso a todas as partições do HD. O HD fica parecendo vazio, 
# como se tivesse sido completamente apagado. Para evitar isso, você pode fazer um backup da trilha MBR do HD. Assim você vai poder recuperar tudo caso ocorra qualquer 
# eventualidade. Para isso, use o comando:


# Para fazer o backup do MBR, basta copiar para um arquivo os primeiros 512 bytes do disco:

dd if="$HD" of="$local_da_imagem_da_particao"/sda-mbr  bs=512 count=1  2>> "$log"


# Este comando faz uma cópia do setor de boot do HD, aqueles primeiros 512 bytes de extrema importância onde fica instalado o gerenciador de boot.


# dd if=/dev/sda of=/home/partimag/Windows_Pro_8.1-29-10-2018-img/sda-hidden-data-after-mbr skip=1 bs=512 count=2047


# REFERÊNCIAS:

# https://www.hardware.com.br/dicas/fazendo-backup-recuperando-mbr-tabela-particoes.html
# https://antoniomedeiros.dev/blog/2012/04/21/problemas-envolvendo-bootloaders-mbr-e-tabela-de-particoes/
# https://wiki.archlinux.org/title/Partitioning_(Portugu%C3%AAs)
# https://wiki.archlinux.org/title/Dd_(Portugu%C3%AAs)



# Deletou a TABELA de partição acidentalmente com GPARTED? 


# Para recuperar os arquivos use TestDisk ou Minitool Power Data Recovery, tem a função do Gparted para resgatar dados.


# Como a tabela de partições ocupa os últimos 66 bytes da MBR, podemos preservar esta informação, variando a sintaxe do comando dd:

# dd if=mbr-backup of=/dev/sda bs=446 count=1

# dd if=/dev/sda of=tabela.mbr bs=66 skip=446 count=1


echo "
Fazendo backup da tabela de partições...

Sempre tenha backup dos dados num hd externo.
"

sleep 5
clear

nome_da_tabela_de_particao=$(echo "$HD" | cut -d/ -f3)

sfdisk -d "$HD" > "$local_da_imagem_da_particao"/"$nome_da_tabela_de_particao".sf  2>> "$log"


# Este segundo faz uma cópia da tabela de partição do HD. Se você restaurar estes dois arquivos num HD limpo, 
# ele ficará particionado exatamente da mesma forma que o primeiro. Se depois disto você restaurar também as 
# imagens das partições, ficará com uma cópia idêntica de todo o conteúdo do HD. O HD destino não precisa 
# necessariamente ser do mesmo tamanho que o primeiro, ele pode ser maior (neste caso o excedente ficará 
# vago e você poderá criar novas partições depois). Ele só não pode ser menor que o original, caso contrário 
# você vai ficar com um particionamento inválido e dados faltando ou seja, uma receita para o desastre.


# REFERÊNCIAS:

# https://www.hardware.com.br/tutoriais/usando-partimage/
# https://www.certificacaolinux.com.br/backup-do-mbr-com-o-comando-dd/
# https://www.clubedohardware.com.br/forums/topic/594026-dicas-para-tentar-recuperar-arquivos-perdidos-poste-aqui-uma-solu%C3%A7%C3%A3ofuncional/
# https://cleuber.com.br/index.php/2014/04/26/tabelas-de-particao-do-hd-mbr-ou-gpt-qual-a-diferenca
# https://www.vivaolinux.com.br/topico/Hard-on-Linux/Deletou-a-TABELA-de-particao-acidentalmente-com-GPARTED



   
   elif [ "$formato_da_tabela_de_particoes" == "gpt" ];
   then
   
   echo "
   Backup das partições GPT 
   
   
   No Void Linux instala o pacote gptfdisk para usar o comando gdisk. 


   
Identifique o dispositivo que contém as partições GPT que você deseja fazer o backup. Você pode usar 
o comando 'lsblk' para listar os dispositivos e suas respectivas partições.


Anote o dispositivo que contém as partições GPT.

   " 
   
lsblk
   
sleep 10
clear

   
# Execute o seguinte comando para criar o backup das partições GPT e da tabela de partição:

sgdisk --backup="$local_da_imagem_da_particao"/gpt.backup  "$HD"  2>> "$log"


# O que temos aqui? 
#
# O sinalizador --backup especifica que queremos fazer backup da tabela de partição.
# Você precisará fornecer um caminho para o backup.
#
# O campo "$HD" especifica o dispositivo real do qual você deseja fazer backup. Tenha muito cuidado ao 
# fazer isso. Verifique três vezes seus comandos. Requer Root ou sudo.



# Substitua "$local_da_imagem_da_particao/gpt.backup" pelo caminho e nome de arquivo desejado para o backup e "$HD" pelo dispositivo identificado no passo 2.

# Verifique se o backup foi criado corretamente. Você pode usar o comando "ls" para verificar.




# REFERÊNCIAS:

# https://askubuntu.com/questions/386752/fixing-corrupt-backup-gpt-table
# https://www.cyberciti.biz/faq/linux-backup-restore-a-partition-table-with-sfdisk-command/
# https://wiki.archlinux.org/title/GPT_fdisk
# https://sites.google.com/site/inforlae/erro-clonezilla-gpt-e-mbr
# https://www.vivaolinux.com.br/dica/This-disk-contains-mismatched-GPT-and-MBR-partition-devsda-RESOLVIDO
# http://www.zago.eti.br/hdclone.txt
# https://www.dedoimedo.com/computers/gpt-disk-backup-partition-table.html


   
  else
  
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo $ClonarParticao possui um formato $formato_da_tabela_de_particoes  não suportado pelo Partclone.
   \e[00m"

sleep 10
clear

exit 


fi


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/gpt-ou-mbr-1
# https://pt.linux-console.net/?p=18117
# https://www.hardware.com.br/comunidade/uefi-ubuntu/1479251/










# Formatos suportados dos sistema de arquivo:

# btrfs
# ext2
# ext3
# ext4
# hfs+
# extfs
# exfat
# f2fs
# nilfs2
# fat
# fat12
# fat16
# fat32
# vfat
# ntfs
# hfsplus 
# hfsp



if [ "$sistema_de_arquivo" == "btrfs" ];
   then
   echo "btrfs"

   elif [ "$sistema_de_arquivo" == "ext2" ];
   then
   echo "ext2"

   elif [ "$sistema_de_arquivo" == "ext3" ];
   then
   echo "ext3"
   
   elif [ "$sistema_de_arquivo" == "ext4" ];
   then
   echo "ext4"


# Clonar uma partição para uma imagem

  
# partclone.ext4 -d -c -s /dev/sda1 -o sda1.img

# partclone.ext4 -c -s /dev/sda1 -o ~/image_sda1.pcl


# partclone.ext4 -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda6 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda6.ext4-ptcl-img.gz. 2> /tmp/split_error.myDx3Z

   
# partclone.ext4 -c -s /dev/sda1 | gzip -c > ~/image_sda1.pcl.gz

# Note: For maximum compression use gzip -c9


# REFERÊNCIAS:

# https://forum.manjaro.org/t/partclone-how-to-use-compression/53767



# Crie o arquivo de imagem:

# sudo partclone.ext4 -c -d -s $ClonarParticao -o clone.img


# Com opções:

# -c para selecionar a clonagem de partição para imagem
#  d, -s, -o para selecionar respectivamente a depuração, -s a origem, -o o destino

#  O arquivo de imagem é menor que o sistema de arquivos da partição original (305 MiB versus 976 MiB) e um pouco maior que a parte usada da partição (296 MiB versus 257 MiB)

# ls -lh clone.img 
# -rw------- 1 root root 305M 1º de junho 09:48 clone.img 

# sudo df -BM /dev/sdb1 
# Sys. de 1 milhão de arquivos de bloco usados, uso disponível% montado em 
# /dev/sdb1 976M 257M 653M 29% /mnt



   elif [ "$sistema_de_arquivo" == "hfs+" ];
   then
   echo "hfs+"
   
   elif [ "$sistema_de_arquivo" == "extfs" ];
   then
   echo "extfs"

   elif [ "$sistema_de_arquivo" == "exfat" ];
   then
   echo "exfat"
   
   elif [ "$sistema_de_arquivo" == "f2fs" ];
   then
   echo "f2fs"
   
   elif [ "$sistema_de_arquivo" == "nilfs2" ];
   then
   echo "nilfs2"            


   elif [ "$sistema_de_arquivo" == "fat" ];
   then
   echo "fat"

   elif [ "$sistema_de_arquivo" == "fat12" ];
   then
   echo "fat12"
   
   elif [ "$sistema_de_arquivo" == "fat16" ];
   then
   echo "fat16"
   
   elif [ "$sistema_de_arquivo" == "fat32" ];
   then
   echo "fat32"
   
   elif [ "$sistema_de_arquivo" == "vfat" ];
   then
   echo "vfat"

   elif [ "$sistema_de_arquivo" == "ntfs" ];
   then
   echo "ntfs"
   
# Clonar uma partição para uma imagem
   
   partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s "$ClonarParticao" --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - "$local_da_imagem_da_particao"/$(echo "$ClonarParticao" | cut -d/ -f3).ntfs-ptcl-img.gz. 2>> "$log"
   

# Obs: O Partclone adiciona o .000 por padrão, se a imagem for maior ficará .001, 002. 



# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda1 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda1.ntfs-ptcl-img.gz. 2> /tmp/split_error.ZHntnZ
# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda2 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda2.ntfs-ptcl-img.gz. 2> /tmp/split_error.KZnreP
# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda5 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda5.ntfs-ptcl-img.gz. 2> /tmp/split_error.1WuQgs



# partclone.ntfs -d -c -s /dev/sda2 -o sda2.img

 
    
   elif [ "$sistema_de_arquivo" == "hfsplus" ];
   then
   echo "hfsplus"
   
   elif [ "$sistema_de_arquivo" == "hfsp" ];
   then
   echo "hfsp"   
   
   
      
  else
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo $ClonarParticao possui um formato de sistema de arquivo não suportado pelo Partclone.
   \e[00m"

sleep 10

exit 

fi



# ==========================================================================================


# Para o caso de quer clonar outra partição do HD/SSD

clear

echo -n "Deseja clonar outra partição? [s/n]"
read reps

if [ "$reps" == "s" ];
then


# Loop para gerar varias imagens de partições do HD/SSD

    while [ "$reps" != "n" ];
    do

clear

echo "
"
parted "$HD" unit MiB print


# REFERÊNCIAS:

# https://papy-tux.legtux.org/doc1274/index.html

  
echo '
Qual a partição do HD/SSD que gostaria de clonar? Ex: '$HD'2'
read ClonarParticao


clear

# Verificar se a variavel $ClonarParticao é nula

[ -z "$ClonarParticao" ] && { echo "O valor não pode ser nulo... Informe uma partição para ser clonada." ;  break ; }



umount "$ClonarParticao"  1> /dev/null  2>> "$log"

# Tratamento de erros para o umount

[ $? -eq 0 ] && echo "Partição $ClonarParticao desmontada com sucesso..." ||   { echo -e "\e[00;31mFalha ao desmontar a partição $ClonarParticao \e[00m" ; }




# Clonar uma partição para uma imagem
   
   partclone."$sistema_de_arquivo" -z 10485760 -N  -L /var/log/partclone.log -c -s "$ClonarParticao" --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - "$local_da_imagem_da_particao"/$(echo "$ClonarParticao" | cut -d/ -f3)."$sistema_de_arquivo"-ptcl-img.gz. 2>> "$log"
 

# Obs: O Partclone adiciona o .000 por padrão, se a imagem for maior ficará .001, .002, .003, ...


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=17   

   
sleep 1
clear

echo -n "Deseja clonar outra partição? [s/n]"
read reps
        
        if [ "$reps" == "n" ];
        then
            echo "Continuando..."
            break
        fi
        
    done
    
# Fim do loop

    
fi


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Shell-Script/Problemas-para-sair-do-loop-While



# ==========================================================================================







echo "
Todos os dispositivos reconhecido pelo sistema que possui o sistema de arquivo $sistema_de_arquivo
" >> "$log"

blkid -t TYPE="$sistema_de_arquivo" -s TYPE -s UUID -s PARTUUID >> "$log"
# /dev/sdb6: UUID="1B11A4B347B6EDF1" TYPE="ntfs" PARTUUID="8fc1ffee-06"
# /dev/sda2: UUID="984C07B54C078D66" TYPE="ntfs" PARTUUID="b2ceef40-02"
# /dev/sda1: UUID="584804274804068A" TYPE="ntfs" PARTUUID="b2ceef40-01"


# REFERÊNCIAS:

# https://forum.manjaro.org/t/manjaro-wont-boot-after-update-cant-switch-tty/145462/44






# Execute uma verificação em uma imagem criada

# partclone.chkimg -s sda2.img


# Obter informações de uma imagem
	
# partclone.info -s sda2.img



# Uso do Partclone:
#
# -c , --clone =>  Salve a partição no formato de imagem especial.
#
# -s  ARQUIVO  =>  Arquivo fonte. O ARQUIVO pode ser um arquivo de imagem (feito por partclone) ou dispositivo dependendo de sua ação. Normalmente, a 
#                  fonte de backup é o dispositivo, a fonte de restauração é o arquivo de imagem.
#
# -o  ARQUIVO  =>  Arquivo de saída. O ARQUIVO pode ser um arquivo de imagem (o partclone irá gerar) ou depende do dispositivo em sua ação. Normalmente, 
#                  faça backup da saída para um arquivo de imagem e restaure a saída para o dispositivo.
#
# -d nível     =>  Defina o nível de depuração [1|2|3]


  
  
   

echo  "
Copiando o arquivo de log gerado para a pasta $local_da_imagem_da_particao
"

# cp /var/log/partclone.log $local_da_imagem_da_particao/   2>> "$log"
 
         
rsync -av /var/log/partclone.log "$local_da_imagem_da_particao"/   2>> "$log"



# REFERÊNCIAS:

# https://sobrelinux.info/questions/163716/whats-the-difference-between-cp-and-rsync



# Copia o arquivo de log para a pasta "$local_da_imagem_da_particao"

rsync -av "$log"  "$local_da_imagem_da_particao"



# REFERÊNCIAS:
 
# https://www.hardware.com.br/comunidade/tr-substituir/869489/
# https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
# https://www.vivaolinux.com.br/topico/Comandos/Print-de-palavras-especificas-de-uma-linha
# https://www.devmedia.com.br/introducao-ao-shell-script-no-linux/25778
# https://www.truenas.com/community/threads/smart-self-assessment-test-result-failed-but-tests-are-passing.95890/
# https://www.linuxquestions.org/questions/linux-newbie-8/smartctl-read-failure%3B-is-my-hd-failing-920243/
# https://www.vivaolinux.com.br/dica/Adicionando-cor-ao-comando-echo
# https://papy-tux.legtux.org/doc1274/index.html



# blk_label() { lsblk -rno LABEL "$1" | head -n 1 ; }
# blk_uuid() { lsblk -rno UUID "$1" | head -n 1 ; }
# blk_uuids() { lsblk -rno UUID "$1" ; }
# blk_type() { lsblk -rno TYPE "$1" | head -n 1 ; }

# blk_logsectors() { lsblk -rno LOG-SEC "$1" | head -n 1 ; }
# ls_part_of_disk() { lsblk -rno KNAME,TYPE "$1" | grep 'part$' | grep -E -o '^\S+' | sed 's,^,/dev/,g' ; }




  else

   # Se o HD ou SSD estiver com problema cai aqui.
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo $ClonarParticao  esta com problema e não pode ser gerado uma imagem dele.
   
   É aconselhado fazer um backup dos seus dados e substituir o disco.
   \e[00m"
   
   
# === START OF READ SMART DATA SECTION ===
# SMART overall-health self-assessment test result: FAILED!
# Drive failure expected in less than 24 hours. SAVE ALL DATA.
# No failed Attributes found.

sleep 10

exit 
clear


fi

  
          
            ;;
            
            
        --restaurar|-r)
 
clear
        
          echo "
          Restaurar uma imagem para o HD/SSD
          "

sleep 2
clear
          
# Para fazer a restauração da imagem da tabela de partição e MBR ou GPT



# Quantas imagens de HD podemos restaurar por diaria de trabalho?

# 1 imagem leva 20 minutos para restaurar (teoria)
# 8 horas (diaria de trabalho)
# Considerando que 60 minutos é equivalente a 1 hora

# 60/20=3 imagens em 1 hora => 3*8 = 24 imagens  restaurada de HD por diaria de trabalho.


# REFERÊNCIAS:

# https://brasilescola.uol.com.br/matematica/como-transformar-minutos-em-horas.htm



# Script testado em máquina virtual criada pelo programa VirtualBox na versão 7.0.12 r159484:
#
# ISO => Windows 10 Pro - versão 10.0 (Compilação 10240) - realizada uma instalação somente do sistema sem instalação de drivers ou programas básicos.




# Para descobrir qual versão do Windows seu dispositivo está executando, pressione a tecla 
# do logotipo do Windows + R, digite winver no campo Abrir e selecione OK.


# REFERÊNCIAS:

# https://support.microsoft.com/pt-br/windows/qual-vers%C3%A3o-do-sistema-operacional-microsoft-windows-estou-usando-628bec99-476a-2c13-5296-9dd081cdd808


# https://martins2010.wordpress.com/category/informatica/linux-informatica/
# https://franklyn-sanc.medium.com/introdu%C3%A7%C3%A3o-ao-shell-script-automatizando-tarefas-c891075d2c00
# https://forums.gentoo.org/viewtopic-t-543350-start-0.html




# Chamar a função verificar

verificar


# ----------------------------------------------------------------------------------------

# Idioma do sistema

# locale -a


if [ "$LANG" == "pt_BR.UTF-8" ]; then

echo "
Idioma do sistema: $LANG
"

echo "
Dispositivos localizados:
"
dispositivos_localizados=$(fdisk -l | grep /dev/sd | grep Disco | awk '{print $2}' | sort  | cut -d: -f1)

# fdisk -l | grep Disco | awk '{print $2}'| sort  | cut -d: -f1 
# /dev/sda
# /dev/sdb


elif [ "$LANG" == "en_US.UTF-8" ];then

echo "
System language: $LANG
"
  
echo "
Devices located:
"  

dispositivos_localizados=$(fdisk -l | grep /dev/sd | grep Disk  | awk '{print $2}' | sort  | cut -d: -f1)
   
# fdisk -l | grep Disk | awk '{print $2}'| sort  | cut -d: -f1 

   
else

clear

echo "
Sem suporte ao idioma: $LANG
" | tee  "$log"

sleep 5
clear

exit

fi



# ----------------------------------------------------------------------------------------


# Problema com acentos?  Resolve o problema na sessão até novo desligamento.

# Configurar o layout do teclado para BR

# setxkbmap br


# REFERÊNCIAS:

# https://ubuntuforum-br.org/index.php?topic=119923.0

# ----------------------------------------------------------------------------------------



# Para identifica os discos:

echo "$dispositivos_localizados"

 
echo "
"

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT



echo "
Qual o dispositivo que será usado na restauração da imagem? Ex: /dev/sda"
read HD


clear

# Verificar se a variavel $HD é nula

[ -z "$HD" ] && { echo "O valor não pode ser nulo... Informe um HD/SSD." ; exit ; }


clear

echo "
Tem certeza de quer APAGAR DEFINITIVAMENTE todos os DADOS do $HD [s|S|y|Y|n|N]..."
read resp


# Verificar se a variavel $HD é nula

[ -z "$resp" ] && { echo "O valor não pode ser nulo..." ; exit ; }


case "$resp" in
    s|S|"")
        echo ""
    ;;
    y|Y)
        echo ""
    ;;
    n|N)
        clear
        echo "Saindo..."
        exit
    ;;
    *)
        clear
        echo "Opção inválida: $resposta"
        exit
    ;;
esac




# ----------------------------------------------------------------------------------------

# Definir a pasta onde os arquivos estão localizados

clear

# Menu para as opções:


# Inicio do loop

while true; do

clear
echo '================================================

Onde se encontra a imagem que deseja restaurar para '$HD'? 

Ex: /media/backup/clonezilla/Windows_10_Pro-'`date +%d-%m-%Y`'-img



1) Pasta local

2) Dispositivo de armazenamento (USB, HD ou SSD)

3) Compartilhamento SAMBA (com ou sem senha)  - rede

4) Compartilhamento NFS (Network File System) - rede

5) Sair do programa

================================================'

read -p "Digite a opção desejada: " x
echo "Opção informada ($x)
================================================"

clear

case "$x" in


1) # Pasta local

read -p "Informe o caminho completo da pasta onde esta a imagem: " local_da_imagem_da_particao


# Verificar se a variavel $local_da_imagem_da_particao é nula

[ -z "$local_da_imagem_da_particao" ] && { echo "O valor não pode ser nulo... Informe a pasta onde estão os arquivos de imagem do sistema." ; exit ; }


echo "
Local: $local_da_imagem_da_particao
"

break

sleep 5s
echo "================================================"
;;


2) # Dispositivo de armazenamento (USB, HD ou SSD)

echo "
Dispositivos de armazenamento reconhecidos pelo sistema:
"

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT | grep sd

read -p "
Informe o dispositivo para montar.
Ex: sdc1 " dispositivo

umount /dev/"$dispositivo" 2>> "$log"



# Adiciona uma opção para verificar a saúde do HD

# Para verificar rapidamente o S.M.A.R.T. status de integridade do dispositivos. Você precisa do 
# smartctl instalado em seu sistema para que esta parte do script funcione, e seus discos rígidos 
# precisam ter S.M.A.R.T. ativado.


# Para ativar o suporte SMART => # smartctl --smart=on /dev/device

smartctl --info /dev/"$dispositivo" | grep 'SMART support is:'



# Em maquina virtual (VirtualBox) o comando smartctl -H /dev/"$dispositivo" não funciona.

saude_do_HD=$(smartctl -H /dev/"$dispositivo" | grep : | cut -d: -f2 | sed 's/ //g')


if [[ "$saude_do_HD" == "PASSED" ]]; then

echo "
HD OK
"

sleep 2
clear

else

clear

echo "
HD /dev/"$dispositivo" com problema.
" | tee "$log"

sleep 10
clear

# exit 
 
fi


# REFERÊNCIAS:

# https://wiki.archlinux.org/title/S.M.A.R.T.




# Busca no diretorio /dev os dispositivos (pode será falso positivo)

echo "
Para verificar todas as unidades sata e nvme

Fornece informações para saber se alguma das unidades está com dificuldades e precisa ser substituída. 

A primeira etapa é coletar os dados

Aqui está um exemplo de resultado disso:

" > "$local_da_imagem_da_particao"/smartcheck.txt


 for drive in /dev/sd[a-z] /dev/sd[a-z][a-z] /dev/nvme[0-9]n[0-9]
do
  if [[ ! -e $drive ]]; then continue ; fi

  echo -n "$drive "            >> "$local_da_imagem_da_particao"/smartcheck.txt
  echo -e "\n"                 >> "$local_da_imagem_da_particao"/smartcheck.txt

  smart=$(
    smartctl -i $drive  | grep Serial  
    smartctl -A $drive  | grep -E "^  "9"" | awk -F" " '{ print $2,$10 }'
    smartctl -A $drive  | grep -E "^  "5"" | awk -F" " '{ print $2,$10 }'  
    smartctl -A $drive  | grep -E "Current_Pending_Sector" | awk -F" " '{ print $2,$10 }'
    smartctl -A $drive  | grep -E "Offline_Uncorrectable"  | awk -F" " '{ print $2,$10 }'
)

  echo -e "$smart\n"           >> "$local_da_imagem_da_particao"/smartcheck.txt
  
  
done 


# Resultado:

# /dev/sda  
# 
# Serial Number:    45L3GXHAS
# Power_On_Hours 63584
# Reallocated_Sector_Ct 0
# Current_Pending_Sector 0
# Offline_Uncorrectable 0
# 
# /dev/sdb 



# /dev/sdc 




# REFERÊNCIAS:

# https://www.reddit.com/r/zfs/comments/11nxm8n/working_bash_script_to_check_smarts_on_all_sata/
# https://unix.stackexchange.com/questions/121767/run-smartctl-on-all-disks-of-a-server



echo "
Ponto de montagem:
"

echo "
Pasta /mnt:
"
ls -1 /mnt/

echo "
Pasta /media:
"
ls -1 /media/

read -p "
Informe o ponto de montagem para o dispositivo identificado como /dev/$dispositivo para montar.
Ex: /mnt " ponto_de_montagem



sistema_de_arquivo_do_windows=$(lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL | grep "$dispositivo"  | awk '{print $3}')

if [ "$sistema_de_arquivo_do_windows" == "ntfs" ]; then


# mount -t ntfs-3g -o dmask=0077,umask=0177 /dev/$dispositivo  $ponto_de_montagem


mount -t ntfs-3g /dev/"$dispositivo"  "$ponto_de_montagem"    2>> "$log"


# Forçar montagem de partição NTFS Windows

# mount -t ntfs-3g -o remove_hiberfile /dev/"$dispositivo"   "$ponto_de_montagem"    2>> "$log"


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=21645



else


mount /dev/"$dispositivo"  "$ponto_de_montagem"    2>> "$log"



if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)


echo "

Local: $local_da_imagem_da_particao

Conteudo da pasta:
"

ls -1 "$local_da_imagem_da_particao"



break


else

echo "
Ocorreu problema ao montar o dispositivo /dev/$dispositivo em $ponto_de_montagem



" | tee "$log"


fi



# Problemas ao tentar montar HD externo
# =====================================


# $ sudo mount /dev/sdc1 /mnt/hd_externo/
# ntfs_attr_pread_i: ntfs_pread failed: Erro de entrada/saída
# Failed to read NTFS $Bitmap: Erro de entrada/saída
# NTFS is either inconsistent, or there is a hardware fault, or it's a
# SoftRAID/FakeRAID hardware. In the first case run chkdsk /f on Windows
# then reboot into Windows twice. The usage of the /f parameter is very
# important! If the device is a SoftRAID/FakeRAID then first activate
# it and mount a different device under the /dev/mapper/ directory, (e.g.
# /dev/mapper/nvidia_eahaabcc1). Please see the 'dmraid' documentation
# for more details.


# NTFSFIX retorna:

# $ sudo ntfsfix /dev/sdc1
# Mounting volume... Failed to write lock '/dev/sdc1': Resource temporarily unavailable
# Error opening '/dev/sdc1': Resource temporarily unavailable
# FAILED
# Attempting to correct errors... Failed to write lock '/dev/sdc1': Resource temporarily unavailable
# Error opening '/dev/sdc1': Resource temporarily unavailable
# FAILED
# Failed to startup volume: Resource temporarily unavailable
# Failed to write lock '/dev/sdc1': Resource temporarily unavailable
# Error opening '/dev/sdc1': Resource temporarily unavailable
# Volume is corrupt. You should run chkdsk.

# Já tentei o chkdsk no Windows e também não resolveu.


# No utilitário Discos, ele dá as seguintes informações adicionais:
# 
# Modelo: TOSHIBA MQ01ABD100(AX001U)
# Tamanho: 1,0TB (1.000.204.886.016 bytes)
# Particionamento: Master Boot Record
# Avaliação: O disco está OK, 264 setores defeituosos (34ºC)



# Dá uma olhada ps verbse tem erro

# dmesg --level=emerg, crit,err | grep /dev/sdc1


# HD tem alguma criptografia nas partições.


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Hard-on-Linux/Problemas-ao-tentar-montar-HD-externo




# Erro ao montar partição NTFS (Ubuntu 13.04 em dual boot com o Windows 8)


# Porém ao tentar entrar na partição NTFS onde estão os meus arquivos aparece a seguinte mensagem de erro:

# Não foi possível acessar "Volume 322 GB"

# Error mounting /dev/sda4 at /media/juliano/B49A63719A632F54: Command-line `mount -t "ntfs" -o "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177" "/dev/sda4" "/media/juliano/B49A63719A632F54"' 
# exited with non-zero exit status 14: The disk contains an unclean file system (0, 0).
# Metadata kept in Windows cache, refused to mount.
# Failed to mount '/dev/sda4': Operation not permitted
# The NTFS partition is in an unsafe state. Please resume and shutdown
# Windows fully (no hibernation or fast restarting), or mount the volume
# read-only with the 'ro' mount option.


# O Windows 8 utiliza um recurso parecido com a hibernação, que serve para agilizar sua próxima inicialização. O problema disso é que, como é indicado pelo mount, é 
# perigoso mexer na partição enquanto ela possui esse estado de hibernação. Sugiro então que busque uma forma de desativar isso no windows.


# Rode o comando ntfsfix como root no linux com a partição do windows desmontada.
#
# "Você pode executar ntfsfix em um volume NTFS, se você acha que foi danificado pelo Windows ou alguma outra forma e não pode ser montado."
#
# http://linux.die.net/man/8/ntfsfix
#
# Após esse comando, feche normalmente o linux e inicie o windows que ele vai para o modo de correção para verificar a consistência do sistema e corrigir.


# Quando desliga a máquina no Windows, na verdade ela só hiberna. Para resolver, liga o Windows 8 e desliga via prompt de comando: shutdown /s

# A máquina vai desligar, agora quando iniciar o Linux, irá conseguir acessar a partição do Windows normalmente.

# Basta lembrar sempre de reiniciar o Windows, ou desligar pelo prompt, para que ele não deixei a montagem da sua partição em cache.


# Uma possível solução é desabilitar a inicialização rápida do Windows


# REFERÊNCIAS:

# https://antoniomedeiros.dev/blog/2015/09/16/como-desativar-a-inicializacao-rapida-do-windows/
# https://github.com/vinyanalista



# Quando iniciar o pc entre no windows para desativar a sua hibernação:

# Entre no prompt de comando como administrador:

# Digite esse comando :

# powercfg -h off e pressione enter.


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Ubuntu-e-Kubuntu/Erro-ao-montar-particao-NTFS
# http://social.technet.microsoft.com/wiki/pt-br/contents/articles/13657.desativando-hibernacao-no-windows-8.aspx




sleep 40
clear

exit 
 
fi


echo "================================================"

;;



3) # Compartilhamento SAMBA (com ou sem senha)  - rede

clear

echo "
Compartilhamento SAMBA...
"

# Como montar pastas de rede compartilhadas no Linux


read -p "
Informe o endereço IP do servidor onde esta o compartilhamento para montar.
Ex: 192.168.0.154" ip

# Verificar se a variavel $ip é nula

[ -z "$ip" ] && { echo "O valor não pode ser nulo... Informe o endereço $ip do servidor SAMBA" ; exit ; }


ping -c 5 $ip

if [ $? -eq 0 ]; then

echo "
O servidor $ip esta na rede...
"

sleep 2

else

clear

echo "
Ocorreu problema ao se comunicar com o servidor $ip

Verifica: 

O cabo de rede
O endereço IP do servidor SAMBA
As portas se estão aberta no firewall (iptables) no  servidor SAMBA e nesta estação de trabalho
Se você esta na mesma rede do servidor SAMBA
Placa de rede

"

sleep 40
exit

fi


read -p "
Informe o nome do compartilhamento localizado em $ip para montar.
Ex: clonezilla " compartilhamento

# Verificar se a variavel $compartilhamento é nula

[ -z "$compartilhamento" ] && { echo "O valor não pode ser nulo... Informe o nome do compartilhamento em $ip" ; exit ; }

echo "
Ponto de montagem:
"

echo "
Pasta /mnt:
"
ls -1 /mnt/

echo "
Pasta /media:
"
ls -1 /media/

read -p "
Informe o ponto de montagem para o compartilhamento //$ip/$compartilhamento
Ex: /mnt " ponto_de_montagem


# Verificar se a variavel $ponto_de_montagem é nula

[ -z "$ponto_de_montagem" ] && { echo "O valor não pode ser nulo... Informe um ponto de montagem para o compartilhamento //$ip/$compartilhamento" ; exit ; }


umount "$ponto_de_montagem" 2>> "$log"

sleep 2
clear

# ------------------------------------------------------------------------------------------------------------------------

# Comparar se digitou s S ou n N

echo "
O compartilhamento $compartilhamento no servidor $ip é com senha? [s | S ou n | N]"

read -n1 MCONFIRMA

# -n1 força um enter depois de teclar um caractere, sem ele permite teclar mais de um caracter e precisa teclar enter.


  if [ "$MCONFIRMA" = "S" -o "$MCONFIRMA" = "s" ]; then

      # Requer confirmação, com a tecla s ou S prossegue.
      
      echo "Prosseguindo..."
      
      sleep 2
      clear
      
      # Compartilhamento SAMBA com senha
      
      echo "Qual o nome do usuário para acessar o compartilhamento $compartilhamento no servidor $ip?"
      read nome_do_usuario
      
      echo "Qual a senha do compartilhamento $compartilhamento no servidor $ip?"
      read senha
      
 
      mount -t cifs //"$ip"/"$compartilhamento" "$ponto_de_montagem" -o user="$nome_do_usuario", password="$senha"  2>> "$log"
      
      
      else
      
     # Qualquer outra tecla cai aqui e encerra o script. 

      
     # Compartilhamento SAMBA sem senha

      mount -t cifs //"$ip"/"$compartilhamento" "$ponto_de_montagem" -o guest  2>> "$log"

      
     #  echo "encerrando script, teclou $MCONFIRMA"
     #  exit

   
  fi

# ------------------------------------------------------------------------------------------------------------------------


 

if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)

echo "Local: $local_da_imagem_da_particao"

echo "
Conteudo da pasta:
"
ls -1 "$local_da_imagem_da_particao"

break

else

echo "
Ocorreu problema ao montar o compartilhamento //$ip/$compartilhamento em $ponto_de_montagem

" | tee "$log"


sleep 30
exit
 
fi



# REFERÊNCIAS:

# https://rafaelit.com.br/como-montar-pastas-compartilhadas-linux-windows/
# https://www.shellscriptx.com/2016/12/estrutura-condicional-if-then-elif-else-fi.html
# https://www.zago.eti.br/script/if.html


echo "================================================"
;;


4) # Compartilhamento NFS (Network File System) - rede

# Montando e conectando em um servidor NFS

clear

echo "
Compartilhamento NFS...
"


# Conectando ao servidor
# O processo para montar um diretório liberado no servidor é bem simples. Basta utilizar a seguinte sintaxe:

# mount -t nfs (host):(diretorio_a_ser_montado) (diretorio_destino)


read -p "
Informe o endereço IP do servidor onde esta o compartilhamento para montar.
Ex: 192.168.0.154" ip

# Verificar se a variavel $ip é nula

[ -z "$ip" ] && { echo "O valor não pode ser nulo... Informe o endereço $ip do servidor SAMBA" ; exit ; }


ping -c 5 $ip

if [ $? -eq 0 ]; then

echo "Com acesso ao servidor $ip"
sleep 2

else

clear

echo "
Ocorreu problema ao se comunicar com o servidor $ip

Verifica: 

O cabo de rede
O endereço IP do servidor SAMBA
As portas se estão aberta no firewall (iptables) no  servidor SAMBA e nesta estação de trabalho
Se você esta na mesma rede do servidor SAMBA
Placa de rede

"

sleep 40
exit

fi


read -p "
Informe o nome do compartilhamento localizado em $ip para montar.
Ex: clonezilla " compartilhamento

# Verificar se a variavel $compartilhamento é nula

[ -z "$compartilhamento" ] && { echo "O valor não pode ser nulo... Informe o nome do compartilhamento em $ip" ; exit ; }

echo "
Ponto de montagem:
"

echo "
Pasta /mnt:
"
ls -1 /mnt/

echo "
Pasta /media:
"
ls -1 /media/

read -p "
Informe o ponto de montagem para o compartilhamento //$ip/$compartilhamento
Ex: /mnt " ponto_de_montagem


# Verificar se a variavel $ponto_de_montagem é nula

[ -z "$ponto_de_montagem" ] && { echo "O valor não pode ser nulo... Informe um ponto de montagem para o compartilhamento //$ip/$compartilhamento" ; exit ; }


umount "$ponto_de_montagem" 2>> "$log"


clear

mount -t nfs "$ip":"$compartilhamento" "$ponto_de_montagem"   2>> "$log"

if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)

echo "Local: $local_da_imagem_da_particao"

echo "
Conteudo da pasta:
"
ls -1 "$local_da_imagem_da_particao"

break

else

echo "
Ocorreu problema ao montar o compartilhamento NFS (Network File System) $ip:$compartilhamento em $ponto_de_montagem
" | tee "$log"

sleep 30
exit
 
fi


# Qual a diferença de um Samba Server para um NFS? 

# a diferença é:

# * NFS é o sistema de compartilhamento de arquivos nativos dos Unix/Linux;
# * O Samba é um aplicativo que emula o comportamento de um servidor de
# arquivos com protocolo SMB, que é nativo dos Windows.

# Então NFS é compartilhamento Linux vs Linux e Samba Linux vs Windows. 


# xbps-query -Rs nfs
# [-] nfs-utils-2.6.4_1          Network File System utilities



# REFERÊNCIAS:

# https://www.vivaolinux.com.br/dica/Montando-e-conectando-em-um-servidor-NFS
# https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04-pt


sleep 5s
echo "================================================"

;;


5)

clear

echo "Saindo..."
sleep 5s
clear
exit
;;


*) 
clear

echo "
Opção inválida!
"
sleep 1

esac
done

# Fim do loop


clear

echo "
Continuando....
"

sleep 2
clear


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/script/Menu-em-Shell-Script




# ----------------------------------------------------------------------------------------

clear

ls -1 $local_da_imagem_da_particao

read -p "
Informe o caminho completo da pasta onde esta a imagem: " local_da_imagem_da_particao


# Verificar se a variavel $local_da_imagem_da_particao é nula

[ -z "$local_da_imagem_da_particao" ] && { echo "O valor não pode ser nulo... Informe a pasta onde estão os arquivos de imagem do sistema." ; exit ; }


echo "
Local: $local_da_imagem_da_particao
"

ls -1 $local_da_imagem_da_particao  2>> "$log"

sleep 2

# ----------------------------------------------------------------------------------------


# Identificar se esta usando MBR ou GPT no HD/SSD


# Há dois principais tipos de tabelas de partição disponíveis: 

# Master Boot Record (MBR)
# Tabela de Partição GUID (GPT) 


# Valores: "msdos" para MBR e "gpt" para gpt

# formato_da_tabela_de_particoes=$(parted -s $HD -- print | grep -E '^Partition Table: (gpt|msdos)$' | head -n 1 | sed 's,^Partition Table: \([a-z]\+\)$,\1,' | grep -E '^[a-z]+$')
# formato_da_tabela_de_particoes=$(parted -s $HD -- print | grep -E '^Tabela de partições: (gpt|msdos)$' | head -n 1 | sed 's,^Tabela de partições: \([a-z]\+\)$,\1,' | grep -E '^[a-z]+$')


# fdisk -l  "$HD" | grep "Tipo de rótulo do disco:" | cut -d: -f2  | sed 's/ //g'



# Verificar se o arquivo "$local_da_imagem_da_particao/fdisk.txt" existe

if [ -e "$local_da_imagem_da_particao/fdisk.txt" ] ; then

echo "
O arquivo $local_da_imagem_da_particao/fdisk.txt existe.
"


# Idioma do sistema

# locale -a


if [ "$LANG" == "pt_BR.UTF-8" ]; then

echo "
Idioma do sistema: $LANG
"


# BR
formato_da_tabela_de_particoes=$(cat "$local_da_imagem_da_particao"/fdisk.txt | grep "Tipo de rótulo do disco:" | cut -d: -f2  | sed 's/ //g')


elif [ "$LANG" == "en_US.UTF-8" ];then

echo "
System language: $LANG
"
  
# US
formato_da_tabela_de_particoes=$(cat "$local_da_imagem_da_particao"/fdisk.txt | grep "Disk label type:" | cut -d: -f2  | sed 's/ //g')

   
else

clear

echo "
Sem suporte ao idioma: $LANG
" | tee  "$log"

# exit

fi



echo "
Tipo de tabelas de partição da imagem:

$formato_da_tabela_de_particoes
"

sleep 5
clear



else



clear

echo "
O arquivo $local_da_imagem_da_particao/fdisk.txt não existe.
"

fi
 

# REFERÊNCIAS:

# https://www.dedoimedo.com/computers/partition-table-backup-restore.html
# https://www.vivaolinux.com.br/topico/Shell-Script/verificar-se-arquivo-existe


echo "
Qual o tipo de tabelas de partição da imagem a ser restaurada? [dos ou gpt]"
read formato_da_tabela_de_particoes

if [ "$formato_da_tabela_de_particoes" == "dos" ];
   then
   
   echo "
   dos
   "

sleep 2
clear

echo "
Restaurando a tabela de partições para $HD...
"

sleep 5
clear

sfdisk –force "$HD" < "$local_da_imagem_da_particao"/sda.sf  2>> "$log"


# Se você tem um HD dividido em duas partições: sda1 e sda2; você precisa fazer imagens das duas partições usando o Partclone, 
# fazer o backup da mbr e da table de partição usando os comandos acima e, na hora de restaurar, começar copiando os dois 
# arquivos e só depois recuperar as partições.

# Lembre-se que um jeito fácil de fazer e recuperar os backups é instalar temporáriamente um segundo HD na máquina.


# REFERÊNCIAS:

# https://www.hardware.com.br/tutoriais/usando-partimage/
# https://sempreupdate.com.br/criar-um-cd-dvd-de-instalacao-a-partir-do-hd-para-qualquer-linux/
# https://www.hardware.com.br/dicas/systemrescuecd.html




echo "
Restaurando o MBR no $HD...
"


sleep 5
clear

# Na hora de restaurar os backups, basta acessar a pasta onde estão os arquivos e inverter os comandos, para que eles sejam restaurados:

dd if="$local_da_imagem_da_particao"/sda-mbr of="$HD" bs=512 count=1  2>> "$log"


# dd if=sda-mbr of=/dev/sda bs=512 count=1
# 1+0 records in
# 1+0 records out
# 512 bytes (512 B) copied, 0.0293491 s, 17.4 kB/s



# Criar um menu com laço while com base nos arquivos .gz na pasta


echo "
Restaurar imagem usando o Partclone (split, gzip) com fonte stdin
"


# cat "$local_da_imagem_da_particao"/sda1.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s - -o "$HD"1
# cat "$local_da_imagem_da_particao"/sda2.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s - -o "$HD"2

# O partclone fica com tela preta e não com tela azul.  Solução: usar a opção -N depois de partclone.ntfs



# ----------------------------------------------------------------------------------------


sleep 2
clear

   elif [ "$formato_da_tabela_de_particoes" == "gpt" ];
   then



echo "
Restaurar o backup da tabela de partição (GPT) para discos $HD...

gdisk, uma ferramenta projetada para criar e manipular tabelas de partição do tipo GPT.

"

sleep 5
clear

# sgdisk - uma versão do gdisk projetada para uso não interativo. 

# Sgdisk em ação (restauração)

# Se o sgdisk não estiver instalado, basta instalar o programa do repositório oficial.

sgdisk --load-backup="$local_da_imagem_da_particao"/gpt.backup  "$HD"  2>> "$log"


#         -G, --randomize-guids
#
#               Aleatorize o GUID do disco e os GUIDs exclusivos de todas as partições (mas
#               não seus GUIDs de código de tipo de partição). Esta função pode ser usada
#               depois de clonar um disco para renderizar todos os GUIDs mais uma vez
#               exclusivo.

# sgdisk -G "$HD"  2>> "$log"


# Carregar o arquivo do backup (-l ou --load-backup).
# A variavel "$HD" será o dispositivo de destino.


# Você deve respeitar o processo. É muito fácil cometer erros ou alterar a ordem da origem e do destino. As lágrimas normalmente surgem neste momento.
#
# Ter backups de tabelas de partição pode ser útil se você precisar alterar todo o disco ou talvez reparar uma tabela de partição danificada. 
#
# Tenha cuidado e use sgdisk para backups GPT.


# REFERÊNCIAS:

# https://www.dedoimedo.com/computers/gpt-disk-backup-partition-table.html
# https://askubuntu.com/questions/57908/how-can-i-quickly-copy-a-gpt-partition-scheme-from-one-hard-drive-to-another
# https://unix.stackexchange.com/questions/346315/how-to-backup-gpt-partitions-and-file-system-type-only-no-files-folders
# https://wiki.archlinux.org/title/GPT_fdisk
# https://www.golinuxcloud.com/backup-copy-restore-partition-table-sfdisk/

# ----------------------------------------------------------------------------------------



  else
  
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo possui um formato $formato_da_tabela_de_particoes  não suportado pelo Partclone.
   \e[00m"

sleep 10

exit 


fi


sleep 2
clear



# Pegar todos os arquivos *.gz.* da pasta $local_da_imagem_da_particao

array=("$local_da_imagem_da_particao"/*.gz.*)


# Ver a quantidade de arquivos .gz na pasta $local_da_imagem_da_particao

itens=$(ls -1 "$local_da_imagem_da_particao"/*.gz.* | wc -l)

echo "
Restauração de imagens para o $HD
=========================================


Arquivos de imagens localizados na pasta $local_da_imagem_da_particao
"

# Inicio do laço while para exibir o menu e tratar a escolha do usuário

while true; do



# Inicio do laço for (gera o menu na tela)

for((i = 0; i < $itens; i++))
do
      echo "[$i] `basename ${array[$i]}`"
done

# Fim do laço for


# Solicitar a opção do usuário

echo "
Digite o número da opção desejada (100 para sair): " 
read opcao

clear

# Verificar se o usuário digitou 0 para sair

if [[ $opcao -eq 100 ]]; then

clear

break

fi


if (( $opcao < $itens )); then

		 echo -e "Você escolheu a opcao `basename ${array[$opcao]}`, tente novamente:\n"
		 
		 # Percorrer o array


                  # Pegar o nome do arquivo de imagem (parte 1)
                  
                  imagem=$(echo "`basename ${array[$opcao]}`")
                  
                  
                  # Pegar somente o numero da string
                                
                  numero_da_particao=$(echo "$imagem"  | cut -d"." -f1 | sed 's/[[:alpha:]]//g')
                  
                  # numero_da_particao=$(echo "$imagem" | sed 's/[^0-9]//g') 
                  
                  
                  # https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
                  
                  
                  sistema_de_arquivo=$(echo "$imagem" | cut -d. -f2 | cut -d- -f1 )
 
                  # ntfs
                  
clear
                  
echo "Essas informações estão corretas [s|S|n|N]?

Localização:                     $local_da_imagem_da_particao
Nome do arquivo:                 $imagem
Formato da tabela de partições:  $formato_da_tabela_de_particoes
Sistema de arquivo:              $sistema_de_arquivo
Partição a ser restaurada:       $HD$numero_da_particao


Comando que vai ser executado na próxima etapa:

cat $local_da_imagem_da_particao/$imagem* | gunzip -c | partclone.$sistema_de_arquivo -L /var/log/partclone.log  -d -r -s -N - -o $HD$numero_da_particao   2>> $log

"
read resposta

case "$resposta" in
    s|S|"")
        echo ""
    ;;
    y|Y)
        echo ""
    ;;
    n|N)
        clear
        echo "Saindo..."
        exit
    ;;
    *)
        clear
        echo "Opção inválida: $resposta"
        exit
    ;;
esac


clear



# Comparar os dois valores


# Obs: O tamanho do HD de destino não pode ser menor que o tamanho do HD de origem.

# Ver o tamanho da imagem com o tamanho do dispositivo de armazenamento de destino


# Usar somente número inteiro nas variaveis

tamanho_da_origem=$(du -hs "$local_da_imagem_da_particao" | awk '{print $1}' | cut -d, -f1)
# 2,9G => 2

# Como a imagem esta compactada  usaremos a calculadora (bc)

tamanho_da_origem=$(echo $tamanho_da_origem*4 | bc)
# 2*4 = 8

tamanho_do_destino=$(lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT | grep "$HD" | head -n1 | awk '{print $3}' | cut -d, -f1)
# 465,8G => 465


# REFERÊNCIAS:

# https://pt.linux-console.net/?p=10487



# Comparações com números

# Para comparar números, temos disponíveis os seguintes operadores:

#     Igual à (equal): -eq
#     Diferente de (not equal): -ne
#     Menor que (less than): -lt
#     Maior que (greater than): -gt
#     Menor ou igual à (less or equal): -le
#     Maior ou igual à (greater or equal): -ge

# Comparações com texto

# Para trabalhar a comparação de strings, temos disponíveis os seguintes operadores:

#     Igual à: =
#     Diferente de: !=
#     String não é vazia: -n
#     String é vazia: -z ## Um exemplo simples


if [ "$tamanho_do_destino" -gt "$tamanho_da_origem" ]; then

    echo "O tamanho do dispositivo de armazenamento de destino é valido para restaurar a imagem."
    
    sleep 5
    clear
    
else

    clear
    
    echo "
    O tamanho do dispositivo de armazenamento de destino não pode ser menor do que o tamanho do dispositivo de armazenamento de origem.
    " | tee  "$log"
    
    sleep 10
    clear
    
    # exit
    
fi


# REFERÊNCIAS:

# https://www.vivaolinux.com.br/dica/Retornar-o-tamanho-de-arquivo-ou-diretorio-em-bytes-(KB-MB)
# https://solitudelab.wordpress.com/2017/12/21/shell-script-operadores-de-comparacao-e-entrada-de-dados/


# Puxa a imagem para o HD
# Faça a restauração

clear


# cat "$local_da_imagem_da_particao"/$imagem* | gunzip -c | partclone."$sistema_de_arquivo" -d -r -s -N  -L /var/log/partclone.log - -o "$HD"$numero_da_particao   2>> "$log"

cat "$local_da_imagem_da_particao"/$imagem* | gunzip -d -c | partclone.restore -N -F -L /var/log/partclone.log -O "$HD"$numero_da_particao   2>> "$log"


# Agora é só aguardar para uma imagem de 650MB, a restauração demora cerca de 5 minutos dependendo do seu hardware. 




# REFERÊNCIAS:

# https://www.vivaolinux.com.br/topico/Shell-Script/Executar-script-com-argumento-sim-ou-nao
# http://blog.evaldojunior.com.br/aulas/blog/shell%20script/2011/05/08/shell-script-parte-2-controle-de-fluxo.html
# https://pt.stackoverflow.com/questions/311679/como-comparar-o-valor-de-uma-vari%C3%A1vel-com-uma-string-no-shell-script
# https://www.campuscode.com.br/conteudos/shell-script-basico-de-controle-de-fluxo
# https://gist.github.com/saltlakeryan/4aa49f19a40b83a1a7d2



                  
	 else
	        
	        clear
	        
		echo "Você escolhe $opcao. Adeus!"
		
		break
		
	fi



done

# Usar o loop while no lugar do for.

# ----------------------------------------------------------------------------------------
  
  

# Obter informações de uma imagem
	
# partclone.info -s sda2.img



# Restaurar uma imagem para partição
	
# partclone.ntfs -d -r -s sda2.img -o /dev/sda2

# partclone.ext4 -d -r -s sda1.img -o /dev/sda1

# partclone.ext4 -r -s ~/image_sda1.pcl -o /dev/sda1



# Restaurar imagem do clonezilla (split, gzip) com fonte stdin

# cat sda1.ext3-ptcl-img.gz.a* | gunzip -c | partclone.ext3 -d -r -s - -o /dev/sda1



# zcat ~/image_sda1.pcl.gz | partclone.ext4 -r -o /dev/sda1


# -r , --restore => Restaure a partição do formato de imagem especial.

  
  
          
          
            ;; 
            



        --gui)
        
# ==========================================================================================


# Verificar se o Yad, o xfce4-terminal e o xterm estão instalado no sistema.
#
# which yad              1> /dev/null 2> /dev/null || exit
#
# which xfce4-terminal   1> /dev/null 2> /dev/null || exit
#
# which xterm            1> /dev/null 2> /dev/null || exit



# Determina o comprimento e a altura da tela do xfce4-terminal:

altura="30"
comprimento="150"


clear

# Chamar a função verificar

verificar



# Mostra o menu na tela, com as ações disponíveis

opcao=$(yad --list --radiolist --title "ypartclone" \
--text "O que deseja fazer?" \
--column "Opção" --column "Descrição" \
false "Clonar sistema" \
false "Restaurar sistema" \
false "Ajuda" \
false "Sair" \
--button=Cancelar:1 --button=ok:0  \
--width="540" --height="300" 2>/dev/null )



# Se apertar CANCELAR ou ESC, então vamos sair...
[ $? -ne 0 ]

# De acordo com a opção escolhida, dispara programas
# opcao=$(echo $opcao | egrep -o '^[0-3]')
# case "$opcao" in


# ==========================================================================================

# Clonar sistema

if echo "$opcao" | grep $"Clonar sistema" 1>/dev/null  ; then

# clear



# xfce4-terminal -H -e "bash -c \"$0 --clonar\""

xfce4-terminal  --title="Clonar - Parclone" -e "bash -c \"$0 --clonar\"" --geometry "${comprimento}x${altura}"


# --color-text=red
# --color-bg=green
# --maximize



# A versão 1.1.1 do xfce4-terminal não possui opção de centralizar a tela. 
#
#
# Para centralizar a tela do xfce4-terminal, você pode seguir os seguintes passos:
# 
# 1. Abra o xfce4-terminal.
# 2. No menu superior do xfce4-terminal, clique em "Editar" e selecione "Preferências".
# 3. Nas preferências do xfce4-terminal, selecione a aba "Aparência".
# 4. No painel "Estilo de janela", localize a opção "Posição" e escolha a opção "Centro".
# 5. Clique em "Fechar" para salvar as alterações.
# 
# Dessa forma, a próxima vez que você abrir o xfce4-terminal, ele será exibido no centro da tela.
# 
# ou
# 
# Para centralizar a tela do xfce4-terminal pela linha de comando, você pode usar as seguintes etapas:
# 
# 1. Abra o terminal xfce4-terminal.
# 2. Execute o seguinte comando para centralizar a tela:
# 
# 
# xfconf-query -c xfce4-terminal -p /misc/geometry/centered -s true
# 
# 
# Dessa forma, a tela do xfce4-terminal será centralizada automaticamente.





# xterm -e "$0 --clonar"


# REFERÊNCIAS:

# https://forum.xfce.org/viewtopic.php?id=12642
# https://askubuntu.com/questions/980720/open-xfce-terminal-window-and-run-command-in-same-window
# https://docs.gtk.org/gdk3/method.RGBA.parse.html
# https://bbs.archlinux.org/viewtopic.php?id=279430
# https://unix.stackexchange.com/questions/30234/how-to-set-custom-default-size-for-new-xfce-terminal-windows


fi

# ==========================================================================================

# Restaurar sistema

if echo "$opcao" | grep $"Restaurar sistema" 1>/dev/null  ; then


# clear


xfce4-terminal  --title="Restaurar - Parclone" -e "bash -c \"$0 --restaurar\"" --geometry "${comprimento}x${altura}"


# xterm -e "$0 --restaurar"


fi

# ==========================================================================================

# Ajuda

if echo "$opcao" | grep $"Ajuda" 1>/dev/null  ; then

# clear


rm -Rf /tmp/ajuda.log


$0 --ajuda > /tmp/ajuda.log


# Eliminar o intervalo entre as linhas 1 e 6:

sed -i '1,6d' /tmp/ajuda.log


# Inserir linha no início do arquivo


# Link de site não é adicionado ao arquivo /tmp/ajuda.log usando o sed

# Resultado: sed: -e expressão #1, caractere 62: opção desconhecida para o comando `s' (s///?)

# O erro ocorre porque o sed estava usando o delimitador "/" que também esta incluindo no "link" a adicionar no arquivo, 
# isso faz com que o sed interprete o "/" como o delimitador ao invés de velo como um caractere de texto.


sed -i "1s/^/                                                                                                                     \n/"  /tmp/ajuda.log
sed -i "2s/^/           #--------------------------------------------------------------------------------------------------------#\n/"  /tmp/ajuda.log
sed -i "3s/^/           #                                                                                                        #\n/"  /tmp/ajuda.log
sed -i "4s/^/           #                               $descricao - $versao                             #\n/"  /tmp/ajuda.log
sed -i "5s/^/           #                               Escrito por $autor - $data                             #\n/"  /tmp/ajuda.log
sed -i "6s|^|           #                               $site                          #\n |"  /tmp/ajuda.log
sed -i "7s/^/           #                                                                                                        #\n/"  /tmp/ajuda.log
sed -i "8s/^/           #--------------------------------------------------------------------------------------------------------#\n/"  /tmp/ajuda.log


# Substitui a palavra "$descricao" pelo conteudo da variavel $descricao somente na linha 6

# E possível trocar o delimitador do comando sed por outra coisa, no caso o "|". 

# sed -i "6s|site|$site|" /tmp/ajuda.log


# REFERÊNCIAS:

# http://www.zago.eti.br/script/sed.html



# Usar "aspas duplas" para usar o sed com variavel.


# REFERÊNCIAS:

# https://pt.linux-console.net/?p=12008
# https://www.vivaolinux.com.br/topico/Shell-Script/sed-com-variavel



yad --title "Ajuda" --center --text-info --fore=green --filename=/tmp/ajuda.log  --width=1100 --height=1000 2>/dev/null 

rm -Rf /tmp/ajuda.log


# xterm -e "$0 --ajuda ; sleep 10"



# REFERÊNCIAS:

# http://smokey01.com/yad/
# http://ti1.free.fr/index.php/yad-creer-des-fenetres-pour-des-scripts-bash/
# https://yad-guide.ingk.se/text/yad-text.html
# https://br.ccm.net/faq/8483-sed-excluir-uma-ou-mais-linhas-de-um-arquivo
# https://www.vivaolinux.com.br/topico/Shell-Script/Apagar-linha-especifica-em-arquivo
# https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
# https://www.ime.usp.br/~batista/sed_ptBR.html
# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/METACARACTERES-NO-SED-DANDO-DOR-DE-CABECA


fi

# ==========================================================================================

# Sair do script

if echo $opcao | grep $"Sair" ; then

clear

exit


fi

# ==========================================================================================


clear
        
            ;;
            

        
                    
        --ajuda|--help|-h)
        
          echo "
                Use: $0 --clonar|-c           para clonar HD;
                Use: $0 --restaurar|-r        para restaurar uma imagem do sistema para o HD;
                Use: $0 --gui                 Abre o script usando o Yad.                  
                Use: $0 --ajuda|--help|-h     mostra essa tela.                    
                "
echo "

Preparando o HD
===============


Primeiro é necessário criar uma nova partição para que você possa guardar a imagem da partição 
que está instalado o sistema operacional.

Utilize o seu particionador preferido, eu utilizo o Gparted ou cfdisk.

Após a criação, formate a partição (ext4) que você criou para guardar a imagem do sistema.

Na hora de restaurar a imagem para o HD/SSD o hardware tem que ser o mesmo onde foi gerada a 
imagem não pode ser diferente.


# Limpa o MBR, mas não toca na tabela de partição, (muito útil para apagar o GRUB sem perder dados nas partições):
#
# sudo dd if=/dev/zero dd of=/dev/sda bs=446 count=1
#
#
# Exemplo:
#
# dd if=/dev/zero of=/dev/sda bs=446 count=1
# 1+0 records in
# 1+0 records out
# 446 bytes (446 B) copied, 0.0235537 s, 18.9 kB/s
#
#
# https://blog.desdelinux.net/pt/uso-del-comando-dd/
# https://www.certificacaolinux.com.br/backup-do-mbr-com-o-comando-dd/



# Como reparar o Windows 10 com CD de instalação?
# 
# No Windows 10 e Windows 11:
# 
#     Insira o DVD ou o pen drive no computador.
#     Execute o boot do Windows pelo disco de instalação. ...
#     Na tela de instalação, clique em Avançar e, depois, em Reparar o computador.
#     Clique em Solução de Problemas -> Opções Avançadas -> Reparo de Inicialização.
#     Clique em Windows 10 e aguarde o reparo.

# https://tecnoblog.net/responde/como-restaurar-windows-10-ou-windows-7/
# https://sobrelinux.info/questions/832484/failed-to-use-partclone-program-to-save-or-restore-an-image
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/partclone-do-clonezilla-clona-o-win10-11-e-12


# Como operar o testdisk para recuperar a MBR

# https://www.vivaolinux.com.br/topico/Linux-Avancado/Recuperar-Tabela-de-particoes-HD-Externo-1



# Procurar uma forma de restaurar esse backup da tabela de partição



# Para restaurar apenas a tabela de partição, você deve usar:

# dd if=/caminho/para/arquivo_mbr.img of=/dev/sda bs=1 skip=446 count=64

# https://wiki.archlinux.org/title/Dd_(Portugu%C3%AAs)




Reparar HD NTFS (ntfs-3g)


# ntfsfix /dev/<device name>


O comando funciona apenas na partição desmontada. A partir do Windows 8, a configuração de inicialização rápida deve ser desativada, 
caso contrário HD/SSD não é montado em modo de escrita o que bloqueia qualquer função de reparo. Se tudo der certo aparecera isso 
no terminal:

# ntfsfix /dev/sda6
Mounting volume... OK
Processing of $ MFT and $ MFTMirr completed successfully.
Checking the alternate boot sector... OK
NTFS volume version is 3.1.
NTFS partition /dev/sda6 was processed successfully.



Hiren's Boot  (versão live do windows)


Usar essa opção abaixo em caso de problema com  a clonagem de Windows.

cmd

chkdsk c: /f



Recomendações antes da clonagem do Windows com muito tempo de uso no hardware:

- Verificar se o HD/SSD está muito fragmentado caso esteja desfragmentar usando o próprio programa nativo do Windows.
- Verificar a saúde do HD
- Verificar por vírus
- Anotar a chave de ativação do Windows
- Verificar o HD/SSD com chkdsk Ex: chkdsk c: /f
- Remover os programas inúteis que estão instalados (os pré-instalados com windows e outros)

   Programas pré-instalados pelo fabricante

   A maioria dos fabricantes de notebooks, como a HP, Dell, Lenovo e Samsung, instalam programas 
   em seu computador. Embora alguns desses programas sejam úteis, a maioria é desnecessária.

- Realizar uma limpeza/faxina no Windows usando o programa nativo dele (limpeza de Disco) ou um arquivo .bat para liberar espaço.

  Para remover arquivos mais simples, a ferramenta Limpeza de Disco é uma das mais básicas e completas. Ela é capaz de eliminar 
  caches de navegação, arquivos temporários do sistema, logs de erros, arquivos esquecidos na Lixeira ou na pasta Download, e 
  também arquivos de atualizações do sistema, que o Windows 10 não mais utiliza após os updates.


- Remove extensões desnecessárias dos navegadores web (Exemplo Ask)

- Verificar se existe algum drive com conflito no sistema
- Verificar se falta algum drive no sistema
- Verificar se tem problema de falta de dlls
- Verificar por atualizações (instalar o pacote de atualização [SP1, SP2, SP3...] sem o acesso à internet)
- Desativar os serviços desnecessários.
- Verificar se o Firewall do Windows está ativado.
- Desativar a hibernação do Windows (powercfg.exe /hibernate off)
- Remove programas inúteis da inicialização do Windows

- Remove os programas não licenciados (piratas). Eles são um problema sério de segurança, uma vez que eles 
possuem arquivos modificados que podem conter vírus e outros arquivos maliciosos.

- Verificar se os programas básicos estão instalados no Windows:

  *   LibreOffice / WPS OFFICE  (suíte de escritório gratuita alternativa ao Pacote Office)
  *   7-Zip                     (descompactador de arquivos)
  *   Bloqueador de anúncios nos navegadores webs (extensão AdBlock)
  *   Firefox
  *   Google Chrome
  *   ImgBurn ou CDBurnerXP     (gravar algum tipo de conteúdo em CDs ou em DVDs)
  *   VLC / K-Lite Codec Pack   (player de vídeo)
  *   DropBox ou Google Drive   (Backup de dados na nuvem)
  *   Java
  *   GIMP                      (editor de imagem uma alternativa ao Photoshop)
  *   qBittorrent               (torrent) 
  *   Malwarebytes Anti-Malware (versão gratuita)
  *   Audacity                  (editor de áudio)
  *   Thunderbird               (Cliente de Email)
  *   Antivírus                 (Panda)
  *   Master PDF Editor         (Leitor de arquivos PDF)
  *   Clementine                (player de música)
  *   clipgrab
  *   Anydesk                   (Acesso remoto)
  *   Driver da impressora
  

A imagem gerada deve ser a minimalista possível. O básico do básico...
  

Nunca clonei um sistema macOS usando Linux, mas é possível fazer isso com o dd. O partclone também pode 
funcionar, mas é importante verificar a compatibilidade com o sistema de arquivos do macOS.
 
"

# REFERÊNCIAS:

# https://www.oficinadanet.com.br/windows10/26715-quais-aplicativos-pre-instalados-do-windows-10-voce-pode-desinstalar-e-quais-manter
# https://olhardigital.com.br/2019/05/29/noticias/veja-os-aplicativos-que-voce-pode-desinstalar-do-windows-10-apos-a-nova-atualizacao/
# https://tecnoblog.net/responde/como-liberar-espaco-no-windows-10-e-limpar-arquivos-inuteis/
# https://www.dz-techs.com/pt/methods-to-clone-your-linux-hard-drive/
# https://eduardomozartdeoliveira.wordpress.com/2018/08/22/clonando-um-hdd-ssd-maior-para-um-hdd-sdd-menor/
# https://caixaseca.blogspot.com/2011/09/personalizando-o-clonezilla-live.html



# Porque clonar HD com o dd demora tanto?

# https://www.hardware.com.br/comunidade/clonar-hd/1319474/


# MacOS

# https://medium.com/@crp_underground/acelerando-comando-dd-no-macos-15e982d03f38
# https://iboysoft.com/pt/como-fazer/software-de-clonagem-mac.html
# https://macmagazine.com.br/post/2022/01/25/novo-clone-do-macos-promete-rodar-apps-do-sistema-da-apple/
# https://airyx.org/
# https://macmagazine.com.br/post/2021/07/22/como-atualizar-o-macos-sistema-operacional-dos-macs/
# https://macmagazine.com.br/post/2017/03/31/apple-muda-a-recuperacao-do-macos-na-versao-10-12-4-e-facilita-as-coisas-para-quem-quer-reinstalar-o-sistema/
                
            ;;
            
            
            *) 
               echo -e "$1: Opção desconhecida.\n\nUse: $0 --ajuda|--help|-h\n\n"
            
        ;;
                                
    esac



exit 0

