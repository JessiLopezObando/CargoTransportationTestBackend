package com.sofkau.utils;

public enum CargoTransportationConstants {

    URL_BASE("https://cargotransportationbackend-production.up.railway.app/"),
    POST_DRIVER("drivers"),
    PUT_DRIVER("drivers/6448b8055ea25a460a913b26");

    private final String  value;

    CargoTransportationConstants(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
