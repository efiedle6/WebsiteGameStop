package mybean;
import java.io.*;
import java.util.HashMap;

public class TabletHashMap implements Serializable{
	public static HashMap<String, Tablets> apple = new HashMap<String, Tablets>();
	public static HashMap<String, Tablets> microsoft = new HashMap<String, Tablets>();
	public static HashMap<String, Tablets> samsung = new HashMap<String, Tablets>();
	
	public static String string_apple = "Apple";
	public static String string_microsoft = "Microsoft";
	public static String string_samsung = "Samsung";
	
	public TabletHashMap() {
		if(apple.isEmpty()){
			Tablets apple_ip2 = new Tablets("Apple Ipad 2", 199.99, "appleTab.jpg", "Apple", "New", 15);
			apple.put("apple_ip2", apple_ip2);
		}
		if(microsoft.isEmpty()){
			Tablets micro_tech = new Tablets("Microsoft Tech Republic", 249.99, "microTab.jpg", "Microsoft", "New", 15);
			microsoft.put("micro_tech", micro_tech);
		}
		if(samsung.isEmpty()){
			Tablets samsung_gal = new Tablets("Samsung Galaxy", 299.99, "samsungTab.jpg", "Samsung", "New", 25);
			samsung.put("samsung_gal", samsung_gal);
		}
	}
}
