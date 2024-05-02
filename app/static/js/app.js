document.addEventListener("DOMContentLoaded", function () {
  const searchForm = document.getElementById("search_form");
  const mobileSearchForm = document.getElementById("mobile_search_form");

  // Function to handle search submission
  function handleSearchSubmission(event) {
    event.preventDefault();
    const searchInput = event.currentTarget.querySelector("#search_input").value;
    if (searchInput) {
      window.location.href = `/search-results.html?q=${encodeURIComponent(searchInput)}`;
    }
  }

  // Add event listeners for form submissions
  if (searchForm) {
    searchForm.addEventListener("submit", handleSearchSubmission);
  }
  if (mobileSearchForm) {
    mobileSearchForm.addEventListener("submit", handleSearchSubmission);
  }
});


// Search result page filter navigation
// Wait for the DOM to be loaded
document.addEventListener("DOMContentLoaded", function () {
  // Get all the li elements inside the ul with id filter_list
  var filterItems = document.querySelectorAll("#filter_list > li");

  // Add a click event listener to each li
  filterItems.forEach(function (item) {
    item.addEventListener("click", function () {
      // Toggle the 'hidden' class on the corresponding .list-of-filter element
      // We assume that .list-of-filter is a direct child of the li
      var listOfFilter = this.querySelector(".list-of-filter");
      if (listOfFilter) {
        listOfFilter.classList.toggle("hidden");
      }

      // If you want to close any other open filters, you can loop through all of them and hide them
      filterItems.forEach(function (otherItem) {
        if (otherItem !== item) {
          // check if it is not the current item
          var otherListOfFilter = otherItem.querySelector(".list-of-filter");
          if (
            otherListOfFilter &&
            !otherListOfFilter.classList.contains("hidden")
          ) {
            otherListOfFilter.classList.add("hidden");
          }
        }
      });
    });
  });

  var listOfFilterDivs = document.querySelectorAll(".list-of-filter > div");

  listOfFilterDivs.forEach(function (div) {
    div.addEventListener("click", function () {
      // Create a URL object based on the current URL
      let currentUrl = new URL(window.location.href);
      // Create a URLSearchParams object based on the current URL's search parameters
      let searchParams = new URLSearchParams(currentUrl.search);
      
      // Set the 'sort' parameter to the id of the clicked div
      searchParams.set('sort', this.id);
  
      // Update the search property of the URL object with the modified search parameters
      currentUrl.search = searchParams.toString();
  
      // Redirect to the new URL
      window.location.href = currentUrl.toString();
    });
  });
  

  
});


document.addEventListener("DOMContentLoaded", () => {
  const searchIcon = document.getElementById('search_icon');
  const closeMobileSearchButton = document.getElementById('close_mobile_search_button');
  const mobileSearchForm = document.getElementById('mobile_search_form');
  const nav = document.getElementById('nav');

  // Log the button element to the console for debugging
  console.log(closeMobileSearchButton);

  // Toggle the visibility of the mobile search form
  function toggleSearchForm() {
    mobileSearchForm.classList.toggle('hidden');
    nav.classList.toggle('hidden');
  }

  // Add click event listeners to buttons
  closeMobileSearchButton.addEventListener("click", toggleSearchForm);
  searchIcon.addEventListener("click", toggleSearchForm);
});
