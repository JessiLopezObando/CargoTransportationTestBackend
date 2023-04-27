package com.sofkau.stepdefinitons;

import com.sofkau.models.Driver;
import com.sofkau.models.Vehicle;
import com.sofkau.setup.ApiSetUp;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.http.HttpStatus;
import org.apache.log4j.Logger;
import org.jetbrains.annotations.NotNull;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Assertions;

import static com.sofkau.utils.CargoTransportationConstants.PUT_DRIVER;
import static com.sofkau.utils.CargoTransportationConstants.URL_BASE;
import static net.serenitybdd.rest.SerenityRest.lastResponse;
import static net.serenitybdd.screenplay.GivenWhenThen.seeThat;
import static net.serenitybdd.screenplay.rest.questions.ResponseConsequence.seeThatResponse;
import static com.sofkau.tasks.DoPut.doPut;
import static org.hamcrest.CoreMatchers.containsString;

public class VehicleInformationUpdateStepDefinition extends ApiSetUp {

    private static final Logger LOGGER = Logger.getLogger(VehicleInformationUpdateStepDefinition.class);
    Driver driver = new Driver();
    Vehicle vehicle = new Vehicle();

    @Given("the driver is on vehicle information update page")
    public void theDriverIsOnVehicleInformationUpdatePage() {
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

    @When("the driver fills out the vehicle information form with {string}, {string}, {string}, {string}, {string}, {string} {string}, {string}, {string}, {string}, {string} and {double}")
    public void theDriverFillsOutTheVehicleInformationFormWithAnd(String name, String lastname, String DNI, String age, String phonenumber, String email, String plate, String brand, String model, String color, String type, Double totalCapacity){
        try {
            JSONObject request = getJsonObject(name, lastname, DNI, age, phonenumber, email, plate, brand, model, color, type, totalCapacity);

            actor.attemptsTo(
                    doPut()
                            .withResource(PUT_DRIVER.getValue())
                            .andTheRequestBody(request.toString())
            );
        } catch (Exception e){
            LOGGER.error("An error occurred while sending the Put request: " + e.getMessage());
            e.printStackTrace();
            Assertions.fail();
        }
    }

    @Then("the vehicle information should be successfully updated, the status code response will be {int}")
    public void theVehicleInformationShouldBeSuccessfullyUpdatedTheStatusCodeResponseWillBe(Integer code){
        try {
            actor.should(
                    seeThatResponse("The satatus code is: " + code,
                            response -> {
                                response.statusCode(code);
                                LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
                            }
                    )
            );
        } catch (Exception e){
            LOGGER.error("An error occurred with the assertion: " + e.getMessage());
            LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
            e.printStackTrace();
            Assertions.fail();
        }

    }

    @NotNull
    private JSONObject getJsonObject(String name, String lastname, String DNI, String age, String phonenumber, String email, String plate, String brand, String model, String color, String type, Double totalCapacity) {
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
        return request;
    }

}
