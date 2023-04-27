Feature: Service Request

  As a user of Cargo transportation,
  I want to request a service,
  So I can transport my package from one location to another.

  Scenario Outline: Requesting a Service
    Given I am on the URL to make a request
    When I fill out the form with the following information driverId <driverId>, origin <origin>, destination <destination>, customerName <customerName>, customerEmail <customerEmail>, packageReceiver <receiver>, Package Weight <package_weight>, minutes <minutes> and description <description>
    Then I should be able to create the ticket and the status code should be <code>

    Examples:
      | driverId                   | customerName      | customerEmail             | origin          | destination      | receiver           | package_weight | minutes |description| code |
      | "6449446f5ea25a460a913b2a" | "Carol Taylor"    | "john.doe@example.com"    | "123 Main St "  | "456 Elm St"     | "Lin Brown"        | 100            | 180     |"Package 1"| 201  |
      | "6448b7255ea25a460a913b25" | "Jane Jackson"    | "jane.smith@example.com"  | "789 Maple Ave" | "321 Oak St"     | "Emily Miller"     | 24             | 500     | "Package 2"|201  |
      | "6448abf15ea25a460a913b23" | "Stephen Johnson" | "bob.johnson@example.com" | "456 Pine St"   | "789 Cherry St " | "Sarah Davis"      | 25             | 300     |"Package 3" |201  |
      | "6448a298c2bee96b39f329db" | "Alice Lee "      | "alice.lee@example.com "  | "246 Birch Rd " | "369 Oak Dr "    | "Madison Thompson" | 26             | 600     | "Package 4"|201  |