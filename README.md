# Script usado no sysresccd para clonar e restaurar imagem de sistema (Windows 10 Pro).

## Informações: <br>  <br>

Instale o Git se ele não estiver instalado no sistema.       <br>
Clone este repositório ou baixe e descompacte o arquivo zip. <br> <br>


```sh
$ git clone https://github.com/tuxslack/teste/teste.git

```
<br>
<br>

Uso:  <br>

```sh
$ chmod +x teste.sh
$ ./teste.sh -h
```
 <br> ou  <br> <br>
Instalação: <br>

```sh
# mv -i ~/Downloads/teste.sh  /usr/local/bin/
# chmod +x /usr/local/bin/teste.sh
# teste.sh -h ou teste.sh --gui
```

> [!CAUTION]
> **Obs:** Use esse script com cautela. <br> <br>
>  O uso inadequado ou a inserção de valores incorretos podem apagar, destruir ou substituir os dados no disco rígido. <br> <br>

> [!NOTE]
> ## Dependências: <br>
>
> * partclone >= 0.2.77
> * dd
> * sfdisk
> * gdisk (Pacote gptfdisk no Void Linux)
> * gunzip
> * cat
> * dmidecode
> * lshw
> * parted
> * gparted ou cfdisk
> * mount
> * ntfs-3g
> * ntfsfix
> * sed
> * bc
> * smartctl
> * inxi
> * lsblk
> * lspci
> * split
> * cut
> * sort
> * fdisk
> * umount
> * date
> * mkdir
> * pv       (Para o comando dd mostrar uma barra de progresso no terminal)
 
## ISO do Linux em modo live usando o script: <br>
![](https://github.com/tuxslack/teste/blob/slackware/VirtualBox_windows%2010%20pro_13_02_2024_04_35_44.png)

[Download do SystemRescue](https://www.system-rescue.org/Download/)

<br>
<br>

## Gerando uma imagem do sistema: <br>
![](https://github.com/tuxslack/teste/blob/slackware/VirtualBox_windows%2010%20pro_12_02_2024_20_08_21.png)

## Arquivos gerados: <br>
![](https://github.com/tuxslack/teste/blob/slackware/voltar.png)

## Restaurando imagem: <br>
![](https://github.com/tuxslack/teste/blob/slackware/VirtualBox_windows%2010%20pro_12_02_2024_21_01_37.png)

## Imagem clonada e restaura do Windows 10: <br>
![](https://github.com/tuxslack/teste/blob/slackware/VirtualBox_windows%2010%20pro_13_02_2024_04_16_29.png)

<br>
<br>
<br>
<br>
<br>

## Tabela onde o scritp funcionou:
<br>

| Sistema     | Versão | Testado em: |
| ---      | ---       | ---       |
| Windows 10 Pro 64 bit | 10.0 - compilação 10240         | Máquina virtual usando o programa VirtualBox |
|      |         |        |

