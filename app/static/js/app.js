document.addEventListener('DOMContentLoaded', function() {
  // Get the form element
  const searchForm = document.getElementById('search_form');

  // Add an event listener for form submission
  searchForm.addEventListener('submit', function(event) {
      // Prevent the default form submission behavior
      event.preventDefault();

      // Get the value of the search input
      const searchInput = document.getElementById('search_input').value;
      if (searchInput != null && searchInput != '') {
        // Redirect to the search results page with the search query as a parameter
        window.location.href = `/search-results.html?q=${encodeURIComponent(searchInput)}`;
      }

  });
});