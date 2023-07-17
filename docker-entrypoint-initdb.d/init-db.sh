#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
    CREATE TABLE IF NOT EXISTS kafka_queue (
        timestamp UInt64,
        level String,
        message String
    ) ENGINE = Kafka('kakfa:29092', 'queue', 'clickhouse', 'JSONEachRow');

    CREATE TABLE IF NOT EXISTS queue (
        timestamp UInt64,
        level String,
        message String
    ) ENGINE = MergeTree ORDER BY (level);

    CREATE MATERIALIZED VIEW IF NOT EXISTS mv_queue TO queue AS
    SELECT *
    FROM kafka_queue;
EOSQL
