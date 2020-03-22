A user has many situations. (That’s sorta the main index page)

A situation has many phrases
A situation has many phrase_scores through phrases

A phrase belongs to a situation
A phrase belongs to a phrase_score

A phrase_score has many phrases
A phrase_score has many situations through phrases

10:13
The phrase belonging to a phrase score sounds awkward but a phrase can’t have more than one score.  Whereas a score “Highly Familiar” or “I don’t know” can have many phrases.
10:14
A situation has many phrase scores which allow a user to search phrases by how familiar they are...
10:15
But the phrase score having many situations allows a user to search for situations that will have something like “Mostly Familiar” or “Mostly Unfamiliar” phrases and I’d use a frequency count or something.
