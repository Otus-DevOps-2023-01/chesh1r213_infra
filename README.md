# chesh1r213_infra
chesh1r213 Infra repository


testapp_IP = 130.193.36.147
testapp_port = 9292
В рамках ДЗ разобрался с Packer ,нашел ошибку в шаблоне ubuntu16.json там нет ключ/значение zone и subnet_id
Затем дополнил provisners ключ значением pause_before тем самым убрал ошибку при сборке образа т.к. dpkg ругается, что занят другим процессом.
при сборке использовал шаблон variables.json 
Здесь я указал шаблон с переменными.
packer build -var-file=variables.json ubuntu16.json 
