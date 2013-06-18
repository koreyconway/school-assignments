/**
 * A Client thread creates Integer objects and deposits them in a * work queue,
 * to be printed asynchronously.
 */
class Client extends Thread {
	private DisplayQueue displayQ;
	private int min;
	private int max;

	/**
	 * Creates a Client thread that creates Integer objects Integer(min),
	 * Integer(min+1), ..., Integer(max) and deposits them in the specified
	 * DisplayQueue. *
	 * 
	 * @param workQ
	 *            the DisplayQueue where the Integer objects are enqueued for
	 *            background printing.
	 * @param min
	 *            the value to be wrapped in the first Integer created by this
	 *            thread.
	 * @param max
	 *            the value to be wrapped in the last Integer created by this
	 *            thread.
	 */
	public Client(DisplayQueue displayQ, int min, int max) {
		this.displayQ = displayQ;
		this.min = min;
		this.max = max;
	}

	public void run() {
		System.out.println(Thread.currentThread() + " starting");
		for (int i = min; i <= max; i++) {
			displayQ.enqueue(new Integer(i));
			try {
				sleep(200);
			} catch (InterruptedException e) {
			}
		}
		// Remove the // from the following statement if you want to test the
		// stop() method.
		// displayQ.stop();
		System.out.println(Thread.currentThread() + " terminating");
	}
}
