package mybean;
import java.io.*;
import java.util.ArrayList;

public class ReviewsArray implements Serializable{
	//no session checking for this it is site wide
	public static ArrayList<Reviews> reviewList = new ArrayList<Reviews>();
	
	public ReviewsArray() {
		
	}	
}