package com.sofkau.utils;

public enum CargoTransportationConstants {

    URL_BASE("https://cargotransportationbackend-production.up.railway.app/"),
    POST_DRIVER("drivers"),
    PUT_DRIVER("drivers/64497e6a5ea25a460a913b3a");

    private final String  value;

    CargoTransportationConstants(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
