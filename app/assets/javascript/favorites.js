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

            // Toggle the star color immediately when clicked
            button.classList.toggle('favorited');  // This will turn the star gold

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
                    const confirmRedirect = window.confirm("Organization added to favorites! Click 'OK' to be redirected to your favorites.");
                    if (confirmRedirect) {
                        // Redirect the user if they click 'OK'
                        window.location.href = data.redirect_url;
                    }
                }
            })
            .catch(error => {
                // Handle errors and show error message
                showFlashMessage("Unable to add to favorites.", 'error');
                // Optionally, revert the color change if there is an error
                button.classList.remove('favorited');
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
});
