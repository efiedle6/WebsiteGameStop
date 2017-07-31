package mybean;
import java.io.*;
import java.util.HashMap;

public class GameCompaniesHashMap implements Serializable{

	public static HashMap<String, GameCompanies> electronicArts = new HashMap<String, GameCompanies>();
	public static HashMap<String, GameCompanies> activision = new HashMap<String, GameCompanies>();
	public static HashMap<String, GameCompanies> takeTwoInteractive = new HashMap<String, GameCompanies>();
	
	public static String string_electronicArts = "Electronic Arts";
	public static String string_activision = "Activision";
	public static String string_takeTwoInteractive = "Take-Two Interactive";
	
	public GameCompaniesHashMap() {
		if(electronicArts.isEmpty()){
			GameCompanies ea_fifa = new GameCompanies("FIFA 2016",59.99,"ea_fifa.jpg","Electronic Arts","New",10);
			electronicArts.put("ea_fifa", ea_fifa);
			
			GameCompanies ea_nfs = new GameCompanies("Need for Speed",59.99,"ea_nfs.jpg","Electronic Arts","New",10);
			electronicArts.put("ea_nfs", ea_nfs);
		}
		
		if(activision.isEmpty()){
			GameCompanies activision_cod = new GameCompanies("Call Of Duty",44.99,"activision_cod.jpg","Activision","Used",10);
			activision.put("activision_cod", activision_cod);
			
			GameCompanies activision_prot = new GameCompanies("[Prototype]",44.99,"activision_prot.jpg","Activision","Used",10);
			activision.put("activision_prot", activision_prot);
			
		}
		
		if(takeTwoInteractive.isEmpty()){

			GameCompanies tti_evolve = new GameCompanies("Evolve",49.99,"tti_evolve.jpg","Take-Two Interactive","Used",10);
			takeTwoInteractive.put("tti_evolve", tti_evolve);
			
			GameCompanies tti_gta = new GameCompanies("Grand Theft Auto V",59.99,"tti_gta.jpg","Take-Two Interactive","New",10);
			takeTwoInteractive.put("tti_gta", tti_gta);
		}
	}
}
