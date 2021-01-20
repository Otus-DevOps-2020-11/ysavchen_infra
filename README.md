# ysavchen_infra
ysavchen Infra repository

# Домашнее задание №3 (Знакомство с облачной инфраструктурой и облачными сервисами)
bastion_IP = 84.201.156.94
someinternalhost_IP = 10.130.0.8

Подключение в одну команду к someinternalhost через bastion:
ssh -i ~/.ssh/appuser -J appuser@<bastion-ip> appuser@<someinternalhost-ip>

Подключение из консоли при помощи одной команды:
1. Добавить ~/.ssh/config
Host bastion
   HostName 84.201.156.94
   User appuser
   IdentityFile ~/.ssh/appuser

Host someinternalhost
   HostName 10.130.0.8
   ProxyJump appuser@84.201.156.94
   User appuser
   IdentityFile ~/.ssh/appuser

4. Подключение:
   ssh bastion
   ssh someinternalhost
