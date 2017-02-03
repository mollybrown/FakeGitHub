# FakeGitHub (APIcurious)

![FakeGitHub Screenshot](/app/assets/images/fakegithub.png)

FakeGitHub is my take on replicating the GitHub UI using the GitHub API. The original project spec can be found [here](http://backend.turing.io/module3/projects/apicurious).

## Learning Goals
 - Learn to consume data from third-party APIs
 - Continue to emphasize performance, UI, and overall user experience
 - Continue using TDD to drive all layers of development
 - Coordinate with project stakeholders to produce quality code and product
 - This project will be completed individually over a period of 4 days.

## Technical Expectations
 - Use an Omniauth authentication library for authenticating users with the 3rd-party service.
 - Mimic the interface functionality of one online service from the list below.
 - Consume an external API to get real data and interact with a third-party service.
 - Do NOT use a gem to communicate with the external API (Omniauth is OK)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

Clone the project

```
$ git clone https://github.com/mollybrown/FakeGitHub
```

Run Bundler to install all dependencies specified in the project Gemfile

```
$ bundle install
$ bundle exec figaro install
```

Add any applicable API keys/tokens to the config/application.yml file

```
SUPER_SECRET_KEY: 7381a978f7dd7f9a1117
```

Setup the test and development databases and add seed data

```
$ rake db:create
$ rake db:migrate
```

Start the Rails server

```
$ rails s
```
Finally, navigate to localhost:3000 in your favorite browser to sign in to FakeGitHub!

## Running the tests

To run the test suite, run rspec from the project root directory:

```
$ path/to/project/root rspec
```

## Contributors

* [Molly Brown](https://github.com/mollybrown)

## Built With

* [GitHub API](https://developer.github.com/v3/)
* [OmniAuth](https://github.com/omniauth/omniauth)
* [VCR](https://github.com/vcr/vcr)
* [Figaro](https://github.com/laserlemon/figaro)
* [Faraday](https://github.com/lostisland/faraday)
