# Problem
The app will be fed with content from The Movie Database (TMDb).
Site: themoviedb.org
Documentation: developers.themoviedb.org

 ![Image of TMDb](/screenshots/sreen1.jpg) 

## To-do
The first release of the app will be very limited in scope, but will serve as the
foundation for future releases. It's expected that user will be able to:

- [x] Scroll through the list of upcoming movies - including movie name, poster or
backdrop image, genre and release date. List should not be limit to show only
the first 20 movies as returned by the API.
**This solution contatains `infinite-scroll` to pagination**

- [X] Select a specific movie to see details (name, poster image, genre, overview
and release date).

- [ ] Search for movies by entering a partial or full movie name.

### Requirements
Ruby 2.5.0
Rails >= 5.1.6

<sub>P.s: This project contains Ruby wrapper for TMDb https://github.com/18Months/themoviedb-api (Don't need to add)</sub>

### How to use
After the install requirements are completed, the next steps are:
- Gems: `bundle install`
- Create ENV: `export TMDB_API_KEY="YOUR_KEY_HERO"`
- Execute server: `rails s`

In browser: `localhost:3000`

### Endpoint
|           | URL               | Description|
| --------- | ----------------- | ---------- |
| GET       | /                 | Show all movies upcoming, by default region: `us`            |
| GET       | /?region=         | Show all movies upcoming, basead in parameter, example: `?region=pt-BR`            |
| GET       | /movies/:id       | Movie ID           |
