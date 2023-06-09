Feature: Vehicle Information Update
  As a registered driver of Cargo Transportation application
  I want to update my vehicle information
  So that I have up-to-date information about my vehicle in the application to offer my services

  Scenario Outline: Updating Vehicle Information
    Given the driver is on vehicle information update page
    When the driver fills out the vehicle information form with <name>, <lastname>, <DNI>, <age>, <phonenumber>, <email> <plate>, <brand>, <model>, <color>, <type> and <totalCapacity>
    Then the vehicle information should be successfully updated, the status code response will be <code> and a <message> will be return
    Examples:
      | name       | lastname    | DNI            | age  | phonenumber  | email                        | plate    | brand    | model   | color   | type     | totalCapacity | code | message                              |
      | "Sara"     | "Restrepo"  | "2179052435"   | "35" | "3121234567" | "saralopezjob2@cargo.com"    | "ara505" | "Toyota" | "Hilux" | "black" | "PICKUP" | 1000.0        | 201  | ""                                   |
      | "Luis"     | "Rodriguez" | "98765432010"  | "27" | "3152345678" | "lrodri2@example.com"        | "bbb795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Ana"      | "Perez"     | "1234567890"   | "35" | "3156789012" | "saralopez100@cargo.com"     | "ccc567" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Diego"    | "Gomez"     | "2468024680"   | "35" | "3207890123" | "diegogz2@mail.com"          | "aaa795" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Carolina" | "Diaz"      | "1357908642"   | "35" | "3207890123" | "carodcargo.com"             | "ddd258" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Enter a valid email"         |
      | ""         | "Smith"     | "3692581470"   | "35" | "3207890123" | "smith00@example.com"        | "ggg547" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "String index out of range: 0"       |
      | "Rachel"   | ""          | "8024681357"   | "35" | "3207890123" | "rachelsmith540@example.com" | "rrr456" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "lastName: Last Name can't be empty" |
      | "Rachel"   | "Smith"     | ""             | "35" | "3207890123" | "rachelsmith480@example.com" | "tyu879" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "dni: Dni can't be empty"            |
      | "Rachel"   | "Smith"     | "5790468213"   | "32" | "3207890123" | ""                           | "qaz951" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "email: Email can't be empty"        |
      | "Diana"    | "Smith"     | "8642097531"   | "32" | "3207890123" | "dia.smith@example.com"      | ""       | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 400  | "already exists"                     |
      | "Andrea"   | "Lee"       | "756202331012" | "25" | "3207890123" | "andrelee2@example.com"      | "BBB169" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | -2000.0       | 201  | ""                                   |
      | "Andres"   | "Serna"     | "94066202331"  | "25" | "3207890123" | "anser200ha@mail.com"        | "bbb169" | "Toyota" | "Hilux" | "blue"  | "PICKUP" | 2000.0        | 201  | ""                                   |
