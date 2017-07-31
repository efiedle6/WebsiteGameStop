package mybean;
import java.io.*;
//Java beans class for Order items (Only getters as there is no reason for setters as that would
//mean you are changing the data on the order that has already been submitted)
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;

public class Orders implements Serializable{
	private String orderID;
	private String name;
	private String address;
	private String cardNumber;
	private int numItems;
	private double totalCost;
	private ArrayList<CartItem> cart;
	//time related variables
	private Date orderTime;
	private Date deliverTime;
	private Date cancelDueTime;
	
	public Orders(String orderIDIn, String nameIn, String addressIn, String cardNumberIn, 
			int numItemsIn, double totalCostIn, ArrayList<CartItem> cartIn,
			Date orderTimeIn, Date deliverTimeIn, Date cancelDueTimeIn){
		this.orderID = orderIDIn;
		this.name = nameIn;
		this.address = addressIn;
		this.cardNumber = cardNumberIn;
		this.numItems = numItemsIn;
		this.totalCost = totalCostIn;
		this.cart = cartIn;
		this.orderTime = orderTimeIn;
		this.deliverTime = deliverTimeIn;
		this.cancelDueTime = cancelDueTimeIn;
	}

	public Orders(){

	}
	
	
	public String getOrderID(){
		return this.orderID;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getAddress(){
		return this.address;
	}
	
	public String getCardNumber(){
		return this.cardNumber;
	}
	
	public int getNumItems(){
		return this.numItems;
	}
	
	public double getTotalCost(){
		return this.totalCost;
	}
	
	public ArrayList<CartItem> getCart(){
		return this.cart;
	}
	
	public Date getOrderTime(){
		return this.orderTime;
	}
	
	public Date getDeliverTime(){
		return this.deliverTime;
	}
	
	public Date getCancelDueTime(){
		return this.cancelDueTime;
	}
	
	
}