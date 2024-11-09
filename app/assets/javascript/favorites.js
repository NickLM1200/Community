document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form"); // Adjust the form selector as needed
  
    // Handle successful AJAX form submission
    form.addEventListener("ajax:success", function (event) {
      const [data, status, xhr] = event.detail;
      // Redirect to the favorites path after a successful save
      window.location.href = data.redirect_url;  // Pass the URL in the response
    });
  
    // Handle failed AJAX form submission
    form.addEventListener("ajax:error", function () {
      alert("Unable to add to favorites.");
    });
  });
  