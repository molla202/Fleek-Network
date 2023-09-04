#!/bin/bash

# Ana Başlık
function show_title {
    echo -e "\n============================================="
    echo -e "\t\tFleek Network Kurulum Scripti"
    echo -e "=============================================\n"
}

show_title

{
    # Sistem Gereksinimleri
    echo "💻 Sistem Gereksinimleri"
    echo "Bileşenler   Minimum Gereksinimler"
    echo "✔️ CPU        4"
    echo "✔️ RAM        8 GB"
    echo "✔️ Depolama   ~GB SSD"

    # Sistemi Güncelleme
    echo -e "\n🏠 Sistemi Güncelleme"
    sudo apt update
    sudo apt upgrade -y

    # Uyarı
    echo -e "\n⚠️ Ekranda enter diyerek geçmeniz veya Y+enter demeniz gerekir"

    # Gerekli Paketler
    echo -e "\n🤖 Gerekli Paketler"
    sudo apt install screen curl tar wget jq build-essential make clang pkg-config libssl-dev cmake gcc -y

    # Rustup Kurulumu
    echo -e "\n🤖 Rustup Kurulumu"
    echo "Not: 1 seçeneğini seçmelisiniz. Daha önce kuruluysa kurmanıza gerek yok."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source ~/.profile
    source ~/.cargo/env

    # Protobuf ve sccache Kurulumu
    echo -e "\n🤖 Protobuf ve sccache Kurulumu"
    cargo install sccache
    sudo apt-get install protobuf-compiler -y

    # Docker Kurulumu (Opsiyonel)
    echo -e "\n🤖 Docker Kurulumu (Opsiyonel)"
    echo "Docker kurulumu gerekiyorsa bu adımı takip edin, aksi takdirde atlayabilirsiniz."
    sudo apt-get update
    sudo apt install jq git apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

    # fleek-network/lightning.git 'i klonluyoruz.
    echo -e "\n👷 fleek-network/lightning.git 'i klonluyoruz."
    echo "Not: make install komutu uzun sürebilir."
    cd $HOME
    git clone https://github.com/fleek-network/lightning.git
    cd lightning
    make install
    echo "Daha sonra sürümünü kontrol edin:"
    lightning --version
    echo "version: lightning 0.1.0✅"

    # Node'u Screen'de Çalıştırma
    echo -e "\n🚀 Node'u Screen'de Çalıştırma"
    echo "screen -S light"
    echo "cd $HOME/lightning"
    echo "lightning"
    echo "Loglar akıyorsa her şey yolundadır."
    echo "Loglar aktıktan sonra CTRL + A + D ile çıkın."
    echo "Screen'e tekrar girmek için:"
    echo "screen -ar light"
    echo "Screen Açılınca ekran kaybolacak.son kısıma github'dan bakın"
} &> /dev/null
