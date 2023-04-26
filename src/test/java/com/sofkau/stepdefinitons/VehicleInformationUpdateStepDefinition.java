package com.sofkau.stepdefinitons;

import com.sofkau.setup.ApiSetUp;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.log4j.Logger;

public class VehicleInformationUpdateStepDefinition extends ApiSetUp {

    private static final Logger LOGGER = Logger.getLogger(VehicleInformationUpdateStepDefinition.class);

    @Given("the driver is on vehicle information update page")
    public void theDriverIsOnVehicleInformationUpdatePage() {

    }

    @When("the driver fills out the vehicle information form with {string}, {string}, {string}, {string}, {string} and {int}")
    public void theDriverFillsOutTheVehicleInformationFormWithAnd(String string, String string2, String string3, String string4, String string5, Integer int1) {

    }

    @Then("the vehicle information should be successfully updated and the status code response will be {int}")
    public void theVehicleInformationShouldBeSuccessfullyUpdatedAndTheStatusCodeResponseWillBe(Integer int1) {

    }

}
