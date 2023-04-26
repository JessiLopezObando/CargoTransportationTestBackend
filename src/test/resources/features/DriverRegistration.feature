Feature: Driver Registration

  As a user of Cargo Transportation
  I want to create an account
  So that I can access as a Driver of Cargo Transportation

  Scenario Outline: Account Creation

    Given I am on the registration page
    When I fill in the required fields <name>, <lastname>, <DNI>, <age>, <phonenumber>, <email>, <password>, <plate>, <brand>, <model>, <color>, <type>, <totalCapacity>
    Then the response status code should be <code>


    Examples:
      | name     | lastname | DNI         | age  | phonenumber  | email                     | password | plate    | brand    | model   | color   | type     | totalCapacity | code |
      | "John"   | "Smith"  | "12345678"  | "35" | "3121234567" | "john@example.com"        | "1"      | "khg365" | "Toyota" | "Hilux" | "black" | "PICKUP" | 1000.0        | 200  |
      | "Mary"   | "Lee"    | "98765432"  | "27" | "3152345678" | "mary@example.com"        | "2"      | "ahg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 200  |
      | "John"   | "Smith"  | "12345678"  | "35" | "3156789012" | "johnsmith@example.com"   | "6"      | "bhg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "John"   | "Smith"  | "123456789" | "35" | "3207890123" | "johnsmith@example.com"   | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 200  |
      | ""       | "Smith"  | "123456789" | "35" | "3207890123" | "johnsmith@example.com"   | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Rachel" | ""       | "423456789" | "35" | "3207890123" | "rachelsmith@example.com" | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Rachel" | "Smith"  | ""          | "35" | "3207890123" | "rachelsmith@example.com" | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Rachel" | "Smith"  | "423456789" | ""   | "3207890123" | "rachelsmith@example.com" | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Rachel" | "Smith"  | "423456789" | "32" | "3207890123" | ""                        | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | " "      | "Smith"  | "423456789" | "32" | "3207890123" | "rachelsmith@example.com" | "7"      | "chg365" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |



