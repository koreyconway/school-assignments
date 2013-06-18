package sysc2003.assignment2;

import java.util.Random;

/**
 * @author Korey Conway (100838924)
 */
public class AgentThread extends Thread {
	protected Ingredient[] ingredientsOnTable = new Ingredient[2];
	protected int sandwichesMade = 0;
	protected int maxSandwiches = 20;
	protected Random rnd = new Random();
	protected static Ingredient[] allIngredients = Ingredient.values();
	protected boolean ingredientsAreOnTable = false;
	public static AgentThread agentThread;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Start and store the agent thread
		agentThread = new AgentThread();
		agentThread.start();

		// Start the chefs (one for each ingredient)
		for (Ingredient ingredient : allIngredients) {
			new ChefThread(ingredient).start();
		}
	}

	public void run() {
		while (!finishedMakingSandwiches()) {
			putIngredientsOnTable();
		}

		// Print out the total number of sandwiches that were made
		System.out.printf("A total of %d sandwiches have been made.%n",
				sandwichesMade);
	}

	public void putIngredientsOnTable() {
		Ingredient[] ingredients = new Ingredient[2];

		// Pick a random ingredient
		ingredients[0] = allIngredients[rnd.nextInt(allIngredients.length)];

		// Pick a second random ingredient different from the first
		do {
			ingredients[1] = allIngredients[rnd.nextInt(allIngredients.length)];
		} while (ingredients[0] == ingredients[1]);

		// Get the lock and put them on the table
		synchronized (this) {
			try {
				while (ingredientsAreOnTable()) {
					wait();
				}

				// Put the new ingredients on the table
				this.ingredientsOnTable = ingredients;
				this.setIngredientsAreOnTable(true);
				
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			// Notify that we are releasing the lock
			notifyAll();
		}
	}

	/**
	 * Getter method for ingredientsAreOnTable
	 * 
	 * @return a boolean value stating whether there are ingredients on the
	 *         table or not
	 */
	public boolean ingredientsAreOnTable() {
		return ingredientsAreOnTable;
	}

	/**
	 * Setter method for ingredientsAreOnTable
	 * 
	 * @param ingredientsAreOnTable
	 */
	public void setIngredientsAreOnTable(boolean ingredientsAreOnTable) {
		this.ingredientsAreOnTable = ingredientsAreOnTable;
	}

	/**
	 * Increment the number of sandwiches made
	 * 
	 * @return the new number of sandwiches made
	 */
	synchronized public int incrementSandwichesMade() {
		return sandwichesMade++;
	}

	/**
	 * Get an array of the ingredients that are on the table
	 * 
	 * @return array of ingredients on the table
	 */
	synchronized public Ingredient[] getIngredientsOnTable() {
		return this.ingredientsOnTable;
	}

	/**
	 * Check if the limit for the number of sandwiches we can make has been
	 * reached
	 * 
	 * @return true if we have reached (or passed) maxSandwiches
	 */
	public boolean finishedMakingSandwiches() {
		return (sandwichesMade >= maxSandwiches);
	}

}
