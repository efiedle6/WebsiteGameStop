package mybean;
import java.io.*;
//Standard JavaBeans class for user with necessary parameters
public class User implements Serializable{
	private String name;
	private String password;
	private String userPermissions;
	
	public User(){
		this.name = "";
		this.password = "";
		this.userPermissions = "";
	}
	
	public User(String nameIn, String passwordIn, String userPermissionsIn){
		this.name = nameIn;
		this.password = passwordIn;
		this.userPermissions = userPermissionsIn;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String nameIn){
		this.name = nameIn;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String passwordIn){
		this.password= passwordIn;
	}
	
	public String getUserPermissions(){
		return this.userPermissions;
	}
	
	public void setUserPermissions(String userPermissionsIn){
		this.userPermissions = userPermissionsIn;
	}
	
	
	
	
}