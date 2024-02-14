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



# Clonar partições do HD no Linux


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


clear


verificar(){


# ==========================================================================================

     which yad 1> /dev/null 2> /dev/null

     if [ $? == "0" ] ; then

                echo "Programa Yad localizado..." 
                
	else
	
                echo "Programa Yad não esta instalado." 
                
#---------------------------------------------------#
# Etapa 0 - Tente detectar a versão do sistema....  #
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
/bin/echo -e "\e[1;33m!   Detectando a versão do sistema            # \e[0m"
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
echo

version=$(lsb_release -d | awk -F":" '/Description/ {print $2}') 

if [[ "$version" = *"Slackware"* ]] || [[ "$version" = *"Void Linux"* ]];
then
	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"

# Instale o Yad
xbps-install -Suy yad

else
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
/bin/echo -e "\e[1;31mSeu sistema não está executando o Void Linux.\e[0m"
/bin/echo -e "\e[1;31mO script foi testado apenas no Void Linux...\e[0m"
/bin/echo -e "\e[1;31mO script está saindo...\e[0m"
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo
exit
fi

                
		exit
		
     fi

############################################################################################ 

     which partclone.restore 1> /dev/null 2> /dev/null

     if [ $? == "0" ] ; then

                echo "Programa Partclone localizado..." 
                
	else
	
                echo "Programa Partclone não esta instalado." 

#---------------------------------------------------#
# Etapa 0 - Tente detectar a versão do sistema....  #
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
/bin/echo -e "\e[1;33m!   Detectando a versão do sistema            # \e[0m"
/bin/echo -e "\e[1;33m#---------------------------------------------#\e[0m"
echo

version=$(lsb_release -d | awk -F":" '/Description/ {print $2}') 

if [[ "$version" = *"Slackware"* ]] || [[ "$version" = *"Void Linux"* ]];
then
	echo
/bin/echo -e "\e[1;32m.... Versão:$version\e[0m"
/bin/echo -e "\e[1;32m.... Versão suportada detectada....em andamento\e[0m"

# Instale o Partclone
xbps-install -Suy partclone

else
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
/bin/echo -e "\e[1;31mSeu sistema não está executando o Void Linux.\e[0m"
/bin/echo -e "\e[1;31mO script foi testado apenas no Void Linux...\e[0m"
/bin/echo -e "\e[1;31mO script está saindo...\e[0m"
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo
exit
fi
                
		exit
		
     fi
     

# ==========================================================================================

# Dependencies:

which split
which gparted
which cfdisk
which dmidecode
which lshw
which lspci
which lsblk
which parted
which dd
which sfdisk
which partclone.chkimg
which gpart
which testdisk
which fdisk
which mount
which umount
which date
which ntfs-3g
which setxkbmap
which ntfsfix 
which bc
which sed
which ip
which cut
which sort
which mkdir

which smartctl

which inxi

# O comando gdisk no Linux é similar ao fdisk e permite manipular e criar partições. Ele foi especialmente criado para lidar com partições GPT.
# Este novo esquema de tabela de alocação de partições foi criado para funcionar com os novos firmwares das placas-mãe EFI e UEFI.

which gdisk


 
# TestDisk - Um utilitário que suporta recuperação de partições perdidas em ambos MBR e GPT.

which testdisk

# https://www.cgsecurity.org/index.html?testdisk.html


# gpart - Um utilitário que descobre o conteúdo de uma tabela de partições MBR destruída. Sua utilização está explicada no manual do gpart.

which gpart

# https://github.com/baruch/gpart



# ==========================================================================================

    echo -e "\e[00;31m 
Precauções

    Como o risco de perda de dados não pode ser descartado, é importante antes de iniciar a operação

    fazer backup de dados de dispositivos afetados

    identificar corretamente os volumes ou partições a serem modificadas
   \e[00m"
   
   
# ==========================================================================================


}







# ==========================================================================================

# Verificar Root

# if ! [ $(id -u) = 0 ]; then echo "Por favor, execute este script como SUDO ou ROOT!" ; exit 1 ; fi

# ==========================================================================================

echo
/bin/echo -e "\e[1;36m#----------------------------------------------------#\e[0m"
/bin/echo -e "\e[1;36m#   Script de manutenção de sistema - versão 0.2     #\e[0m"
/bin/echo -e "\e[1;36m#   Escrito por Fernando - Janeiro de 2024           #\e[0m"
/bin/echo -e "\e[1;36m#   https://www.youtube.com/@fernandosuporte/videos  #\e[0m"
/bin/echo -e "\e[1;36m#----------------------------------------------------#\e[0m"
echo


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



echo "
Dispositivo localizados:
"

fdisk -l | grep /dev/sd | grep Disk  | awk '{print $2}'| sort  | cut -d: -f1 
# fdisk -l | grep /dev/sd | grep Disco | awk '{print $2}'| sort  | cut -d: -f1

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT


echo "
Qual o dispositivo que será usado na clonar? Ex: /dev/sda"
read HD

clear

# Verificar se a variavel $HD é nula

[ -z "$HD" ] && { echo "O valor não pode ser nulo... Informe um HD/SSD para ser clonado." ; exit ; }


echo "
"
parted $HD unit MiB print


echo '
Qual a partição do HD/SSD que gostaria de clonar? Ex: '$HD'1'
read ClonarParticao


clear

# Verificar se a variavel $ClonarParticao é nula

[ -z "$ClonarParticao" ] && { echo "O valor não pode ser nulo... Informe uma partição para ser clonada." ; exit ; }



# Certifique-se de que a partição de destino esteja desmontada

clear

umount "$ClonarParticao"  1> /dev/null 2> /dev/null

# Tratamento de erros para o umount

[ $? -eq 0 ] && echo "Partição $ClonarParticao desmontada com sucesso..." ||   { echo -e "\e[00;31mFalha ao desmontar a partição $ClonarParticao \e[00m" ; }


sistema_de_arquivo=$(lsblk -rno FSTYPE $ClonarParticao | head -n 1)



echo "
Onde gostaria que salvar a imagem da partição $ClonarParticao? Ex: /media/backup/clonezilla/Windows_8.1_Pro-$(date +%d-%m-%Y)-img/"
read local_da_imagem_da_particao

# Verificar se a variavel $ClonarParticao é nula

[ -z "$local_da_imagem_da_particao" ] && { echo "O valor não pode ser nulo... Informe um local para salvar a imagem da partição." ; exit ; }


mkdir -p "$local_da_imagem_da_particao"

clear

echo "
Gerando relatórios sobre esse HW...
"
sleep 2

dmidecode > "$local_da_imagem_da_particao"/Info-dmi.txt
lshw      > "$local_da_imagem_da_particao"/Info-lshw.txt

lspci     > "$local_da_imagem_da_particao"/Info-lspci.txt
lspci -n >> "$local_da_imagem_da_particao"/Info-lspci.txt


parted -ls > "$local_da_imagem_da_particao"/sda-pt.parted

# parted -ls > "$local_da_imagem_da_particao"/sda-pt.parted.compact


# OPÇÕEs:

#   -l, --list                      lista modelos de partições em todos os dispositivos de bloco
#   -s, --script                    nunca pede intervenção do usuário



inxi -v7azy > "$local_da_imagem_da_particao"/inxi.txt

# https://forum.manjaro.org/t/very-unstable-system/126455/25





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

dd if=$HD of=$local_da_imagem_da_particao/sda-mbr  bs=512 count=1


echo "
Fazendo backup da tabela de partições...

Sempre tenha backup dos dados num hd externo.
"

nome_da_tabela_de_particao=$(echo "$HD" | cut -d/ -f3)

sfdisk -d $HD > $local_da_imagem_da_particao/$nome_da_tabela_de_particao.sf



   
   elif [ $formato_da_tabela_de_particoes == "gpt" ];
   then
   echo "
   gpt
   " 
   
  else
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo $ClonarParticao possui um formato $formato_da_tabela_de_particoes  não suportado pelo Partclone.
   \e[00m"

sleep 10

exit 

fi



if [ "$sistema_de_arquivo" == "btrfs" ];
   then
   echo "btrfs"

   elif [ $sistema_de_arquivo == "ext2" ];
   then
   echo "ext2"

   elif [ $sistema_de_arquivo == "ext3" ];
   then
   echo "ext3"
   
   elif [ $sistema_de_arquivo == "ext4" ];
   then
   echo "ext4"

# Clonar uma partição para uma imagem

  
# partclone.ext4 -d -c -s /dev/sda1 -o sda1.img

# partclone.ext4 -c -s /dev/sda1 -o ~/image_sda1.pcl

# partclone.ext4 -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda6 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda6.ext4-ptcl-img.gz. 2> /tmp/split_error.myDx3Z

   
# partclone.ext4 -c -s /dev/sda1 | gzip -c > ~/image_sda1.pcl.gz

# Note: For maximum compression use gzip -c9

# https://forum.manjaro.org/t/partclone-how-to-use-compression/53767



   elif [ $sistema_de_arquivo == "hfs+" ];
   then
   echo "hfs+"
   
   elif [ $sistema_de_arquivo == "extfs" ];
   then
   echo "extfs"

   elif [ $sistema_de_arquivo == "exfat" ];
   then
   echo "exfat"
   
   elif [ $sistema_de_arquivo == "f2fs" ];
   then
   echo "f2fs"
   
   elif [ $sistema_de_arquivo == "nilfs2" ];
   then
   echo "nilfs2"            


   elif [ $sistema_de_arquivo == "fat" ];
   then
   echo "fat"

   elif [ $sistema_de_arquivo == "fat12" ];
   then
   echo "fat12"
   
   elif [ $sistema_de_arquivo == "fat16" ];
   then
   echo "fat16"
   
   elif [ $sistema_de_arquivo == "fat32" ];
   then
   echo "fat32"
   
   elif [ $sistema_de_arquivo == "vfat" ];
   then
   echo "vfat"

   elif [ $sistema_de_arquivo == "ntfs" ];
   then
   echo "ntfs"
   
# Clonar uma partição para uma imagem
   
   partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s $ClonarParticao --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - $local_da_imagem_da_particao/$(echo "$ClonarParticao" | cut -d/ -f3).ntfs-ptcl-img.gz. 2>> /tmp/split_error.$(date +%d-%m-%Y)

# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda1 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda1.ntfs-ptcl-img.gz. 2> /tmp/split_error.ZHntnZ
# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda2 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda2.ntfs-ptcl-img.gz. 2> /tmp/split_error.KZnreP
# partclone.ntfs -z 10485760 -N -L /var/log/partclone.log -c -s /dev/sda5 --output - | pigz -c --fast -b 1024 -p 16 | split -b 2000m - /home/partimag/Windows_Pro_8.1-29-10-2018-img/sda5.ntfs-ptcl-img.gz. 2> /tmp/split_error.1WuQgs


# partclone.ntfs -d -c -s /dev/sda2 -o sda2.img

 
    
   elif [ $sistema_de_arquivo == "hfsplus" ];
   then
   echo "hfsplus"
   
   elif [ $sistema_de_arquivo == "hfsp" ];
   then
   echo "hfsp"   
   
   
      
  else
  
   clear
   
   echo -e "\e[00;31m
   O dispositivo $ClonarParticao possui um formato não suportado pelo Partclone.
   \e[00m"

sleep 10

exit 

fi




# Execute uma verificação em uma imagem criada

# partclone.chkimg -s sda2.img


# Obter informações de uma imagem
	
# partclone.info -s sda2.img



# Uso do Partclone:
#
# -c , --clone =>  Salve a partição no formato de imagem especial.
# -s  ARQUIVO  =>  Arquivo fonte. O ARQUIVO pode ser um arquivo de imagem (feito por partclone) ou dispositivo dependendo de sua ação. Normalmente, a fonte de backup é o dispositivo, a fonte de restauração é o arquivo de imagem.
# -o  ARQUIVO  =>  Arquivo de saída. O ARQUIVO pode ser um arquivo de imagem (o partclone irá gerar) ou depende do dispositivo em sua ação. Normalmente, faça backup da saída para um arquivo de imagem e restaure a saída para o dispositivo.
# -d nível     =>  Defina o nível de depuração [1|2|3]


   

echo  "
Copiando o arquivo de log gerado para a pasta $local_da_imagem_da_particao
"

cp /var/log/partclone.log $local_da_imagem_da_particao/
             
          
            ;;
            
        --restaurar|-r)
          echo "Restaurar uma imagem para o HD"
          




# Quantas imagens de HD podemos restaurar por diaria de trabalho?

# 1 imagem leva 20 minutos para restaurar (teoria)
# 8 horas (diaria de trabalho)
# Considerando que 60 minutos é equivalente a 1 hora

# 60/20=3 imagens em 1 hora => 3*8 = 24 imagens  restaurada de HD por diaria de trabalho.

# https://brasilescola.uol.com.br/matematica/como-transformar-minutos-em-horas.htm



# Script testado em máquina virtual criada pelo programa VirtualBox na versão 7.0.12 r159484:
#
# ISO => Windows 10 Pro - versão 10.0 (Compilação 10240) - realizada uma instalação somente do sistema sem instalação de drivers ou programas básicos.




# Para descobrir qual versão do Windows seu dispositivo está executando, pressione a tecla 
# do logotipo do Windows + R, digite winver no campo Abrir e selecione OK.

# https://support.microsoft.com/pt-br/windows/qual-vers%C3%A3o-do-sistema-operacional-microsoft-windows-estou-usando-628bec99-476a-2c13-5296-9dd081cdd808



# https://martins2010.wordpress.com/category/informatica/linux-informatica/
# https://franklyn-sanc.medium.com/introdu%C3%A7%C3%A3o-ao-shell-script-automatizando-tarefas-c891075d2c00
# https://forums.gentoo.org/viewtopic-t-543350-start-0.html


clear

# Chamar a função verificar

verificar


# ----------------------------------------------------------------------------------------

# Idioma do sistema

locale -a


if [ $LANG == "pt_BR.UTF-8" ]; then

echo "
Idioma do sistema: $LANG
"

echo "
Dispositivos localizados:
"
dispositivos_localizados=$(fdisk -l | grep /dev/sd | grep Disco | awk '{print $2}' | sort  | cut -d: -f1)


elif [ $LANG == "en_US.UTF-8" ];then

echo "
System language: $LANG
"
  
echo "
Devices located:
"  
dispositivos_localizados=$(fdisk -l | grep /dev/sd | grep Disk  | awk '{print $2}' | sort  | cut -d: -f1)
   
else

echo "
Sem suporte ao idioma: $LANG
"

exit

fi

# ----------------------------------------------------------------------------------------


# Problema com acentos?  Resolve o problema na sessão até novo desligamento.

# Configurar o layout do teclado para BR

# setxkbmap br

# https://ubuntuforum-br.org/index.php?topic=119923.0

# ----------------------------------------------------------------------------------------




echo $dispositivos_localizados

 
echo "
"

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT

exit

echo "
Qual o dispositivo que será usado na restauração da imagem? Ex: /dev/sda"
read HD


clear

# Verificar se a variavel $HD é nula

[ -z "$HD" ] && { echo "O valor não pode ser nulo... Informe um HD/SSD." ; exit ; }


clear

echo "
Tem certeza de quer APAGAR DEFINITIVAMENTE todos os DADOS do $HD..."
read resp

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


echo "Local: $local_da_imagem_da_particao"

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

umount /dev/$dispositivo

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
Ex: /mnt/ " ponto_de_montagem

mount /dev/$dispositivo  $ponto_de_montagem

if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)

echo "Local: $local_da_imagem_da_particao"

echo "
Conteudo da pasta:
"
ls -1 $local_da_imagem_da_particao

break

else

echo "
Ocorreu problema ao montar o dispositivo /dev/$dispositivo em $ponto_de_montagem
"

exit 
 
fi


sleep 5s
echo "================================================"
;;



3) # Compartilhamento SAMBA (com ou sem senha)  - rede

echo "Compartilhamento SAMBA..."

# Como montar pastas de rede compartilhadas no Linux


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
Ex: /mnt/ " ponto_de_montagem


# Verificar se a variavel $ponto_de_montagem é nula

[ -z "$ponto_de_montagem" ] && { echo "O valor não pode ser nulo... Informe um ponto de montagem para o compartilhamento //$ip/$compartilhamento" ; exit ; }


umount "$ponto_de_montagem"


# Compartilhamento SAMBA com senha

mount -t cifs "$ip"/"$compartilhamento" "$ponto_de_montagem" -o user=$nome_do_usuario, password=$senha 

if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)

echo "Local: $local_da_imagem_da_particao"

echo "
Conteudo da pasta:
"
ls -1 $local_da_imagem_da_particao

break

else

echo "
Ocorreu problema ao montar o compartilhamento //$ip/$compartilhamento em $ponto_de_montagem
"

sleep 30
exit
 
fi

# https://rafaelit.com.br/como-montar-pastas-compartilhadas-linux-windows/



echo "================================================"
;;
4) # Compartilhamento NFS (Network File System) - rede

# Montando e conectando em um servidor NFS

echo "Compartilhamento NFS..."


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
Ex: /mnt/ " ponto_de_montagem


# Verificar se a variavel $ponto_de_montagem é nula

[ -z "$ponto_de_montagem" ] && { echo "O valor não pode ser nulo... Informe um ponto de montagem para o compartilhamento //$ip/$compartilhamento" ; exit ; }

umount "$ponto_de_montagem"

clear

mount -t nfs "$ip":"$compartilhamento" "$ponto_de_montagem"

if [ $? -eq 0 ]; then
 
local_da_imagem_da_particao=$(echo $ponto_de_montagem)

echo "Local: $local_da_imagem_da_particao"

echo "
Conteudo da pasta:
"
ls -1 $local_da_imagem_da_particao

break

else

echo "
Ocorreu problema ao montar o compartilhamento NFS (Network File System) $ip:$compartilhamento em $ponto_de_montagem
"

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


# https://www.vivaolinux.com.br/dica/Montando-e-conectando-em-um-servidor-NFS
# https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04-pt


sleep 5s
echo "================================================"
;;

5)
echo "Saindo..."
sleep 5s
clear
exit 0
;;
*) echo "Opção inválida!"
esac
done


echo "Continuando...."

sleep 2

# https://www.vivaolinux.com.br/script/Menu-em-Shell-Script

clear


# ----------------------------------------------------------------------------------------



echo "Recuperando a tabela de partições..."

sfdisk –force $HD < "$local_da_imagem_da_particao"/sda.sf



echo "Restaurar o MBR..."

# Na hora de restaurar os backups, basta acessar a pasta onde estão os arquivos e inverter os comandos, para que eles sejam restaurados:

dd if="$local_da_imagem_da_particao"/sda-mbr of=$HD bs=512 count=1




# Criar um menu com laço while com base nos arquivos .gz na pasta


echo "Restaurar imagem usando o partclone (split, gzip) com fonte stdin"


# cat "$local_da_imagem_da_particao"/sda1.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s - -o "$HD"1
# cat "$local_da_imagem_da_particao"/sda2.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s - -o "$HD"2

# O partclone fica com tela preta e não com tela azul.  Solução: usar a opção -N depois de partclone.ntfs



# ----------------------------------------------------------------------------------------

clear

# array=($(pwd)/pdf/*.gz)

array=("$local_da_imagem_da_particao"/*.gz)

itens=$(ls -1 "$local_da_imagem_da_particao"/*.gz | wc -l)


# Laço while para exibir o menu e tratar a escolha do usuário

while true; do



for((i = 0; i < $itens; i++))
do
      echo "[$i] `basename ${array[$i]}`"
done


# Solicitar a opção do usuário

echo "Digite o número da opção desejada (100 para sair): " 
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

Localização:               $local_da_imagem_da_particao
Nome do arquivo:           $imagem
Sistema de arquivo:        $sistema_de_arquivo
Partição a ser restaurada: $HD$numero_da_particao
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
    echo "O tamanho do dispositivo de armazenamento de destino não pode ser menor do que o tamanho do dispositivo de armazenamento de origem."
    exit
fi


# https://www.vivaolinux.com.br/dica/Retornar-o-tamanho-de-arquivo-ou-diretorio-em-bytes-(KB-MB)
# https://solitudelab.wordpress.com/2017/12/21/shell-script-operadores-de-comparacao-e-entrada-de-dados/



cat "$local_da_imagem_da_particao"/$imagem.a* | gunzip -c | partclone.$sistema_de_arquivo -N -d -r -s - -o "$HD"$numero_da_particao


# https://www.vivaolinux.com.br/topico/Shell-Script/Executar-script-com-argumento-sim-ou-nao
# http://blog.evaldojunior.com.br/aulas/blog/shell%20script/2011/05/08/shell-script-parte-2-controle-de-fluxo.html
# https://pt.stackoverflow.com/questions/311679/como-comparar-o-valor-de-uma-vari%C3%A1vel-com-uma-string-no-shell-script
# https://www.campuscode.com.br/conteudos/shell-script-basico-de-controle-de-fluxo
                  
                  
                  
	 else
		echo "Você escolhe $opcao. Adeus!"
		break
	fi



done

# Usar o loop while no lugar do for.

# ----------------------------------------------------------------------------------------
          
          
            ;; 
            
        --ajuda|--help|-h)
        
          echo "
                Use: $0 --clonar|-c           para clonar HD;
                Use: $0 --restaurar|-r        para restaurar uma imagem do sistema para o HD;
                Use: $0 --ajuda|--help|-h     mostra essa tela.                    
                "
echo "
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


O comando funciona apenas na partição desmontada. a partir do windows 8, a configuração de inicialização rápida deve ser desativada, 
caso contrário hd não é montado em modo de escrita o que bloqueia qualquer função de reparo. se tudo der certo aparecera 
isso no console:

# ntfsfix /dev/sda6
Mounting volume... OK
Processing of $MFT and $MFTMirr completed successfully.
Checking the alternate boot sector... OK
NTFS volume version is 3.1.
NTFS partition /dev/sda6 was processed successfully.



Hiren's Boot  (versão live do windows)


cmd

chkdsk d: /f


"
                
            ;;
            
            *) 
               echo -e "$1: Opção desconhecida.\n\nUse: $0 --ajuda|--help|-h\n\n"
            
        ;;
                                
    esac



