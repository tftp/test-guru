# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Semantic Versioning 2.0.0: https://semver.org/

* Ruby version: ruby 2.5.5-p157

* Rails version: Rails 6.0.0

* System dependencies:
  Nodejs and yarn must be installed in order to install rails 6 correctly.

* Configuration: no special configuration is required

* Database creation: create database test-guru

* Database initialization: yes

* What news?

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
  08.11.2019
  created new scope-methods:
  for Test:
  low_level, middle_level, high_lewel for selection tests for level
  low     - 0..1
  middle  - 2..4
  hight   - 5 and above
  list_tests_for_category(name), where name is name of category
  level - it is scope for select data of users tests from level (example: user1.tests.level(1))
  for Answer:
  true_answers - select true questions answers
* Deployment instructions
