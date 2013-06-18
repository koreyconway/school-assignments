/**
 * This subclass of WorkQueue prints each workItem on the system * console,
 * printing no more than one item per second, no matter * how frequently items
 * are enqueued.
 */
class DisplayQueue extends WorkQueue {
	protected void processItem(Object workItem) {
		System.out.println(workItem);
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
	}
}
