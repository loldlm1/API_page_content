# Page Content API 

This is an experimental APP that allow us to get the html tags h1, h2, h3 and links from a web page by an API.

## Setup

To run the project correctly you need to install Rails 5.1.5 version, PostgreSQL 9.4 and Ruby ~= 2.3.3. You also need a few environment variables. I tend to use [direnv](https://direnv.net/) to manage environment variables; you can see the variables we require below, in an example .envrc file:

```
# PG
export PGUSER=db_user
export PGPASSWORD=db_pass
```

After install the previous dependencies, clone the project and follow the next steps to get ready:

```bash
bundle install
cp config/database.yml.example config/database.yml
rake db:setup
rspec spec
```

If everything is ok, then the project is ready. You can run the server doing:

```bash
rails s
```

### API Documentation

There's two Endpoint to use the API:
- 1) Given a valid URL it will parse the web content to get the h1, h2, h3 and links tags and saving it to the database, example:

```bash
# the endpoint route is a POST to localhost:3000/api/v1/pages
# It receives a Json with an url parameter
curl -H "Content-Type: application/json" -X POST -d '{"url":"google.com"}' http://localhost:3000/api/v1/pages
```

It returns an array with the Json content like it:

```json
[
    {
        "url": "google.com",
        "content": {
            "h1": [],
            "h2": [],
            "h3": [],
            "a": [
                "Imágenes",
                "Maps",
                "_comment": "Etc..."
            ]
        }
    }
]
```

- 2) Getting all the pages previously stored in the database, example:

```bash
# the endpoint route is a GET to localhost:3000/api/v1/pages
curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/v1/pages
```

It returns an array with the Json content like it:

```json
[
    {
        "url": "google.com",
        "content": {
            "a": [
                "Imágenes",
                "Maps",
                "_comment": "Etc..."
            ],
            "h1": [],
            "h2": [],
            "h3": []
        }
    },
    {
        "url": "facebook.com",
        "content": {
            "a": [
                "Secciones de esta página",
                "Ayuda sobre accesibilidad",
                "_comment": "Etc..."
            ],
            "h1": [
                "Facebook"
            ],
            "h2": [
                "JavaScript está desactivado en tu navegador.",
                "Control de seguridad"
            ],
            "h3": []
        }
    }
]
```
This is everything that the API can do until now.
