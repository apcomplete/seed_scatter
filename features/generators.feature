Feature:
  In order to separate my model seeds
  As a user
  I would like to create a seed file for every model generated

  Background:
    Given I successfully run `bundle exec rails new testapp --database sqlite3`
    And I cd to "testapp"
    And I add "seed_scatter" from this project as a dependency
    When I run `bundle install`

  Scenario: Seed scatter creates a seed file for every model I create
    When I run `bundle exec rails generate model User name:string`
    Then the output should contain "db/seeds/users.rb"
    And the file "db/seeds/users.rb" should contain "User.create"

  Scenario: Seed scatter should use generated seed files
    When I generate a User model
    And I overwrite "db/seeds/users.rb" with:
      """
      User.create([{ name: "Test User" }])
      """
    And I run `bundle exec rake db:seed`
    And I type `User.first` in the rails console
    Then the output should contain:
      """
      #<User id: 1, name: "Test User"
      """
