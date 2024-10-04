Features :

      * Search Movies: Users can search for movies by entering a query in the search bar, and results are fetched dynamically from the OMDb API.
      * Movie List: Displays a list of movies fetched from the OMDb API based on the search query.
      * Movie Details: Users can click on any movie in the list to view its detailed information, including the poster, release year, genre, ratings, and plot.
      * Error Handling: Displays error messages when movie data fails to load or there is an issue with network connectivity.
      * Loading Indicators: Shows a loading spinner while data is being fetched.
      * State Management: GetX is used to manage the state of the movie list and movie details.
      * API Service: All data is fetched from the OMDb API using an HTTP service.
      * Smooth Grid UI: Displays movie posters in a smooth, rounded grid format.
      * Back Navigation: Properly handles back navigation with custom error handling.

API Used
    The app uses the OMDb API to fetch movie data. You need to get an API key from OMDb API.
      
      * API used for movie search:
      http://www.omdbapi.com/?s=[query]&apikey=[your_api_key]
      
      API used for movie details:
      http://www.omdbapi.com/?i=[imdbID]&apikey=[your_api_key]

Dependencies

      Flutter: 3.24.2
      Dart: 3.5.2
      GetX: State management library
      http: For making API requests to OMDb

