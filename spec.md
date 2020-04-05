Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) (a user has many situations, a user has many scores)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) a phrase belongs to situations and a phrase belongs to scores
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) a situation has many scores through phrases, and a score has many situations through phrases
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Fulfilled in explanation above (it goes two ways)
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) phrases have their score_ids reassigned and also have their familiarity score modified
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) email validation, number of characters etc.
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) situation.whip_up_some_phrases is a parser function I wrote to generate phrases from a text blob on a situations model
- [X] Include signup (how e.g. Devise) basic
- [X] Include login (how e.g. Devise) basic or omni
- [X] Include logout (how e.g. Devise) user can logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) google with omniauth
- [X] Include nested resource show or index (URL e.g. users/2/recipes) there are many that were manually defined in addition to the railsy situations/phrases
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) a user can add a new phrase on a situation after initial parsing takes place (also full CRUD)
- [X] Include form display of validation errors (form URL e.g. /recipes/new) It works for email.

Confirm:
- [/] The application is pretty DRY (not nearly dry enough -- that's goal for refactor)
- [X] Limited logic in controllers (comparatively maybe yes, there's a lot of logic outside the controllers as well -- much has not yet been refactored yet)
- [X] Views use helper methods if appropriate - there are lots of these
- [X] Views use partials if appropriate - I swap out to _form
