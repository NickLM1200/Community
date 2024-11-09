document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".favorite form").forEach(form => {
      form.addEventListener("submit", async (event) => {
        event.preventDefault();
  
        try {
          const response = await fetch(form.action, {
            method: "POST",
            headers: { 
              "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
            },
            body: new FormData(form)
          });
  
          if (response.ok) {
            window.location.href = "/favorites"; // Redirect to favorites page on success
          } else {
            alert("Could not add to favorites. Please try again later."); // Error handling
          }
        } catch (error) {
          console.error("Error adding to favorites:", error);
          alert("An error occurred while adding to favorites.");
        }
      });
    });
  });
  