Feature: User requests 1st 'n' prime numbers
  As a user of 'code challenge'
  I want to run the prime numbers challenge
  So that I can verify a list of 'n' prime numbers

  Scenario: run code challenge
    Given that I have not yet started
    When I start a new request
    Then I should see "Challenge : Prime multiplication"