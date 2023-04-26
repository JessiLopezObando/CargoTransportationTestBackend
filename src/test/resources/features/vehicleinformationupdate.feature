Feature: Vehicle Information Update
  As a registered driver of Cargo Transportation application
  I want to update my vehicle information
  So that I have up-to-date information about my vehicle in the application to offer my services

  Scenario Outline: Updating Vehicle Information
    Given the driver is on vehicle information update page
    When the driver fills out the vehicle information form with <plate>, <brand>, <model>, <color>, <type> and <capacity>
    Then the vehicle information should be successfully updated and the status code response will be <code>
    Examples:
      | plate    | brand    | model   | color   | type     | capacity | code |
      | "abc123" | "Toyota" | "Hilux" | "Red"   | "PICKUP" | 500      | 202  |
      | "abc123" | "Toyota" | "Hilux" | "Red"   | "PICKUP" | 500      | 406  |
      | ""       | "Toyota" | "Hilux" | "Red"   | "PICKUP" | 500      | 406  |
      | "ser200" | ""       | "Hilux" | "White" | "PICKUP" | 1000     | 406  |
      | "ser222" | "Toyota" | "Hilux" | ""      | "PICKUP" | 1000     | 406  |
      | "ser220" | "Toyota" | "Hilux" | "Black" | "PICKUP" | -500     | 406  |
