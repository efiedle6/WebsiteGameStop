package mybean;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class OrdersHashMap implements Serializable{
	
	//Same name as professors OrdersHashMap, but completely diff purpose, this one is for tracking Orders that
	//have been completed rather than tracking the Shopping Cart
	public static HashMap<String, ArrayList<Orders>> orders = new HashMap<String, ArrayList<Orders>>();
	//adds int to track order number
	public static int orderNumber = 0;
	
	public OrdersHashMap() {
		
	}
	
	//increments and returns new orderNumber
	public static int incOrderNumber(){
		orderNumber++;
		return orderNumber;
	}
	
	
}