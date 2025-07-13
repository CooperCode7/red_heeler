# Red Heeler

Red Heeler is a Ruby on Rails application for creating, managing, and editing custom forms made up 
of true/false (and eventually other types of) questions. Users can build and curate forms for data 
collection, surveys, or questionnaires.

---

## ✅ Features Completed

### 📂 Forms Management

- Create new forms with a title and optional description.
- Edit or delete existing forms.
- View a list of all forms (index).
- View individual form detail pages.

### ❓ Questions Management (Nested under Forms)

- Add true/false (text-based) questions to a form.
- Edit or delete existing questions.
- View all questions for a given form on its detail page.

### 🛡️ Validations

- Prevents form creation without a title.
- Prevents question creation without content.

### 🔪 Testing

- Model tests for Forms and Questions to enforce validation rules.
- Controller tests for:
  - Creating forms/questions (with both valid and invalid input).
  - Updating and deleting forms/questions.
  - Rendering correct views and redirecting as expected.
- Flash messages and error displays confirmed through testing.

### 💻 User Interface

- Basic layout using Rails view helpers.
- Reusable partial for form input (`_form.html.erb`).
- Flash messages for success and error feedback.
- Deletion confirmation prompts.

### ⚙️ Technical Setup

- RESTful routes using nested resources (`questions` inside `forms`).
- Turbo issues addressed (e.g., method: \:delete links handled properly).
- Uses `form_with` with `local: true` to keep things server-side rendered for now.

---

## 🚧 Work in Progress / To-Do

### 🧑‍💻 User Authentication

- Users can currently create forms without authentication (assumes first user).
- Plan to integrate Devise (likely with passwordless login) to manage real users.
- Eventually tie form/question ownership and permissions to the logged-in user.

### 🗳️ Form Responses

- Users can’t yet answer forms.
- Need to build functionality for submitting and storing form responses.
- Plan to allow viewing submissions per form.

### 🧠 Question Types

- Currently only supports simple text-based questions (true/false by default).
- Add support for different types: multiple choice, rating scales, etc.

### 🖼️ Styling & UX

- Minimal visual styling at the moment.
- Plan to enhance layout with Tailwind or Bootstrap for better UI/UX.

### 📊 Admin / Dashboard Features

- No admin view or form analytics yet.
- Eventually want to see response summaries or export data.

### 🤖 Prescriptive Analytics (Coming Soon)

- Plan to use Python and the Random Forest algorithm to analyze form responses.
- Goal is to make recommendations or predictions based on user input.
- Will be implemented once core form/user functionality is stable.

---

## 🧰 Tech Stack

- **Language**: Ruby 3.x
- **Framework**: Ruby on Rails 8.x
- **Database**: PostgreSQL or SQLite (dev)
- **Testing**: Minitest (Rails default)
- **Asset Pipeline**: Importmap, Turbo

---

## 🏃 Getting Started

```bash
# Clone the repo
git clone https://github.com/yourusername/red_heeler.git
cd red_heeler

# Install dependencies
bundle install

# Set up the database
bin/rails db:setup

# Run the test suite
bin/rails test

# Start the Rails server
bin/rails server
```

---

## 👨‍👧‍👦 Contributing

This project is currently in early development. Suggestions and contributions welcome once user auth
is in place.

---

## 🐶 About the Name

Named after a real-life Red Heeler (Australian Cattle Dog / Great Pyrenees mix) named Billie, who 
protects gardens, barks at everything, and generally inspires scrappy reliability.

