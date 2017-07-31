package mybean;
import java.io.*;

//Standard JavaBeans class for Tablets containing all the specified variables
import java.util.HashMap;

public class Tablets implements Serializable{
	private String name;
	private double price;
	private String image;
	private String company;
	private String condition;
	private double discount;
	
	
	public Tablets(String name, double price, String image, String company, String condition,double discount){
		this.name=name;
		this.price=price;
		this.image=image;
		this.condition=condition;
		this.discount = discount;
		this.company = company;
	}
	
	public Tablets(){
		
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
