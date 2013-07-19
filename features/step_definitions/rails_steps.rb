When /^I add "([^"]+)" from this project as a dependency$/ do |gem_name|
  append_to_file('Gemfile', %{gem "#{gem_name}", :path => "#{PROJECT_ROOT}"\n})
end

And /^I create a user with name "(.+)"$/ do |name|
  step %{I run `bundle exec rails console` interactively}
  step %{I type "User.create(name: #{name}"}
  step %{I type "exit"}
end

And /^I generate a (.+) model$/ do |klass|
  step %{I run `bundle exec rails generate model #{klass} name:string`}
  step %{I run `bundle exec rake db:migrate`}
end

And /^I type `(.+)` in the rails console$/ do |command|
  step %{I run `bundle exec rails console` interactively}
  step %{I type "#{command}"}
  step %{I type "exit"}
end
