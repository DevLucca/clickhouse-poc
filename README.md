# How to

## Pre-reqs
- Docker Compose
- Kafka Cat (kcat)
- Clickhouse
- NodeJS


First
``` bash
docker-compose up -d --build
```
This should export the ports needed to connect to `kcat`

Using `kcat` we are gonna produce some data on the topic so we can see it on the other side.

``` bash
cat github_all_columns.ndjson | kcat -b localhost:29092 -t github
```

for some reason you can connect to kafka, to clickhouse, but the integration between them, doesn't.

for more info, check this [link](https://clickhouse.com/docs/en/integrations/kafka)
