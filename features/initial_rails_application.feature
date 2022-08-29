Feature: Initial Rails Application
 Scenario: Applcation name is "Depot"
  Given there is a Ruby on Rails application called "Depot"
  When you run the rails application
  Then Puma should show the Rails application name as "Depot"