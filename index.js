import { createClient } from '@clickhouse/client'

const client = createClient({
    host: process.env.CLICKHOUSE_HOST ?? 'http://localhost:8123',
    username: process.env.CLICKHOUSE_USER ?? 'default',
    password: process.env.CLICKHOUSE_PASSWORD ?? '',
})

const resultSet = await client.query({
    query: 'SELECT * FROM queue;',
    format: 'JSONEachRow',
  })
  const dataset = await resultSet.json()
