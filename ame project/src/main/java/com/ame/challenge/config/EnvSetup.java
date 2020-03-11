package com.ame.challenge.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class EnvSetup {

	private static EnvSetup instance;
	public Properties prop;

	private void readProperties() throws IOException {
		InputStream input = new FileInputStream("env.properties");
		prop = new Properties();
		prop.load(input);
	}

	private EnvSetup() {

	}

	public static EnvSetup getInstance() throws IOException {
		if (instance == null) {
			instance =  new EnvSetup();
			instance.readProperties();
		}
		return instance;
	}
}
