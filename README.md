# COmmunity

At **COmmunity**, we are committed to empowering Colorado's low-income residents, people experiencing homelessness, immigrants, and migrants by providing a centralized, user-friendly platform to discover free or low-cost resources. These resources span essential areas such as:

- Food
- Housing
- Healthcare
- Childcare
- Legal services
- Education

## Vision

Our vision is to build a stronger, more connected community by ensuring that everyone in Colorado has access to the resources they need to thrive. By centralizing knowledge and creating a space for feedback and collaboration, we aim to make navigating these services easier and more transparent for all.

## Features

- Search for resources based on location and needs
- User feedback and ratings for services
- Mobile-friendly design for ease of access
- Recommendations for end-users for additional services 
- Accessibility for larger fonts

# Project Setup Instructions

## Prerequisites
Before you begin, ensure you have the following installed on your machine:

- [Docker](https://www.docker.com/get-started)
- [Ruby on Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Setup Instructions

1. **Fork the Repository**

   Navigate to the repository on GitHub and click the "Fork" button to create a copy of the repository under your own GitHub account.

2. **Clone the Repository**

   Open your terminal and run the following command to clone the repository:
   ```bash
   git clone <repository_url>
   ```

3. **Navigate into the Directory**
   ```bash
   cd <directory_name>
   ```

4. **Verify Installation**
   ```bash
   docker --version
   ```

   ```bash
   rails --version
   ```

   ```bash
   psql --version
   ```
5. **Set Up Environment Variables**
   Create a .env file in the root folder using your credentials

6. **Build and Start the Containers**
   Build and start the containers and create the database.

   ```bash
   docker-compose up -d
   ```

7. **Access the Application**
   Open up a browser and navigate to [http://localhost:3000/](http://localhost:3000/)


# Installation
## Usage

### Ruby Version
- `ruby-3.3.5`

### System Dependencies
#### Ruby on Rails: Core Gems

- **Rails Version:** 7.1.0
- Includes edge Rails version from GitHub as an alternative option.

#### Front-end & CSS
- **Bootstrap Version:** 5.3.3
- **Autoprefixer Rails:** Adds vendor prefixes to CSS automatically.
- **Popper.js Version:** 2.11.8 (Dependency for Bootstrap).
- **ExecJS:** Executes JavaScript from Ruby.

#### Asset Pipeline
- **Sprockets Rails:** Original asset pipeline for Rails.

#### Database
- **PostgreSQL Version:** 1.1

#### Server
- **Puma:** Web server for Rails. Version 5.0

#### JavaScript & CSS Management
- **JSBundling Rails:** Manages JavaScript bundlers like esbuild or rollup.js.
- **CSSBundling Rails:** Manages CSS bundlers (e.g., Tailwind CSS, Bootstrap).

#### Import Maps & Styling
- **Importmap Rails:** Manages JavaScript modules using import maps.
- **Sass Rails Version:** 6 (For using Sass in Rails).

#### Hotwire (SPA Features)
- **Turbo Rails:** For fast, SPA-like pages.
- **Stimulus Rails:** For modest JavaScript enhancements.

#### API Building
- **Jbuilder:** For JSON APIs.

#### Authentication & Authorization
- **Devise:** Handles authentication.
- **Pundit:** Handles authorization.

#### Redis & Background Jobs
- **Redis Version:** 4.0.1 (Redis adapter for Action Cable).
- **Sidekiq Version:** 6.0 (Background processing using Redis).

#### Optional Gems
- **Kredis:** Higher-level data types in Redis (commented out).
- **BCrypt:** For secure password handling (commented out).

#### Time Zone Data
- **Tzinfo-data:** For time zone info (Windows/JRuby platforms).

#### Performance & Caching
- **Bootsnap:** Speeds up boot time by caching.

#### Miscellaneous
- **Ostruct:** Added for Ruby 3.5.0 to fix warnings.

---

# Development & Testing

#### Debugging Tools
- **debug**
- **web-console**
- **byebug**
- **pry-rails**

#### Testing Tools
- **rspec-rails**
- **factory_bot_rails**
- **capybara**
- **selenium-webdriver**

---

# Notes
- Remember to update gems regularly using `bundle update` to get security patches and bug fixes.

---

# In Progress
- **Current Bugs** - Github will be kept up-to-date regarding any bugs the team has encountered.
- **New Bugs** - Users who download the program are strongly encouraged to submit bugs to the team.

## Future Releases
We at COmmunity are interested in expanding to add more features for end users. These include:
- Additional support for accessibility (dark mode, text-to-speech)
- Recommendation system
- Calendar function for events 

## Contributors

- NickLM1200 - Nic
- GOKU900 - Lizeth Amateco Nava
- Marsvx - Mauren Vasquez
- akrajeski - Anna Krajeski
- NatashaLeeXY - Natasha Lee
- Ariamestra - Maria Estrada

Interested in joing our project? Join our organization [https://github.com/Colorado-Community-Resources] to make changes.