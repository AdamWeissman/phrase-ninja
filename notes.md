ON 3/26 working on

edit.html.erb
phrases_controller.rb
and phrase index.html.erb
and routes

need to figure out nested form_with


For 3/24

Get the situations "show" page to redirect to each respective nested index of phrases for the given situation.
Each phrase will appear with the opportunity to edit or delete.
How does the phrase populate in place?  Has the original English (which the user can edit, along with the "equivalent english")
  Editing a phrase would prompt Phrase.translate in place and an update. It should also reset the phrase score total, and also reset the phrase_score id to 6
There will also be an opportunity to "add a new phrase" which would be a form that has two fields, one for category, and one for the phrase.

after I get the show nested show pages working tomorrow, i can then focus on getting the study view working (primary study view is with checkboxes).
But, the user will also have a Study Menu item which (if the user clicked) would render with Situation Check Boxes, PHrase Category Check Boxes.
The user would also have the opportunity to rerender the list of situations based on average, median or mode


-- ABOVE THIS LINE IS NEW --
A user has many situations. (That’s sorta the main index page)

A situation has many phrases
A situation has many phrase_scores through phrases

A phrase belongs to a situation
A phrase belongs to a phrase_score

A phrase_score has many phrases
A phrase_score has many situations through phrases

The phrase belonging to a phrase score sounds awkward but a phrase can’t have more than one score.  Whereas a score “Highly Familiar” or “I don’t know” can have many phrases.
A situation has many phrase scores which allow a user to search phrases by how familiar they are...
But the phrase score having many situations allows a user to search for situations that will have something like “Mostly Familiar” or “Mostly Unfamiliar” phrases and I’d use a frequency count or something.

Some other notes: make sure to talk about setting up Python 3 in the readme along with backticks and the pypi.org/project/googletrans/ that Sunny recommended

Also talk about setting up google api and .env

Make sure to talk about use rails db:seed and why
