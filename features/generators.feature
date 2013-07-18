Feature:
  In order to separate my model seeds
  As a user
  I would like to create a seed file for every model generated

  Background:
    Given I successfully run `bundle exec rails new testapp --database sqlite3`
    And I cd to "testapp"
    And I add "seed_scatter" from this project as a dependency

  Scenario: Seed scatter creates a seed file for every model I create
    When I run `bundle install`
    And I run `bundle exec rails generate model User name:string`
    Then the output should contain "db/seeds/users.rb"
    And the file "db/seeds/users.rb" should contain "User.create"

  #Scenario: The factory_girl_rails generators create a factory file with a custom name for each model that I generate
    #When I run `bundle install` with a clean environment
    #And I set the FactoryGirl :suffix option to "factory"
    #And I run `bundle exec rails generate model User name:string --fixture-replacement=factory_girl` with a clean environment
    #And I run `bundle exec rails generate model Namespaced::User name:string --fixture-replacement=factory_girl` with a clean environment
    #Then the output should contain "test/factories/users_factory.rb"
    #And the output should contain "test/factories/namespaced_users_factory.rb"
    #And the file "test/factories/users_factory.rb" should contain "factory :user do"
    #And the file "test/factories/namespaced_users_factory.rb" should contain "factory :namespaced_user, :class => 'Namespaced::User' do"
