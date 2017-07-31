package mybean;
import java.io.*;
//basically a data transfer object
public class Reviews implements Serializable{
	private String productModelName;
	private String productCategory;
	private String productPrice;
	private String retailerName;
	private String zip;
	private String city;
	private String state;
	private String productOnSale;
	private String manufacturerName;
	private String manufacturerRebate;
	private String userID;
	private String userAge;
	private String userGender;
	private String userOccupation;
	private String rating;
	private String date;
	private String reviewText;
	
	
	public Reviews(String productModelName, String productCategory, String productPrice, String retailerName, String zip, String city, String state, String productOnSale,
		String manufacturerName, String manufacturerRebate, String userID,
		String userAge, String userGender, String userOccupation, String rating, String date, String reviewText){
		this.productModelName=productModelName;
		this.productCategory=productCategory;
		this.productPrice=productPrice;
		this.retailerName = retailerName;
		this.zip=zip;
		this.city=city;
		this.state=state;
		this.productOnSale=productOnSale;
		this.manufacturerName= manufacturerName;
		this.manufacturerRebate= manufacturerRebate;
		this.userID = userID;
		this.userAge = userAge;
		this.userGender=userGender;
		this.userOccupation=userOccupation;
		this.rating=rating;
		this.date=date;
		this.reviewText=reviewText;
	}
	
	public Reviews(){
		this.productModelName="";
		this.productCategory="";
		this.productPrice="";
		this.retailerName = "";
		this.zip="";
		this.city="";
		this.state="";
		this.productOnSale="";
		this.manufacturerName= "";
		this.manufacturerRebate= "";
		this.userID = "";
		this.userAge = "";
		this.userGender="";
		this.userOccupation="";
		this.rating="";
		this.date="";
		this.reviewText="";
	}
	
	public String getRetailerName(){
		return retailerName;
	}
	
	public String getProductModelName(){
		return this.productModelName;
	}
	
	public String getProductCategory(){
		return this.productCategory;
	}
	
	public String getProductPrice(){
		return this.productPrice;
	}
	
	public String getZip(){
		return this.zip;
	}
	
	public String getCity(){
		return this.city;
		}
		
	public String getState(){
		return this.state;
		}
		
	public String getProductOnSale(){
		return this.productOnSale;
		}
	
	public String getManufacturerName(){
		return this.manufacturerName;
		}	
		
	public String getManufacturerRebate(){
		return this.manufacturerRebate;
		}
		
	public String getUserID(){
		return this.userID;
		}	
		
	public String getUserAge(){
		return this.userAge;
		}
		
	public String getUserGender(){
		return this.userGender;
		}
		
	public String getUserOccupation(){
		return this.userOccupation;
		}
		
	public String getRating(){
		return this.rating;
		}
		
	public String getDate(){
		return this.date;
		}
		
	public String getReviewText(){
		return this.reviewText;
		}
		

	
}