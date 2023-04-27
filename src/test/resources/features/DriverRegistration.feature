Feature: Driver Registration

  As a user of Cargo Transportation
  I want to create an account
  So that I can access as a Driver of Cargo Transportation

  Scenario Outline: Account Creation
    Given I am on the registration page
    When I fill in the required fields <name>, <lastname>, <DNI>, <age>, <phonenumber>, <email>, <plate>, <brand>, <model>, <color>, <type>, <totalCapacity>
    Then the response status code should be <code> and return a <message>
    Examples:
      | name       | lastname    | DNI          | age  | phonenumber  | email                        | plate    | brand    | model   | color   | type     | totalCapacity | code | message                              |
      | "Saira"    | "Restrepo"  | "8765342190" | "35" | "3121234567" | "sairarpo@cargo.com"         | "dgt876" | "Toyota" | "Hilux" | "black" | "PICKUP" | 1000.0        | 201  | ""                                   |
      | "Luis"     | "Rodriguez" | "2093857416" | "27" | "3152345678" | "lrodri2@example.com"        | "bbb795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Ana"      | "Perez"     | "6742198530" | "35" | "3156789012" | "saralopez100@cargo.com"     | "ccc567" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Diego"    | "Gomez"     | "1456029837" | "35" | "3207890123" | "diegogz2@mail.com"          | "aaa795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Carolina" | "Diaz"      | "3902841675" | "35" | "3207890123" | "carodcargo.com"             | "ddd258" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Enter a valid email"         |
      | ""         | "Smith"     | "7843901256" | "35" | "3207890123" | "smith00@example.com"        | "ggg547" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "String index out of range: 0"       |
      | "Rachel"   | ""          | "9268310475" | "35" | "3207890123" | "rachelsmith540@example.com" | "rrr456" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "lastName: Last Name can't be empty" |
      | "Rachel"   | "Smith"     | ""           | "35" | "3207890123" | "rachelsmith480@example.com" | "tyu879" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "dni: Dni can't be empty"            |
      | "Rachel"   | "Smith"     | "5612098437" | "32" | "3207890123" | ""                           | "qaz951" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Email can't be empty"        |
      | "Diana"    | "Smith"     | "4531876902" | "32" | "3207890123" | "dia.smith@example.com"      | ""       | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Andrea"   | "Lee"       | "7185049263" | "25" | "3207890123" | "andrelee2@example.com"      | "BBB169" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | -2000.0       | 400  | ""                                   |
      | "Andres"   | "Serna"     | "3025971846" | "25" | "3207890123" | "anser200ha@mail.com"        | "bbb169" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |



