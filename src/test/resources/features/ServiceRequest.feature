Feature: Service Request

  As a user of Cargo transportation,
  I want to request a service,
  So that I can transport my package from one location to another.

  Scenario Outline: Requesting a Service
    Given I am on the Home page
    When I click the Send a package button
    Then I should be redirected to the Service Request page
    And I should be able to fill out the form with the following information Name "<name>", Email "<email>", from "<origin>", to "<destination_address>", Receiver's Name "<receiver_name>" and Package Weight "<package_weight>"
    And I should be able to submit the form by clicking the "next" button being redirected to the Choose Vehicle page

    Examples:
      | name            | email                   | origin        | destination_address | receiver_name    | package_weight |
      | Carol Taylor    | john.doe@example.com    | 123 Main St   | 456 Elm St          | Lin Brown        | 0              |
      | Jane Jackson    | jane.smith@example.com  | 789 Maple Ave | 321 Oak St          | Emily Miller     | 24             |
      | Stephen Johnson | bob.johnson@example.com | 456 Pine St   | 789 Cherry St       | Sarah Davis      | 25             |
      | Alice Lee       | alice.lee@example.com   | 246 Birch Rd  | 369 Oak Dr          | Madison Thompson | 26             |