#!/usr/bin/env bash

exec psql -c 'CREATE EXTENSION pg_similarity;' -U postgres
