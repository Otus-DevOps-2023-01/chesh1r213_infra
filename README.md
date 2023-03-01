# chesh1r213_infra
chesh1r213 Infra repository

testapp_IP = 130.193.36.147
testapp_port = 9292


bastion_IP = 158.160.51.249
someinternalhost_IP = 10.128.0.15


Самостоятельное задание
ssh -J appuser@158.160.51.249 10.128.0.15 (ProxyJump)
 
 
алиасы (дополнительное) 
nano ~/.ssh/config
Прописываем в файле данные конфигурации

Host someinternalhost
  HostName 10.128.0.15
  User appuser
  IdentityFile ~/.ssh/appuser
  ProxyJump appuser@158.160.51.249
  
теперь вызывая коменду
ssh someinternalhost
мы подключаемся к someinternalhost



