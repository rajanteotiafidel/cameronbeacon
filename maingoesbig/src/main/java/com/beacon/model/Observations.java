package com.beacon.model;

public class Observations {
	
	private AdvertisedId advertisedId;
	private String telemetry;

	public AdvertisedId getAdvertisedId() {
		return advertisedId;
	}

	public void setAdvertisedId(AdvertisedId advertisedId) {
		this.advertisedId = advertisedId;
	}

	public String getTelemetry() {
		return telemetry;
	}

	public void setTelemetry(String telemetry) {
		this.telemetry = telemetry;
	}

}
