package mybean;

public class Product {

    private String id;
    private String producer;
    private String item;
    private String stock;
    
    
    public Product (String idIn, String producerIn, String itemIn, String stockIn) {
        this.id = idIn;
        this.producer = producerIn;
        this.item = itemIn;
        this.stock = stockIn;
    }

    public String getStock() {
        return stock;
    }
    
    public String getId() {
        return id;
    }
    
    public String getProducer() {
        return producer;
    }
    
    public String getItem() {
        return item;
    }
}