# FileDB

Le but de ce kata est de créer une base de données simplifiée reposant sur des fichiers JSON.
Ce projet peut servir de première étape pour le kata [file-to-api]

[file-to-api]: https://github.com/ParisRubyWorkshop/file-to-api-kata

```rb
require 'lib/file_db'

db = FileDb::Database.new("fixtures/data.json")

movies = db.table("movies")
# => FileDb::Table

movies.select
# => [{ ... },{ ... }, ...] # tous les movies

movies.select(where: { id: 1 })
# => [{ id: 1, title: "The Gold Rush", year:1925, director_id:1 }]

movies.select(where: { director_id: 1 })
# => [{ id: 1, ..., director_id: 1 }, { id: 2, ..., director_id: 1 }, { id: 4, ..., director_id: 1 }, ]

table.insert({ title: "Birds", year: 1962, director_id: 2 })
# incrémenter id => 7

table.update(where: { id: 7 }, values: { year: 1963 })

table.delete(where: { id: 7 })
```

- ajouter la persistance
- méthode `.where`
