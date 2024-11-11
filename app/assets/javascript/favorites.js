document.addEventListener("DOMContentLoaded", function() {
  // Attach event listeners to all favorite buttons
  const favoriteButtons = document.querySelectorAll('.favorite-star');
  
  favoriteButtons.forEach(button => {
      button.addEventListener('click', function(event) {
          event.preventDefault();

          // Check if the button is already disabled to prevent multiple submissions
          if (button.disabled) {
              return;
          }

          // Disable the button to prevent further clicks
          button.disabled = true;

          const form = button.closest('form');
          const formData = new FormData(form);

          // Perform the fetch request
          fetch(form.action, {
              method: form.method,
              body: formData,
              headers: {
                  "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
              }
          })
          .then(response => response.json())
          .then(data => {
              // If there is a success message, show it
              if (data.flash_notice) {
                  showFlashMessage(data.flash_notice, 'success');
              }

              // Proceed with the confirmation and redirect if there is a redirect URL
              if (data.redirect_url) {
                  // Show custom modal with options to cancel or view favorites
                  showFavoriteModal(data.redirect_url);
              }
          })
          .catch(error => {
              // Handle errors and show error message
              showFlashMessage("Unable to add to favorites.", 'error');
          })
          .finally(() => {
              // Re-enable the button after the request completes
              button.disabled = false;
          });
      });
  });

  function showFlashMessage(message, type) {
      const flashContainer = document.createElement('div');
      flashContainer.classList.add('flash-message', type);
      flashContainer.textContent = message;
      
      // Append the flash message to the body or a specific container
      document.body.appendChild(flashContainer);

      // Automatically hide the message after a few seconds
      setTimeout(() => {
          flashContainer.remove();
      }, 3000); // Adjust the timeout for how long the message should display
  }

  function showFavoriteModal(redirectUrl) {
      const modalHTML = `
          <div id="confirmation-modal" style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.5); display: flex; justify-content: center; align-items: center;">
              <div style="background: white; padding: 20px; border-radius: 10px; text-align: center; min-width: 200px;">
                  <p>Organization added to favorites!</p>
                  <button id="view-favorites" style="margin-right: 10px;">View Favorites</button>
                  <button id="cancel-favorite">Cancel</button>
              </div>
          </div>
      `;

      // Append modal HTML to the body
      document.body.insertAdjacentHTML("beforeend", modalHTML);

      // View Favorites button - navigate to the favorites page
      document.getElementById("view-favorites").addEventListener("click", function () {
          window.location.href = redirectUrl;
      });

      // Cancel button - remove the modal without doing anything
      document.getElementById("cancel-favorite").addEventListener("click", function () {
          document.getElementById("confirmation-modal").remove();
      });
  }
});
