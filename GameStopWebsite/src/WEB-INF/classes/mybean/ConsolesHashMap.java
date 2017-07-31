package mybean;
import java.io.*;
import java.util.HashMap;

public class ConsolesHashMap implements Serializable{
	public static HashMap<String, Consoles> microsoft = new HashMap<String, Consoles>();
	public static HashMap<String, Consoles> sony = new HashMap<String, Consoles>();
	public static HashMap<String, Consoles> nintendo = new HashMap<String, Consoles>();
	
	public static String string_microsoft = "Microsoft";
	public static String string_sony = "Sony";
	public static String string_nintendo = "Nintendo";
	
	public ConsolesHashMap() {
		HashMap<String, Accessory> accessories;
		if(microsoft.isEmpty()){
			Accessory xboxone_wc = new Accessory("Controller", 24.99, "XBOX controller.jpg", "Microsoft","New",10);
			Accessory xboxone_sh = new Accessory("Turtle Beach Headset", 34.99, "Turtle Beach Headset.jpg", "Microsoft","New",10);
			accessories = new HashMap<String, Accessory>();
			accessories.put("xboxone_wc", xboxone_wc);
			accessories.put("xboxone_sh", xboxone_sh);			
			Consoles xboxone = new Consoles("XBox One",349.00,"xbox1.jpg","Microsoft","New",10,accessories);
			microsoft.put("XBox One", xboxone);
			
			Accessory xbox360_mr = new Accessory("Speeding Wheel", 20.00, "XBOX360-SpeedWheel.jpg", "Microsoft","New",10);
			Accessory xbox360_wa = new Accessory("Wireless Adapter", 35.00, "xbox360_wa.png", "Microsoft","New",10);
			accessories = new HashMap<String, Accessory>();
			accessories.put("xbox360_mr", xbox360_mr);
			accessories.put("xbox360_wa", xbox360_wa);
			Consoles xbox360 = new Consoles("XBox 360",199.00,"xbox360.jpg","Microsoft","New",10,accessories);			
			microsoft.put("XBox 360", xbox360);
		}

		if(sony.isEmpty()){			

			Accessory ps4_wc = new Accessory("Controller", 24.99, "ps4 controller.jpg", "Sony", "New", 5.99);
			Accessory ps4_ch = new Accessory("Charger", 20.00, "ps4 charger.jpg", "Sony", "New", 4.00);
			accessories = new HashMap<String, Accessory>();
			accessories.put("ps4_wc", ps4_wc);
			accessories.put("ps4_ch", ps4_ch);
			Consoles ps4 = new Consoles("PS4",399.00,"PS4-console-bundle.jpg","Sony","New",10,accessories);
			sony.put("PS4", ps4);	

			Accessory ps3_wc = new Accessory("Controller", 14.99, "ps3 controller.jpg", "Sony", "Used", 3.99);
			Accessory ps3_ke = new Accessory("Keypad", 10.00, "ps3 keypad.jpg", "Sony", "Used", 2.00);
			accessories = new HashMap<String, Accessory>();
			accessories.put("ps3_wc", ps3_wc);
			accessories.put("ps3_ke", ps3_ke);
			Consoles ps3 = new Consoles("PS3",299.00,"PS3.jpg","Sony","Used",10,accessories);
			sony.put("PS3", ps3);
		}

		if(nintendo.isEmpty()){
			Accessory wii_gr = new Accessory("Controller Grip", 12.99, "wii grip.jpg", "Nintendo", "Used", 2.99);
			Accessory wii_wh = new Accessory("Wheel", 19.99, "wii wheel.jpg", "Nintendo", "Used", 3.00);
			accessories = new HashMap<String, Accessory>();
			accessories.put("wii_gr", wii_gr);
			accessories.put("wii_wh", wii_wh);
			Consoles wii = new Consoles("wii",199.00,"wii.jpg","Nintendo","used",30,accessories);
			nintendo.put("wii", wii);	
			
			Accessory wiiU_wc = new Accessory("Controller", 34.99, "wiiU controller.jpg", "Nintendo", "New", 4.99);
			Accessory wiiU_ca = new Accessory("wiiU Protective Case", 40.00, "wiiU case.jpg", "Nintendo", "New", 4.00);
			accessories = new HashMap<String, Accessory>();
			accessories.put("wiiU_wc", wiiU_wc);
			accessories.put("wiiU_ca", wiiU_ca);
			Consoles wiiU = new Consoles("wiiU",349.00,"wiiU.jpg","Nintendo","New",15,accessories);
			nintendo.put("wiiU", wiiU);	
		}
	}
}
