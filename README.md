# Change Tracking Bug

Maybe I’m trying to do something that’s not supported, but it feels like it should work.

All the relevant code is in `lib/change_tracking_bug_web/live/demo.ex`.

Visit (http://localhost:4000) and select a few different values from the list.
The view will live-patch each time, updating the selected value in the URL and
on the page.

Now hit the back button. The URL changes, and the page is patched (confirmed by
the _Selected item_ text changing), but the options in the select element
aren’t re-rendered, so the selected item doesn’t update to match the correct
value.
