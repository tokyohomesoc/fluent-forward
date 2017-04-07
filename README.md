# nginx LTSV Format fleunt-forward docker image

# docker-compose.yml

```yaml
version: '2'
services:

  fluent-forward:
    image: tokyohomesoc/fluent-forward
    container_name: fluent-forward
    restart: always
    ports:
      - "24224:24224"
    environment:
      IDCF_ACCESS_KEY: "xx-xxxxxxxxxxxxxxxxx"
      IDCF_SECRET_KEY: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      IDCF_BUCKET_NAME: "xxxxxxxxxxxx"
      SLACK_FLUENT_WEBHOOK_URL: "https://hooks.slack.com/services/xxxxxxxxxx/xxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxx"
      SLACK_FLUENT_CHANNEL: "foxboxsnet"
```