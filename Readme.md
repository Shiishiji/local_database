# Local database with Docker and Docker stack

## Currently supports
* (pg) postgres + adminer
* (rabbit) rabbitMQ


## How to use

#### 1. Set your node as swarm manager
```shell
make init
```

#### 2. Get your swarm ip address
```shell
make ip
```

#### 3. Run local instance of postgres
```shell
make pg
```

#### 3a. Inspect postgres service
```shell
make pg-inspect
```

#### 4. Run local instance of rabbitMQ
```shell
make rabbit
```

#### 4a. Inspect rabbitMQ service
```shell
make rabbit-inspect
```

## Services management 

#### 1. To list swarm services use
```shell
make services
```

#### 2. To leave swarm use
```shell
make leave
```

## Troubleshooting

#### If there are problems creating network for any of services use
```shell
make restart-docker
```