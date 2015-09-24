# Concept Explainer

This is a tool designed to explain basic financial concepts

## Techstack

* Middleman - to generate static html contents.
* Rack - to handle other dynamic requests such as login.
* Warden - to imeplement simple password authentication.
* Griddle - to help with responsive layout of the pages.


### How to start in development server

1. Generate a SHA-256 digest for password
2. run 
    ```bash
    PASS_DIGEST=<SHA-256> bundle exec rackup -p 8081
    ```
3. The middleman static content should be generated in build directory
4. http://localhost:8081/ should take you to the homepage or login screen


All the middleman generated content is present in the source directory. 

#### Whats rack doing?
Rack starts out of config.ru which serves the static content built onto the build directory. We also have our own internal rack app to process login requests. The whole system works as a series of stacked filters, where each filter tries to serve the page by itself or passes it onto a next part of the stack.


--------------------
|      Rack         |
--------------------
|      Login        |
|    TryStatic      |
|    Serve 404      |
--------------------


### Running specs
Specs for this project are written in 
  * cucumber
  * capybara
  * rack-test
  * rspec

There are no traditional rspec components to this app as it has very limited backend activities.

To run the specs run

```bash
bundle exec cucumber
```

The features are present in features directory. The specs are written with page objects which either return other page objects are respective text based on the spec.


### Deploying

The systems is designed to be deployed onto heroku. A simple SnapCI system can be used to automatically run the functional specs and deploy onto Heroku when it is checked in.
