package mybean;

import java.util.HashMap;

public class ProductData {
    
    private HashMap products = new HashMap();
    

    public HashMap getProducts() {
        return products;
    }
    
    public ProductData() {
        
        products.put("1", new Product("1", "Sony", "PS4","In Stock"));
		products.put("2", new Product("2", "Sony", "PS4 Controller","In Stock"));
		products.put("3", new Product("3", "Sony", "PS4 Charger","In Stock"));
		products.put("4", new Product("4", "Sony", "PS3","In Stock"));
		products.put("5", new Product("5", "Sony", "PS3 Controller","In Stock"));
		products.put("6", new Product("6", "Sony", "PS3 Keypad","In Stock"));
		
		products.put("7", new Product("7", "Microsoft", "XBox 360","In Stock"));
		products.put("8", new Product("8", "Microsoft", "XBox 360 Wireless Adapter","In Stock"));
		products.put("9", new Product("9", "Microsoft", "XBox 360 Speeding Wheel","In Stock"));
		products.put("10", new Product("10", "Microsoft", "XBox One","In Stock"));
		products.put("11", new Product("11", "Microsoft", "XBox One Turtle Beach Headset","In Stock"));
		products.put("12", new Product("12", "Microsoft", "XBox One Controller","In Stock"));
		
		products.put("13", new Product("13", "Nintendo", "wiiU","In Stock"));
		products.put("14", new Product("14", "Nintendo", "wiiU Protective Case","In Stock"));
		products.put("15", new Product("15", "Nintendo", "wiiU Controller","In Stock"));
		products.put("16", new Product("16", "Nintendo", "wii","In Stock"));
		products.put("17", new Product("17", "Nintendo", "wii Wheel","In Stock"));
		products.put("18", new Product("18", "Nintendo", "wii Controller Grip","In Stock"));
		
		products.put("19", new Product("19", "EA", "Need for Speed","In Stock"));
		products.put("20", new Product("20", "EA", "FIFA 2016","In Stock"));
		
		products.put("21", new Product("21", "Activision", "[Prototype]","In Stock"));
		products.put("22", new Product("22", "Activision", "Call Of Duty","In Stock"));
		
		products.put("23", new Product("23", "Take Two Interactive", "Evolve","In Stock"));
		products.put("24", new Product("24", "Take Two Interactive", "Grand Theft Auto V","In Stock"));
		
		products.put("25", new Product("25", "Apple", "Ipad 2","In Stock"));
		products.put("26", new Product("26", "Microsoft", "Tech Republic","In Stock"));
		products.put("27", new Product("27", "Samsung", "Galaxy","Out of Stock"));
        
		products.put("28", new Product("28", "Nintendo", "Wheel, wii","In Stock"));
		products.put("29", new Product("29", "Nintendo", "Controller Grip, wii","In Stock"));
		products.put("30", new Product("30", "Nintendo", "Protective Case, wiiU","In Stock"));
		products.put("31", new Product("31", "Nintendo", "Controller, wiiU","In Stock"));
		products.put("32", new Product("32", "Microsoft", "Turtle Beach Headset, XBox One","In Stock"));
		products.put("33", new Product("33", "Microsoft", "Controller, XBox One","In Stock"));
		products.put("34", new Product("34", "Microsoft", "Wireless Adapter, XBox 360","In Stock"));
		products.put("35", new Product("35", "Microsoft", "Speeding Wheel, XBox 360","In Stock"));
		products.put("36", new Product("36", "Sony", "Controller, PS3","In Stock"));
		products.put("37", new Product("37", "Sony", "Keypad, PS3","In Stock"));
		products.put("38", new Product("38", "Sony", "Controller, PS4","In Stock"));
		products.put("39", new Product("39", "Sony", "Charger, PS4","In Stock"));
    }

}
