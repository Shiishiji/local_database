# Local database with Docker and Docker stack

## Currently supports
* (pg) postgres + adminer



## How to use

#### 1. Set your node as swarm manager
```shell
make init
```

#### 2. Run local instance of postgres
```shell
make pg
```

#### 3. Get your swarm ip address
```shell
make ip
```