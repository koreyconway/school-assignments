package sysc2003.assignment2;

/**
 * @author Korey Conway (100838924)
 */
public class ChefThread extends Thread {
	protected Ingredient unlimitedIngredient;
	protected int sandwichesMade = 0;

	/**
	 * Create a chef thread with an unlimited ingredient
	 */
	public ChefThread(Ingredient unlimitedIngredient) {
		this.unlimitedIngredient = unlimitedIngredient;
	}

	/**
	 * Make sandwiches when possible :D
	 */
	public void run() {
		AgentThread agent = AgentThread.agentThread;
		while (!agent.finishedMakingSandwiches()) {
			synchronized (agent) {
				try {
					// Wait until there are ingredients on the table or we are
					// done making sandwiches
					while (!agent.ingredientsAreOnTable()
							&& !agent.finishedMakingSandwiches()) {
						agent.wait();
					}

					// Check if all sandwiches are done
					if (!agent.finishedMakingSandwiches()) {
						// Check if they are the ingredients we need
						boolean canMakeSandwich = true;
						for (Ingredient ing : agent.getIngredientsOnTable()) {
							if (ing == this.unlimitedIngredient) {
								canMakeSandwich = false;
								break;
							}
						}

						// Make a sandwich
						if (canMakeSandwich) {
							agent.incrementSandwichesMade();
							agent.setIngredientsAreOnTable(false);
							sandwichesMade++;
						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

				// Notify other threads that we are releasing the lock
				agent.notifyAll();
			}
		}

		// Outpute the total count of sandwiches we made
		System.out.printf("The %s chef made %d sandwiches.%n",
				unlimitedIngredient.toString(), sandwichesMade);
	}
}
