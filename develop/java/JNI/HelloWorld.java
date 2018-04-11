public class HelloWorld {
	public native void displayHelloWorld();

	static {
		System.loadLibrary("HelloWorldImpl");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HelloWorld helloWorld = new HelloWorld();
		helloWorld.displayHelloWorld();
	}
}