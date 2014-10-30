package org.sgnexus.sysc3010;

import java.util.Observable;

public class AvengerStateHistory extends Observable {
	StringBuilder mAvengerStates; // implemented as string to avoid issues with
									// Java and deep copy
	static AvengerStateHistory mInstance;

	static AvengerStateHistory getInstance() {
		if (mInstance == null) {
			mInstance = new AvengerStateHistory();
		}

		return mInstance;
	}

	protected AvengerStateHistory() {
		mAvengerStates = new StringBuilder();
	}

	void addState(AvengerState state) {
		mAvengerStates.append(state.toXml());
		mAvengerStates.append("\n");
		setChanged();
	 	notifyObservers();
	}

	@Override
	public String toString() {
		return mAvengerStates.toString();
	}

}
