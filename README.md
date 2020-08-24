# sloth_app

An intentionally slow Flutter app.

![The sloth_app in action, showing two pages with Performance Overlay turned on](https://user-images.githubusercontent.com/919717/91081239-a79f2c00-e5fb-11ea-9888-15b52789aa77.gif)

## But, why?

Performance optimization is a gnarly topic. Performance issues seldom exist in isolation, and they
often only manifest in really complex (and closed-source) apps.

I ([filiph@](https://filiph.net)) made this app to address this. It's full of performance issues
we see in real-world apps, but without the cruft of full apps, and isolated from each other.

It has been a great resource to me and others when teaching about Flutter performance.

### Videos

The app makes appearance in the following videos:

- [Flutter Europe 2020](https://www.youtube.com/watch?v=SQcmrl_NkqY)
- [Meetup Online Presentation](https://www.youtube.com/watch?v=Ogq8QFp9Ea8)
- [Flutter Day 2020 DevTools session](https://www.youtube.com/watch?v=nq43mP7hjAE)

## Structure

The app is structured as one big `PageView` that goes from left to right. Every 3rd page
has a performance issue. The other two are there to cleanly isolate one performance
issue from another (unless I _don't_ want to isolate).

Pages are color-coded, so that there's a simple correspondence between what you see and the code.
For example, the code to the blue page is found in `blue.dart`.
