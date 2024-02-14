# Script usado no sysresccd para clonar e restaurar imagem de sistema (Windows 10 Pro).

## Informações: <br>

```sh
$ chmod +x teste.sh
$ ./teste.sh -h
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
 
## ISO do Linux em modo live usando o script: <br>
![](https://github.com/tuxslack/teste/blob/slackware/VirtualBox_windows%2010%20pro_13_02_2024_04_35_44.png)

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

