# Inertia.js example app

This is an example on how to use [Inertia.js](https://inertiajs.com/) to build the frontend with [Vue.js](https://vuejs.org/) within a [Ruby on Rails](https://rubyonrails.org/) application
Styles made with [Tailwind CSS](https://tailwindcss.com/).

There is already a demo application to show how Inertia.js works (see [Ping CRM](https://github.com/inertiajs/pingcrm)) - but for PHP/Laravel only. I've build this thing to try Inertia.js with Rails.

This app has two pages - a start screen and a list screen with a filtering UI. The layout and styling is taken from the [Tailwind CSS demo project](https://github.com/adamwathan/workcation). Click around and inspect the data transmitted via your DevTools network tab. You see HTML responses at the first request and JSON response in all subsequent requests.

There is a live demo available at [workcation.ledermann.dev](https://workcation.ledermann.dev).


## Try it out

```bash
git clone git@github.com:ledermann/workcation.git
cd workcation
bin/setup
foreman start
```

Then, open http://localhost:3000 in your browser.


## Requirements

- Ruby 2.7
- PostgreSQL


## References

- [Introducing Inertia.js](https://reinink.ca/articles/introducing-inertia-js)
- [FullStackRadio episode 127](http://www.fullstackradio.com/127): Jonathan Reinink - Building Modern Monoliths with Inertia.js
- [Designing with Tailwind CSS](https://tailwindcss.com/screencasts/): Free video series on how to build fully responsive, professionally designed UIs from scratch using Tailwind CSS
