# Typesense Search for Documentation Sites

The docs search bar uses [Typesense DocSearch](https://typesense.org/docs/guide/docsearch.html), made of two components:

1. [typesense-docsearch-scraper](https://github.com/typesense/typesense-docsearch-scraper): crawls the published docs and indexes them into Typesense.
2. [typesense-docsearch.js](https://github.com/typesense/typesense-docsearch.js): the search bar in `source/_templates/sidebar/search.html`.

## Architecture

- Endpoint: `https://docsearch-typesense.tradingstrategy.ai`
- Collection: alias `docs` → `docs_<timestamp>`. The scraper builds a new collection and swaps the alias on every run.
- Scraper config: [config.json](./config.json)

**Docs search runs on its own dedicated Typesense instance. Do not move it onto a Typesense instance shared with other data.**
The scraper key needs `aliases:*`, and Typesense checks only the alias *name* against a key's collection scope,
not the collection the alias points to. On a shared instance the scraper key could be used to reach other collections.

Server-side operations (instance setup, admin key, running the scraper on the server) are documented on the server, not in this public repository.

## API keys

This repository is public. **The only key that may appear here is the public search key.**

| Key | Actions | Collections | Where it is used |
|---|---|---|---|
| Public search key | `documents:search` | `docs` | `source/_templates/sidebar/search.html` |
| Scraper key | `debug:list`, `collections:create`, `collections:delete`, `collections:get`, `documents:*`, `aliases:*` | `docs`, `docs_.*` | GitHub secret `TYPESENSE_API_KEY` only |

`debug:list` is needed because docsearch-scraper 0.12.x reads the server version from `GET /debug` at start-up.

## CI

After publishing the docs, `.github/workflows/build-and-deploy-docs.yml`:

1. Runs the scraper as a pinned image: `typesense/docsearch-scraper:0.12.2@sha256:…`, so no third-party action gets the key.
2. Verifies the index by searching with the public key from `search.html`. The job fails if there are no hits.

Any workflow that publishes the docs site must use the `docs-deploy` concurrency group, so two deploys or scrapes never run at the same time.

GitHub secrets:

```
TYPESENSE_HOST=docsearch-typesense.tradingstrategy.ai
TYPESENSE_API_KEY=<scraper key>
```

A full scraper run takes about 18 minutes.

## Local test

To test against a local Typesense server:

- Start Typesense locally: `docker run -p 8108:8108 typesense/typesense:0.25.2 --data-dir=/tmp --api-key=xyz --enable-cors`
- Put the connection details in `secrect.env` (do not commit real values):

```
TYPESENSE_API_KEY=xyz
TYPESENSE_HOST=host.docker.internal
TYPESENSE_PORT=8108
TYPESENSE_PROTOCOL=http
```

- Run the scraper with the same pinned image as CI:

```shell
docker run --rm --env-file=./secrect.env -e "CONFIG=$(jq -r tostring config.json)" \
  typesense/docsearch-scraper:0.12.2@sha256:b055b935fcdd26347854480db7abae6aa4aae480e009733a2f2f681b3ff3926e
```

- Point `host`, `port`, `protocol` and `apiKey` in `search.html` to the local server and rebuild the docs with `make html`.
