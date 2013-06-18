import java.util.LinkedList;

/**
 * This class is similar to the WorkQueue class presented in class. The major
 * difference is that the boolean variable used * to stop the WorkerThread has
 * been moved from WorkerThread to * WorkQueue. When clients no longer need the
 * WorkQueue, they invoke stop() * to ask the WorkerThread to terminate
 * gracefully, regardless of * how many work items remain in the WorkQueue.
 */
abstract class WorkQueue {
	private LinkedList<Object> queue = new LinkedList<Object>();
	private boolean stopRequested = false;

	protected WorkQueue() {
		new WorkerThread().start();
	}

	public final void enqueue(Object workItem) {
		synchronized (queue) {
			queue.add(workItem);
			queue.notify();
		}
	}

	public final void stop() {
		synchronized (queue) {
			stopRequested = true;
			queue.notify();
		}
	}

	protected abstract void processItem(Object workItem);

	private class WorkerThread extends Thread {
		public void run() {
			Object workItem = null;
			while (true) {
				synchronized (queue) {
					try {
						while (queue.isEmpty() && !stopRequested)
							queue.wait();
					} catch (InterruptedException e) {
						return;
					}
					if (stopRequested)
						return;
					workItem = queue.removeFirst();
				} // end of critical section
				processItem(workItem);
			}
		}
	}
}