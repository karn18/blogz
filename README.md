# Blogz

## Setup

- Ruby: [rbenv](https://github.com/rbenv/rbenv)
- IDE: VS Code + [Extensions](https://dev.to/thomasvanholder/10-vs-code-extensions-for-ruby-on-rails-developers-89a)

## Code Style

- [Rubocop](https://rubocop.org/) + [Standard](https://github.com/testdouble/standard)
- Look the config 👉 [.rubocop.yml](.rubocop.yml)
- Add rake task for rails [rubocop.rake](lib/tasks/rubocop.rake)

  - Check code style

    ```bash
    $ bin/rails rubocop
    ```

  - Correct the offenses

    ```
    $ bin/rails rubocop -- -a
    # or
    $ bin/rails rubocop -- -A
    ```

## Documents

- [Rails APIs](https://api.rubyonrails.org/)
- [devdocs](https://devdocs.io/)

## MVC


## Routes
- CRUD based design

## Log Collector
- [Vector](https://vector.dev) & [Axiom](http://axiom.co)

## Error Tracing
- [Sentry](https://sentry.io)