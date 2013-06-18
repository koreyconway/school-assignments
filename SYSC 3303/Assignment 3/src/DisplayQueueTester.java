/**
 * Some test code to exercise the DisplayQueue class.
 */
public class DisplayQueueTester {
	public static void main(String[] args) {
		DisplayQueue q = new DisplayQueue();
		Thread client1 = new Client(q, 1, 10);
		Thread client2 = new Client(q, 11, 20);
		Thread client3 = new Client(q, 20, 30);
		client1.start();
		client2.start();
		client3.start();
	}
}