#!/bin/bash

#            ---------------------------------------------------
#                              Emirx-adbtool-yükleyici                                                  
#            ---------------------------------------------------
#                Copyright (C) <2019-2020>  <Entynetproject>
#
#        Bu program özgür yazılımdır: siz bu yazılımı özgürce yeniden dağıtabilir ve/veya değiştirebilirsiniz.
#        GNU Genel Kamu Lisansı'nın 3. sürümüne veya daha sonra çıkan herhangi bir sürümüne göre.
#
#        Bu program, faydalı olacağı umuduyla dağıtılmaktadır,
#        ancak HİÇBİR GARANTİ VERİLMEZ; özellikle SATILABİLİRLİK ve BELİRLİ BİR AMACA UYGUNLUK GARANTİSİ YOKTUR.
#        Daha fazla bilgi için GNU Genel Kamu Lisansı'na bakınız.
#
#        Bu programla birlikte GNU Genel Kamu Lisansı'nı almanız gerekirdi. Eğer almadıysanız, <http://www.gnu.org/licenses/> adresine bakınız.

RS="\033[0;31m"  # Kırmızı renk
YS="\033[1;33m"  # Sarı renk
CE="\033[0m"     # Renk sıfırlama

printf '\033]2;install.sh\a'

# Mavi renk tanımlaması
BS="\033[1;34m"
# Renk sıfırlama
CE="\033[0m"
C="\033[0m"
# Kırmızı renk tanımlaması
RS="\033[0;31m"
# Yeşil renk tanımlaması
GN="\033[0;32m"
# Beyaz renk tanımlaması
WHS="\033[0m"

# Root kullanıcısı olup olmadığınızı kontrol et
if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e ""$GN"["$RS"+"$GN"]"$CE" Bu script root olarak çalıştırılmalıdır!"$C"" 1>&2
   sleep 1
   exit
fi

# Eğer ~/ghost dizini yoksa, git ile klonla
if [[ -d ~/ghost ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/FazalMahmood/ghost.git
} &> /dev/null
fi

# Yükleme işlemini başlat
sleep 0.5
clear
sleep 0.5
cd ~/ghost
echo
cat banner/banner.txt
echo

sleep 1
echo -e ""$GN"["$RS"+"$GN"]"$CE" Bağımlılıklar kuruluyor..."$C""
sleep 1

# Gerekli paketlerin yüklenmesi
{
pkg update
pkg -y install git
pkg -y install python
pkg -y install android-tools
apt-get update
apt-get -y install git
apt-get -y install python3
apt-get -y install adb
apk update
apk add git
apk add python3
apk add android-tools
pacman -Sy
pacman -S --noconfirm git
pacman -S --noconfirm python3
pacman -S --noconfirm android-tools
zypper refresh
zypper install -y git
zypper install -y python3
zypper install -y android-tools
yum -y install git
yum -y install python3
yum -y install android-tools
dnf -y install git
dnf -y install python3
dnf -y install android-tools
eopkg update-repo
eopkg -y install git
eopkg -y install python3
eopkg -y install android-tools
xbps-install -S
xbps-install -y git
xbps-install -y python3
xbps-install -y android-tools
} &> /dev/null

#  emirx dosyalarını kopyala ve çalıştırılabilir hale getir
{
cd ~/ghost/bin
cp ghost /usr/local/bin
chmod +x /usr/local/bin/ghost
cp ghost /bin
chmod +x /bin/ghost
cp ghost /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/ghost
} &> /dev/null

# Yükleme işlemi tamamlandı
sleep 1
echo -e ""$GN"["$RS"+"$GN"]"$CE" Başarıyla kuruldu!"$C""
sleep 1
