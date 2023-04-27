Feature: Username

  Scenario Outline: userName Creation
    Given the driver is in the registration page
    When the driver fills in the required fields <name>, <name>, <lastname>, <DNI>, <age>, <phonenumber>, <email>, <plate>, <brand>, <model>, <color>, <type>, <totalCapacity>
    Then the systems creates a userName with the first letter of the driver's name and the full last name, followed by a number and a status <code> is returned
    Examples:
      | name     | lastname  | DNI          | age  | phonenumber  | email                  | plate    | brand    | model   | color   | type     | totalCapacity | code |
      | "Emily " | "Johnson" | "7920163865" | "35" | "3121234567" | "emily@example.com"    | "MNO456" | "Toyota" | "Hilux" | "black" | "PICKUP" | 1000.0        | 201  |
      | "Emily"  | "Johnson" | "2896451903" | "27" | "3152345678" | "emily_2@example.com"  | "PQR789" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "4562398710" | "35" | "3156789012" | "emily_3@example.com"  | "STU321" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "1358976420" | "35" | "3207890123" | "emily_4@example.com"  | "VWX654" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "8745629103" | "35" | "3207890123" | "emily_5@example.com"  | "YZA987" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "9075341286" | "35" | "3207890123" | "emily_6@example.com"  | "BCD123" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "6542389170" | "35" | "3207890123" | "emily_a7@example.com" | "EFG456" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "3289567104" | "35" | "3207890123" | "emily_8@example.com"  | "HIJ789" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "2104578639" | "32" | "3207890123" | "emily_9@example.com"  | "KLM321" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |
      | "Emily"  | "Johnson" | "7865421930" | "32" | "3207890123" | "emily_j@example.com"  | "NOP654" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  |