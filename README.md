# Expenses

This project consists of two parts.

1. A small server API built with Rails.
2. An Ember application built with Ember-CLI.

## Known Issues

* When editing the amount of an existing expense, the cursor loses focus after every keypress.
* There is some rudimentary time validation, but it will still let some invalid times through.
* You can't type a date into a date field. The date picker must be used.
* Typing a comment longer than 1000 characters will not work.
* If an expense has multiple validation errors, only one will be displayed.
* Amount validation will let some invalid amounts through, such as 999abc (will become 999).
* Editing the date doesn't change the sort order.
* The validation on the registration form needs to be improved.

## Potential Enhancements

* Pagination.
* Transition animations when expenses are added or errors are displayed.
* All expenses (for that user) are loaded from the API by the JS client. All filtering and summary creation is done client side. This should eventually be moved to the server.
* Only tested in Chrome so far.
* Login credentials are sent over plain HTTP.
* Deleting an expense could require a confirmation. The delete button should be more clearly marked.
* Batch editing.
# Better time entry.
* Other currencies.
* Commas in currency display. 
* Email confirmation is not required after registration.
* There is no password recovery functionality.

## Notes

* Summary - The denominator for Daily Average is the number of days with an expense, not all days in the week.
* Time is entered in 24 hour format.

## Code Notes

* The API endpoint should be per-environment, instead of hardcoded.
* Had to create manual redirection rules on S3 for the history router to work
* Ember Simple Auth requires setting ENV config values differently than the Ember CLI idiom.
* Currency display helper needs more testing.
* The development build is hosted on S3. Can't make working production build due to Handlebars.compile call in an Ember Bootstrap library.
* The code to display save errors is awful. Should be replaced by proper validation library.
* API is running on Webrick, should switch to Unicorn.
* The tests are overly verbose and not written in a consistent style.
* All of the testing is client-side. Should add API testing.
* CSS ids/classes are inconsistently placed. For example, some classes are placed on links directly, while some are placed on container elements.