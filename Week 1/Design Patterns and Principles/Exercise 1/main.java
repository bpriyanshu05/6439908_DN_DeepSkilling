public class main {
    public static void main(String[] args) {

        Logger loggerA = Logger.getInstance();
        Logger loggerB = Logger.getInstance();
        loggerA.log("Logging from loggerA");
        loggerB.log("Logging from loggerB");
        
        System.out.println("loggerA == loggerB ? " + (loggerA == loggerB));
    }
}