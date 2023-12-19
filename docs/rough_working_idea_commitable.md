# Rough Working Idea

Here an overall ideas as needed to brainstorm will be written. This will be committed, but it will nonetheless be a scratch pad and expected/intended to be in flux.

When profile page link has an id param, it refers to another user's profile.
When not, it refers to current user.

Different posts need to be fetched, and different user details, as well as different rendering.
If we're implementing a friending system, the related data between logged in user and profile user must be shown

What should be implemented? Friending - sending requests, showing received requests, and accepting/rejecting requests. This detail can be fetched with the rest of a user's data and shown in a notifications fashion as well.

Real time notifications are presently unncessary.

Since a comment model was already made, let's first create provision for viewing other profiles. And then commenting there