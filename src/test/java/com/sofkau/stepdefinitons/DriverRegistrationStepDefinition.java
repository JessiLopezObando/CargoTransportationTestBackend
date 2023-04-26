package com.sofkau.stepdefinitons;

import com.sofkau.models.Driver;
import com.sofkau.models.Vehicle;
import com.sofkau.setup.ApiSetUp;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.http.HttpStatus;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Assertions;

import static com.sofkau.tasks.DoPost.doPost;
import static com.sofkau.utils.CargoTransportationConstants.POST_DRIVER;
import static com.sofkau.utils.CargoTransportationConstants.URL_BASE;
import static net.serenitybdd.rest.SerenityRest.lastResponse;
import static net.serenitybdd.screenplay.GivenWhenThen.seeThat;
import static net.serenitybdd.screenplay.rest.questions.ResponseConsequence.seeThatResponse;
import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.CoreMatchers.notNullValue;

public class DriverRegistrationStepDefinition extends ApiSetUp {

    private static final Logger LOGGER = Logger.getLogger(DriverRegistrationStepDefinition.class);

    Driver driver = new Driver();
    Vehicle vehicle = new Vehicle();

    @Given("I am on the registration page")
    public void iAmOnTheRegistrationPage() {

        try {
            setUp(URL_BASE.getValue());
            LOGGER.info("Automation has been started on the URL: " + URL_BASE.getValue());
        } catch (Exception e) {
            LOGGER.error("Error starting automation - Details:: "+ e.getMessage());
            actor.should(
                    seeThatResponse("The server is not available.",
                            response -> response.statusCode(HttpStatus.SC_OK))
            );
            Assertions.fail();
        }
    }

    @When("I fill in the required fields {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {double}")
    public void iFillInTheRequiredFields(String name, String lastname, String DNI, String age, String phonenumber, String email, String password, String plate, String brand, String model, String color, String type, Double totalCapacity) {
        driver.setName(name);
        driver.setLastName(lastname);
        driver.setDni(DNI);
        driver.setAge(age);
        driver.setPhone(phonenumber);
        driver.setEmail(email);

        vehicle.setPlate(plate);
        vehicle.setBrand(brand);
        vehicle.setModel(model);
        vehicle.setColor(color);
        vehicle.setType(type);
        vehicle.setTotalCapacity(totalCapacity);

        JSONObject request = new JSONObject();
        request.put("name", driver.getName());
        request.put("lastName", driver.getLastName());
        request.put("dni", driver.getDni());
        request.put("email", driver.getEmail());
        request.put("phone", driver.getPhone());
        request.put("age", driver.getAge());

        JSONObject vehicleJson = new JSONObject();
        vehicleJson.put("plate", vehicle.getPlate());
        vehicleJson.put("brand", vehicle.getBrand());
        vehicleJson.put("model", vehicle.getModel());
        vehicleJson.put("color", vehicle.getColor());
        vehicleJson.put("type", vehicle.getType());
        vehicleJson.put("totalCapacity", vehicle.getTotalCapacity());

        request.put("vehicle", vehicleJson);

        try {
            actor.attemptsTo(

                    doPost()
                            .withTheResource(POST_DRIVER.getValue())
                            .andTheRequestBody(request.toString())
            );

            LOGGER.info("API response to the POST request: " + lastResponse().asString());

        } catch (Exception e) {
            LOGGER.error("An error occurred while sending the POST request: " + e.getMessage());
            e.printStackTrace();
            Assertions.fail();
        }
    }

    @Then("the response status code should be {int} and return a {string}")
    public void theResponseStatusCodeShouldBeAndReturnA(Integer code, String message){

       try {
           actor.should(
                   seeThatResponse("The satatus code is: " + code,
                           response -> {
                               response.statusCode(code);
                               LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
                           }
                   ),
                   seeThat("The returned message is: ", act -> lastResponse().body().asString(),
                           containsString(message))
           );
       } catch (Exception e){
           LOGGER.error("An error occurred with the assertion: " + e.getMessage());
           LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
           e.printStackTrace();
           Assertions.fail();
       }


    }

}
