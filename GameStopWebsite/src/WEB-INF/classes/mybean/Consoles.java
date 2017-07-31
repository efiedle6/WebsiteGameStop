package mybean;
import java.io.*;
import java.util.HashMap;
//Standard JavaBeans class for Consoles containing all the specified variables
public class Consoles implements Serializable{
	private String name;
	private double price;
	private String image;
	private String company;
	private String condition;
	private double discount;
	private HashMap<String,Accessory> accessories = new HashMap<String,Accessory>();

	
	public Consoles(String name, double price, String image, String company,String condition,double discount, HashMap<String,Accessory> accessories){
		this.name=name;
		this.price=price;
		this.image=image;
		this.company = company;
		this.condition=condition;
		this.discount = discount;
		this.setAccessories(accessories);
	}
	
	public Consoles(){
		
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}

	public void setAccessories(HashMap<String,Accessory> accessories) {
		this.accessories = accessories;
	}

	public HashMap<String,Accessory> getAccessories() {
		return accessories;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
}
