package com.NoteTaker.ServiceProvider;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;
	
	public static SessionFactory getSessionFactory() {
		factory = new Configuration().configure().buildSessionFactory();
		return factory;
	}
	
	public static void closeFectory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
}
