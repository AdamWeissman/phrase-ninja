# README FOR PHRASE NINJA

## OVERVIEW

Phrase Ninja is an English to Japanese flashcard generator that also uses "Leitner Box" type logic to help a user practice the cards based on what they're familiar with.

Below is a detailed explanation from the User's perspective, of what they would do, along with some technical stuff so people wanting to set this up on their own computer will have minimum problems.

A user logins in, they are then able to create a situation and a bunch of phrases likely to be associated with that situation.  Users MUST declare the 'category' of phrase in order for it to be stored in the database; note: categories are an incomplete feature, see below for details.

All the phrases that a user generates are then translated using the official Google Translate API, and also an imported Python Library using googletrans; note: the official google translate API does not support phonetic pronunciation, and there was no single Ruby library that seemed to generate an accurate phonetic translation which is why I ended up with Python.

All the translation happens behind the scenes, so the user is brought back to the situations index.  Once the situation has been created, it brings the user back to the "situations index" as there is no actual "show" page for a Situation.  A situation's "show page" is really a detailed index of all the Phrases it contains.  That said, a user is able to edit the title of the situation (from the situations index page), and they are also able to destroy it.  It uses a "dependent destroy" so unassociated phrases are not left lingering in the database.

A user is then able to click a situation to edit its phrases.  When the user edits phrases, what they are really seeing is the index of phrases associated with that situation.  All the phrases appear on a single page in order to mimic the experience of a show page, but also to avoid creating endless clutter.  A phrase that is selected to be edited brings the user to a separate edit page which enables the user to make adjustments to their text.  Any changes made are retranslated for the user.  New phrases can also be added on the phrases index, and any individual phrase can be destroyed.

Back on Situatons Index, there are checkboxes in a STUDY column.  A user is able to select which situations they would like to study and that brings them to a flashcard page which asks them what levels of familiarity they want to study.  Once they choose the levels of familiarity they would like to study, they will enter a study loop where only the phrases that belong to the situation and requested level of familiarity will appear.  Depending on the level of familiarity clicked, a certain number of points will be added which are used to determine whether a phrase is repeated in the study cycle and for how long.

The user sees some basic information, their original text, the equivalent text (or what they're really saying in Japanese), and lastly when they click SHOW SOLUTION, they will see the phonetic pronunciation that gives them the opportunity to rank it.  

All cycle scores are reset on Situations Home, but the selected level of familiarity persists so the user does not have to "start over" every time.  

## TECHNICAL STUFF

### HIDDEN STUFF
There are several hidden files you may need to get this to run that are not showing up because they are gitignored.  Inside the config folder there is google_cloud.json which contains the API key to Google Translate (more on that in a moment).  Also hidden master.key for use with the API.  And then in root directory there is the .env file which contains this: GOOGLE_APPLICATION_CREDENTIALS="config/google_cloud.json", in addition to the standard GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET which are used for oauth2.

### GENERAL VERSION STUFF AND REQUIREMENTS
Phrase Ninja is built with ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18] and rails Rails 6.0.2.2.

It also requires Python 3.7 in order to get the phonetic pronunciation.  To see how that is working, please see the vendor folder and the google_pronounce.py file that I created with fellow Flatiron Student: Sunny.  A special "shout out" here because after setting up the Google Translate API, omniauth and extensive planning, I hit a snag with the sad discovery that the Google Translate API does not provide phonetic pronunciation the same it does on its actual home page.  I was on the verge of giving up the project (because I had not assumed the API's functionality would differ from how it seemed generally advertised).  Sunny helped me confirm with the documentation that the API did not do what we expected it, but went further in helping me to see how we might recreate a solution.  I had attempted several morphological text parser gems to recreate Google's functionality, but my wife who is Japanese revealed that they were generally incorrect.  When Sunny pointed out that a Python library seemed to do this, we worked together to see if we could run a few lines of Python in Ruby.  Long story short, we accomplished it, and with much gratitude, I realize that I would've given up on this project after weeks of planning if I had not been able to get the phonetic pronunciation working.  Though the app would still function without phonetic pronunciation it would for all intents and purposes be incomplete.  There are many things still incomplete in this project, but at its heart it works!  And that is because of Sunny and the Python Programmer who created googletrans.  Goolgetrans can be found here https://pypi.org/project/googletrans/ and Sunny can be found here: https://github.com/aurangzaib-danial

To recap, beyond Ruby, Rails, and Python: the user will need a KEY and GOOGLE API ACCOUNT to install Google Translate on their own computer.  Heads up!  If you are trying to get Google Translate API set up locally and Google keeps asking you for a credit card... YES, give it to them.  You don't get charged unless you make over a million some odd requests (so you'll never get charged) but in order to have full access to the Google Translate API, you will need to fill out that information.  

There is a database seed file included, but you will NOT need to seed the database.  It only remains so I can attempt to recreate my thought process.

After forking and cloning this project, you would want to make sure that you have "bundle installed" everything in the gem file as it is.  Beware that you don't uncomment omniauth as it seemed to conflict with omni-auth-oauth2.

Other standard procedure would include running `rails db:migrate.``

Run the program using `rails s` from the directory where you install this and you will then be able to run Phrase Ninja from your local host.

## THINGS THAT ARE INCOMPLETE OR I WOULD CHANGE OUTSIDE THE SCOPE OF THIS PROJECT

Right now, there are no restrictions on what a category may be because the functionality of 'search by category' is not yet present in this version of Phrase Ninja.  Unfortunately for the current version of Phrase Ninja, while the database is generally protected from the accidental creation of bad data, the user is not warned with errors at the stage of the text blob -- this is partially because I was unable to figure out how to isolate error messages on the parser, but also because I expect that a "user" wanting to gain the most from the program would not intentionally break it.

I would actually get rid of Omniauth if I deployed this to Heroku, or went live.  While there are many things that are probably not secure within the working version of this program as it is, I would not feel comfortable deploying my amateur-tutorial-followed version of Authentication for general users.  In other words, I understand (or think I understand) that sessions are either stored locally (in your browser), temporarily on the server, or managed by the database.  Since the first version of locally stored sessions seems the most hackable (just copy and paste a URL to reactivate a session), I wouldn't want to be a point of entry in to a service like Google, Facebook, or Github.

params.permit! and hard coded HTML forms.  I realize these are big "no nos" but both were a small improvement over using completely unsecure `get` requests to avoid using any authentication at all on customized logic.  These were meant as a temporary fix to get around the issue of mass assignment (for using the checkboxes), but as I got it working, I used the temporary fix to build other temporary fixes which in some ways spiraled out of control.  

In the end, the app works, but to invoke an analogy: sometimes you don't want to know how the sausage gets made.  In other words, my feeling about this project is akin to some of my favorite "Mom & Pop" eateries where I love the food, but know I would not EVER want to peek inside the kitchen.  On a more optimistic note, this readme has helped me reflect on WHAT NOT to do next time, but also where to start off on the right foot.
