Feature: Driver Registration

  As a user of Cargo Transportation
  I want to create an account
  So that I can access as a Driver of Cargo Transportation

  Scenario Outline: Account Creation

    Given I am on the registration page
    When I fill in the required fields <name>, <lastname>, <DNI>, <age>, <phonenumber>, <email>, <password>, <plate>, <brand>, <model>, <color>, <type>, <totalCapacity>
    Then the response status code should be <code> and return a <message>


    Examples:
      | name       | lastname    | DNI            | age  | phonenumber  | email                        | password | plate    | brand    | model   | color   | type     | totalCapacity | code | message                              |
      | "Sara"     | "Restrepo"  | "279052435"    | "35" | "3121234567" | "saralopezjob@cargo.com"     | "1"      | "ara525" | "Toyota" | "Hilux" | "black" | "PICKUP" | 1000.0        | 201  | ""                                   |
      | "Luis"     | "Rodriguez" | "98765432010"  | "27" | "3152345678" | "lrodri2@example.com"        | "2"      | "bbb795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Ana"      | "Perez"     | "1234567890"   | "35" | "3156789012" | "saralopez100@cargo.com"     | "6"      | "ccc567" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Diego"    | "Gomez"     | "2468024680"   | "35" | "3207890123" | "diegogz2@mail.com"          | "7"      | "aaa795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Carolina" | "Diaz"      | "1357908642"   | "35" | "3207890123" | "carodcargo.com"             | "7"      | "ddd258" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Enter a valid email"         |
      | ""         | "Smith"     | "3692581470"   | "35" | "3207890123" | "smith00@example.com"        | "7"      | "ggg547" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "String index out of range: 0"       |
      | "Rachel"   | ""          | "8024681357"   | "35" | "3207890123" | "rachelsmith540@example.com" | "7"      | "rrr456" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "lastName: Last Name can't be empty" |
      | "Rachel"   | "Smith"     | ""             | "35" | "3207890123" | "rachelsmith480@example.com" | "7"      | "tyu879" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "dni: Dni can't be empty"            |
      | "Rachel"   | "Smith"     | "5790468213"   | "32" | "3207890123" | ""                           | "7"      | "qaz951" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Email can't be empty"        |
      | "Diana"    | "Smith"     | "8642097531"   | "32" | "3207890123" | "dia.smith@example.com"      | "7"      | ""       | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Andrea"   | "Lee"       | "766202331012" | "25" | "3207890123" | "andrelee@example.com"       | "7"      | "BBB168" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | -2000.0       | 201  | ""                                   |
      | "Andres"   | "Serna"     | "90066202331"  | "25" | "3207890123" | "anser200@mail.com"          | "7"      | "bbb168" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 201  | ""                                   |



