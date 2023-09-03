
<div align="center">
  <h1>Fleek-Network </h1>
</div>

![dftgz](https://github.com/molla202/Fleek-Network/assets/91562185/dbd389fa-5c62-4d0b-bce8-fd61daa90582)




* [Topluluk kanalımız](https://t.me/corenodechat)<br>
* [Topluluk Twitter](https://twitter.com/corenodeHQ)<br>



 ## Sistem Gereksinimleri
| Bileşenler | Minimum Gereksinimler | 
| ------------ | ------------ |
| CPU |	4 |
| RAM	| 8 GB |
| Storage	| 250 GB SSD |


### Update edelim
```bash
sudo apt update; sudo apt upgrade 
```
### Gerekli olanlar
```
sudo apt install screen curl tar wget jq build-essential make clang pkg-config libssl-dev cmake gcc
```
```
sudo apt-get install protobuf-compiler
```
### Rustup kuruyoruz
📡Not: 1 seçeceksiniz. daha önce kuruluysa kurmanıza gerek yok.
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
source ~/.profile
source ~/.cargo/env
```
### Docker kurulumu (gerekli değil kurmayın )
```bash
sudo apt-get update && sudo apt install jq git && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt-get install docker-compose-plugin 
```
### `fleek-network/lightning.git` 'i klonluyoruz.
```
cd $HOME 
git clone https://github.com/fleek-network/lightning.git
cd lightning
```
```
make install
```
* `make install` uzun sürer.
* daha sonra version kontrol edin: `lightning --version`
* version: `lightning 0.1.0`
### Screen'de node'u çalıştıralım.
```
screen -S light
```
```
cd $HOME
cd lightning 
lightning
```
* Loglar akıyorsa sorun yok.
* Loglar aktıktan sonra CTRL + A + D ile çıkın.
* Screen'e Tekrar Girmek için
```
screen -ar light
```
