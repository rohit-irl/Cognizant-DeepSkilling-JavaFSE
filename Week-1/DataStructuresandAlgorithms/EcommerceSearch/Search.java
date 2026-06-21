public class Search {

    static Product linearSearch(Product[] products, int id) {
        for(int i = 0; i < products.length; i++) {
            if(products[i].productId == id) {
                return products[i];
            }
        }
        return null;
    }

    static Product binarySearch(Product[] products, int id) {
        int low = 0;
        int high = products.length - 1;
        while(low <= high) {
            int mid = (low + high) / 2;
            if(products[mid].productId == id) {
                return products[mid];
            }
            else if(products[mid].productId < id) {
                low = mid + 1;
            }
            else {
                high = mid - 1;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Mobile", "Electronics"),
            new Product(103, "Shoes", "Fashion"),
            new Product(104, "Watch", "Accessories"),
            new Product(105, "Book", "Education")
        };
        System.out.println("Linear Search Result:");
        Product result1 = linearSearch(products, 103);

        if(result1 != null)
            result1.display();
        else
            System.out.println("Product Not Found");
        System.out.println("\nBinary Search Result:");
        Product result2 = binarySearch(products, 105);
        if(result2 != null)
            result2.display();
        else
            System.out.println("Product Not Found");
    }
}