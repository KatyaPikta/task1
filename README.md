Подготовка сервера:
Дла запуска плэйбука нужен сервер с установленной системой Ubuntu, 
на которой должен быть создан пользователь devops с правами sudo,
и для него настроен удаленный вход на сервер только по ssh-ключу.

Структура роли:

roles/
└── task1_role/
    ├── defaults/
    │   └── main.yml
    ├── files/
    │   ├── backup_db.sh
    │   ├── check_services.sh
    │   └── collect-metrics.sh
    ├── handlers/
    │   └── main.yml
    ├── tasks/
    │   ├── main.yml
    │   ├── docker.yml
    │   └── traditional.yml
    ├── templates/
    │   ├── 10-flask-auth.conf.j2
    │   ├── docker-compose.yml.j2
    │   ├── flask-auth.j2
    │   ├── flask-auth.service.j2
    │   ├── nginx-app.conf.j2
    │   └── nginx-docker.conf.j2
    └── vars/
       └── main.yml


    Плэйбук можно запускать в двух режимах:

    1.     ansible-playbook -i inventory.ini task1.yml -e "deployment_mode=traditional"
        Если без  параметров или с параметром deployment_mode=traditional - плэйбук выполняется на одном хосте(веб-сервер + приложение работают на одном хосте)
    
    2.  ansible-playbook -i inventory.ini task1.yml -e "deployment_mode=docker"
        В этом случае приложение разворачивается на хосте, а веб-сервер в контейнере


        Проверить работоспособность приложения можно со своего ПК, предварительно прописать в hosts "ip-адрес_хоста  test.local". 
        После этого прописать в веб-браузере test.local. Должна появиться форма для авторизации. 

