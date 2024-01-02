# Typesense Search for Documentation Sites
This article will show you how to use a customized version of DocSearch that works with Typesense. In fact, the search bar you see on Typesense's own documentation site is built with this customized version of DocSearch.

Typesense's customized version of DocSearch is made up of two components:

1. [Typesense-docsearch-scraper](https://github.com/typesense/typesense-docsearch-scraper): A web-scraper that scans your documentation site and indexes the content in Typesense.

2. [Typesense-docsearch.js](https://github.com/typesense/typesense-docsearch.js): A JavaScript library that adds a search bar to your documentation site. When end-users start typing into the search bar, it queries the content index built by the DocSearch scraper.



## 1. Setup DocSearch Scraper
We need to set up the scraper to point to your documentation site. Running the scraper will generate an index for each word on your website, and then upload it to your Typesense server

### DockSearch Scaper Config file
Follow as [Typsense Scraper document](https://typesense.org/docs/guide/docsearch.html#create-a-docsearch-scraper-config-file). I created Scaper `config.json` 

```json
{
    "index_name": "sphinx",
    "start_urls": [
      "https://tradingstrategy.ai/"
    ],
    "sitemap_urls": [
      "https://tradingstrategy.ai/sitemap-docs.xml"
    ],
    "stop_urls": [],
    "selectors": {
      "lvl0": {
        "selector": "",
        "global": true,
        "default_value": "Documentation"
      },
      "lvl1": "article h1",
      "lvl2": "article h2",
      "lvl3": "article h3",
      "lvl4": "article h4",
      "lvl5": "article h5",
      "text": "article p, article li"
    },
    "conversation_id": [
      "1654845501"
    ],
    "nb_hits": 636
}
```

### Run the scaper
1. [Install Docker](https://docs.docker.com/get-docker/)
2. [Install jq](https://jqlang.github.io/jq/download/)
3. [Make sure your Typesense server is operational](https://typesense.org/docs/guide/install-typesense.html#option-1-typesense-cloud)
4. Create a `secrect.env` file with the following contents, replacing them with the correct values for your particular situation:
```
TYPESENSE_API_KEY=xyz
TYPESENSE_HOST=xxx.a1.typesense.net
TYPESENSE_PORT=443
TYPESENSE_PROTOCOL=https
```

5. Run the scraper
```bash
docker run -it   -e --env-file=./secrect.env  -e "CONFIG=$(cat config.json | jq -r tostring)"   typesense/docsearch-scraper:0.9.1
```

## Add a Search Bar to document
Follow as [guide from Typesense docsearch](https://typesense.org/docs/guide/docsearch.html#integrate-with-ci-deploy-it-to-a-server). We create a `searchbox.html` in `_template`

```html
<!-- Somwhere in your doc site's navigation -->
<input type="search" id="searchbar">

<!-- Before the closing head -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/typesense-docsearch.js@1/dist/cdn/docsearch.min.css"
/>

<!-- Before the closing body -->
<script src="https://cdn.jsdelivr.net/npm/typesense-docsearch.js@1/dist/cdn/docsearch.min.js"></script>

<script>
  docsearch({
    inputSelector: '#searchbar',
    typesenseCollectionName: 'sphinx', // Should match the collection name you mention in the docsearch scraper config.js
    typesenseServerConfig: { 
      nodes: [{
        host: 'Typesense_host', // For Typesense Cloud use xxx.a1.typesense.net
        port: '443',      // For Typesense Cloud use 443
        protocol: 'https'   // For Typesense Cloud use https
      }],
      apiKey: 'XYZ', // Use API Key with only Search permissions
    },
  });
</script>
```

### Rebuid docs web
```shell
poetry shell
# This is a very long duration command.
# For the subsequent documenation updates,
# it is enough to run
# make html
make clean-install-and-build-local-docs
```

### Add scraper to Github Action
Before add step to run scraper in Github action. You need add `secrect env`
```
TYPESENSE_API_KEY
TYPESENSE_HOST 
``` 

Add step to run scraper after deploy docs

```yml
      - name: Run Docsearch Scraper
        uses: celsiusnarhwal/typesense-scraper@v2
        with:
          # The secret containing your Typesense API key. Required.
          api-key: ${{ secrets.TYPESENSE_API_KEY }}
          
          # The hostname or IP address of your Typesense server. Required.
          host: ${{ secrets.TYPESENSE_HOST }}
          
          # The port on which your Typesense server is listening. Optional. Default: 8108.
          port: 443
          
          # The protocol to use when connecting to your Typesense server. Optional. Default: http.
          protocol: https
          
          # The path to your DocSearch config file. Optional. Default: docsearch.config.json.
          config: ./scraper/config.json

```