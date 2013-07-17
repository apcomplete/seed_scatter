Feature:
  In order to separate my model seeds
  As a user
  I would like to create a seed file for every model generated

  Background:
    Given I successfully run `bundle exec rails new testapp`
    And I cd to "testapp"
    And I add "seed_scatter" from this project as a dependency

  Scenario: Seed scatter creates a seed file for every model I create
    When I run `bundle install`
    And I run `bundle exec rails generate model User name:string`
    Then the output should contain "db/seeds/users.rb"
    And the file "db/seeds/users.rb" should contain "User.create"
