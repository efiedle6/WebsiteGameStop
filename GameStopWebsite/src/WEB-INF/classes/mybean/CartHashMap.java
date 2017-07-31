package mybean;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import mybean.*;

public class CartHashMap implements Serializable{

	public static HashMap<String, ArrayList<CartItem>> orderList = new HashMap<String, ArrayList<CartItem>>();
	
	public CartHashMap() {
		
	}	
}
