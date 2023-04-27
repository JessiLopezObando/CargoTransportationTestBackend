package com.sofkau.stepdefinitons;

import com.sofkau.models.Ticket;
import com.sofkau.setup.ApiSetUp;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Assertions;

import java.util.Objects;

import static com.sofkau.questions.ReturnPostResponse.returnPostResponse;
import static com.sofkau.tasks.DoPost.doPost;
import static com.sofkau.utils.CargoTransportationConstants.*;
import static net.serenitybdd.rest.SerenityRest.lastResponse;
import static net.serenitybdd.screenplay.GivenWhenThen.seeThat;
import static net.serenitybdd.screenplay.rest.questions.ResponseConsequence.seeThatResponse;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.containsString;


public class ServiceRequestStepDefinition extends ApiSetUp {

    private static final Logger LOGGER = Logger.getLogger(ServiceRequestStepDefinition.class);

    Ticket ticket = new Ticket();

    @Given("I am on the URL to make a request")
    public void iAmOnTheURLToMakeARequest() {

        try {
            setUp(URL_BASE.getValue());
            LOGGER.info("Automation has been started on the URL: " + URL_BASE.getValue());
        } catch (Exception e) {
            LOGGER.error("Error starting automation - Details:: " + e.getMessage());
            actor.should(
                    seeThatResponse("The server is not available.",
                            response -> response.statusCode(HttpStatus.SC_OK))
            );
            Assertions.fail();
        }
    }

    @When("I fill out the form with the following information driverId {string}, origin {string}, destination {string}, customerName {string}, customerEmail {string}, packageReceiver {string}, Package Weight {double}, minutes {int} and description {string}")
    public void iFillOutTheFormWithTheFollowingInformationDriverIdOriginDestinationCustomerNameCustomerEmailPackageReceiverPackageWeightMinutesAndDescription(String driverId, String origin, String destination, String customerName, String customerEmail, String packageReceiver, Double weight, Integer minutes, String description) {

        ticket.setDriverId(driverId);
        ticket.setOrigin(origin);
        ticket.setDestination(destination);
        ticket.setCustomerName(customerName);
        ticket.setCustomerEmail(customerEmail);
        ticket.setPackageReceiver(packageReceiver);
        ticket.setWeight(weight);
        ticket.setMinutes(minutes);
        ticket.setDescription(description);


        JSONObject request = new JSONObject();
        request.put("driverID", ticket.getDriverId());
        request.put("customerName", ticket.getCustomerName());
        request.put("customerEmail", ticket.getCustomerEmail());
        request.put("origin", ticket.getOrigin());
        request.put("destination", ticket.getDestination());
        request.put("packageReceiver", ticket.getPackageReceiver());
        request.put("weight", ticket.getWeight());
        request.put("minutes", ticket.getMinutes());
        request.put("description", ticket.getDescription());

        try {
            actor.attemptsTo(

                    doPost()
                            .withTheResource(POST_TICKETS.getValue())
                            .andTheRequestBody(request.toString())
            );

            LOGGER.info("API response to the POST request: " + lastResponse().asString());

        } catch (Exception e) {
            LOGGER.error("An error occurred while sending the POST request: " + e.getMessage());
            e.printStackTrace();
            Assertions.fail();
        }
    }

    @Then("I should be able to create the ticket and the status code should be {int}")
    public void iShouldBeAbleToCreateTheTicketAndTheStatusCodeShouldBe(Integer code) throws ParseException {

        try {
            actor.should(
                    seeThatResponse("The satatus code is: " + code,
                            response -> {
                                response.statusCode(code);
                                LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
                            }
                    ));
        } catch (Exception e){
            LOGGER.error("An error occurred with the assertion: " + e.getMessage());
            LOGGER.info("API response to the POST request: " + lastResponse().statusCode());
            e.printStackTrace();
            Assertions.fail();
        }

    }
}
