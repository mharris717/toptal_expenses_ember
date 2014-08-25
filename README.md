# Expenses

## Known Issues

* When editing the amount of an existing expense, the cursor loses focus after every keypress.
* There is some rudimentary time validation, but it will still let some invalid times through.
* You can't type a date into a date field. The date picker must be used.
* Typing a comment longer than 1000 characters will not work.
* If an expense has multiple validation errors, only one will be displayed.
* Amount validation will let some invalid amounts through, such as 999abc (will become 999).

## Potential Enhancements

* Pagination.
* Transition animations when expenses are added or errors are displayed.
* All expenses (for that user) are loaded from the API by the JS client. All filtering and summary creation is done client side. This should eventually be moved to the server.
* Only tested in Chrome so far.
* Login credentials are sent over plain HTTP.
* Deleting an expense could require a confirmation.
* Batch editing.

## Notes

* Summary - The denominator for Daily Average is the number of days with an expense, not all days in the week