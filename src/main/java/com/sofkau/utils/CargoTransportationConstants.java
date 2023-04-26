package com.sofkau.utils;

public enum CargoTransportationConstants {

    URL_BASE("https://cargotransportationbackend-production.up.railway.app/"),
    POST_DRIVER("drivers");

    private final String  value;

    CargoTransportationConstants(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
