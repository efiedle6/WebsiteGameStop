package mybean;
import java.io.*;
//Java beans class for Cart items
public class CartItem implements Serializable{
	private String name;
	private String type;
	private double price;
	private String image;
	private String company;
	
	public CartItem(){
		this.name = "";
		this.type = "";
		this.price = 0.0;
		this.image = "";
		this.company = "";
	}
	
	public CartItem(String nameIn, String typeIn, double priceIn, String imageIn, String companyIn){
		this.name = nameIn;
		this.type = typeIn;
		this.price = priceIn;
		this.image = imageIn;
		this.company = companyIn;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String nameIn){
		this.name = nameIn;
	}
	
	public String getType(){
		return this.type;
	}
	
	public void setType(String typeIn){
		this.type = typeIn;
	}
	
	public double getPrice(){
		return this.price;
	}
	
	public void setPrice(double priceIn){
		this.price = priceIn;
	}
	
	public String getImage(){
		return this.image;
	}
	
	public void setImage(String imageIn){
		this.image = imageIn;
	}
	
	public String getCompany(){
		return this.company;
	}
	
	public void setCompany(String companyIn){
		this.company = companyIn;
	}
	
	
	
}