# ysavchen_infra
ysavchen Infra repository

### Домашнее задание №3
bastion_IP = 84.201.156.94<br/>
someinternalhost_IP = 10.130.0.8

Подключение в одну команду к someinternalhost через bastion:<br/>
ssh -i ~/.ssh/appuser -J appuser@84.201.156.94 appuser@10.130.0.8

Подключение из консоли при помощи одной команды:<br/>
1. Добавить ~/.ssh/config
```
Host bastion
   HostName 84.201.156.94
   User appuser
   IdentityFile ~/.ssh/appuser

Host someinternalhost
   HostName 10.130.0.8
   ProxyJump appuser@84.201.156.94
   User appuser
   IdentityFile ~/.ssh/appuser
```

2. Подключение:
```
ssh bastion
ssh someinternalhost
```
