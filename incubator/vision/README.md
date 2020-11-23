# INITEQ Vision - an observability system

![vision_small.jpg](./vision_small.jpg)

```
htpasswd -c ./auth admin;
```

```
k create secret generic vision-basic-auth --from-file=auth
rm auth
```

To deploy run:

```
helm upgrade --install initeq-vision initeq-incubator/vision --version 0.1.0 --values=/patht/to/values_and_secrets.yaml --namespace=vision
```
