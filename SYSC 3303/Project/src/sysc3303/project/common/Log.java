package sysc3303.project.common;

public class Log {
	static public void d(String message) {
		System.out.println("Thread #" + Thread.currentThread().getId()
				+ "        " + message);
	}
}
