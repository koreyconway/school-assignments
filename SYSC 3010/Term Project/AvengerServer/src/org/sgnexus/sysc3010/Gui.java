package org.sgnexus.sysc3010;

import javax.swing.*;
import javax.swing.event.*;

import org.xml.sax.SAXException;

import java.awt.*;
import java.awt.event.*;
import java.util.Observable;
import java.util.Observer;

public class Gui extends JPanel implements ActionListener, Observer {

	JButton LEDButton, gripperO, gripperC, wristU, wristD, elbowU, elbowD,
			shoulderU, shoulderD, baseCW, baseCCW;
	Timer LEDT, GOT, GCT, BT1, BCCW, SUT, SDT, EDT, EUT, WUT, WDT;
	JTextArea text;
	Server mServer;
	int mResendInterval;

	boolean GOTest = false;
	boolean GCTest = false;
	boolean BCCWTest = false;
	boolean BCWTest = false;
	boolean SUTest = false;
	boolean SDTest = false;
	boolean EDTest = false;
	boolean EUTest = false;
	boolean WUTest = false;
	boolean WDTest = false;

	boolean LedOn = false;

	protected AvengerState mState;
	protected AvengerStateHistory mHistory;
	protected Motor mBaseMotor;

	// constructor of the class. When it is called it will creates a tab panel.
	// The tab will include a panel that displays a picture of the robot arm in
	// the
	// background and text area that keep track of robot arm's movement.
	// @Override
	public Gui() throws ServerException, SAXException, SecurityException {
		// creating a tab pane and a normal panel
		JTabbedPane tab = new JTabbedPane();
		JPanel panel = new JPanel(false);
		// creating a label that contains the background
		JLabel background = new JLabel(new ImageIcon("img/gui_bg.jpg"));
		// set bounds on the background and layout to null
		// so texts and buttons can be added to specific position later
		background.setBounds(0, 0, 790, 500);
		background.setLayout(null);
		// add the buttons and texts to the background and
		// add the everything to the tab

		// temp.setActionCommand(com);

		addToBG(background);
		panel.add(background);
		tab.addTab("control", panel);
		// adding a text area for history to the tab
		historyTab(tab);

		// set the size of the tab
		setPreferredSize(new Dimension(850, 600));
		add(tab);
		// Initialize server
		mServer = new Server();
		mServer.start();
		mResendInterval = Config.getInstance().getResendTimeout();
		mState = Config.getInstance().getAvengerState();
		mHistory = AvengerStateHistory.getInstance();
		mHistory.addObserver(this);
		updateState();
	}

	public void addToBG(JLabel background) {
		// adding label and buttons for the base
		addLabel(background, "Base", 215, 275, 100, 100);
		baseCW = new JButton("CW");
		baseCW.setLocation(157, 335);
		baseCW.setSize(75, 25);
		BT1 = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI, "base",
							Motor.State.FORWARD);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called base.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		BT1.setCoalesce(true);
		BT1.setRepeats(true);
		baseCW.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (baseCW.getModel().isPressed()) {
					BT1.start();
					BCWTest = true;
				} else if (BCWTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"base", Motor.State.OFF);

						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called base.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					BCWTest = false;
				} else {
					BT1.stop();
				}
			}
		});
		background.add(baseCW);

		baseCCW = new JButton("CCW");
		baseCCW.setLocation(233, 335);
		baseCCW.setSize(75, 25);
		BCCW = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI, "base",
							Motor.State.REVERSE);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called base.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}

			}
		});
		BCCW.setCoalesce(true);
		BCCW.setRepeats(true);
		baseCCW.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (baseCCW.getModel().isPressed()) {
					BCCW.start();
					BCCWTest = true;
				} else if (BCCWTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"base", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called base.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					BCCWTest = false;
				} else {
					BCCW.stop();
				}
			}
		});
		background.add(baseCCW);

		// adding label and buttons for the shoulder
		addLabel(background, "Shoulder", 240, 175, 100, 100);
		shoulderU = new JButton("Up");
		shoulderU.setLocation(233, 235);
		shoulderU.setSize(75, 25);
		SUT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"shoulder", Motor.State.FORWARD);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called shoulder.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		SUT.setCoalesce(true);
		SUT.setRepeats(true);
		shoulderU.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (shoulderU.getModel().isPressed()) {
					SUT.start();
					SUTest = true;
				} else if (SUTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"shoulder", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called shoulder.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}

					SUTest = false;
				} else {
					SUT.stop();
				}
			}
		});
		background.add(shoulderU);

		shoulderD = new JButton("Down");
		shoulderD.setLocation(233, 262);
		shoulderD.setSize(75, 25);
		SDT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"shoulder", Motor.State.REVERSE);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called shoulder.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		SDT.setCoalesce(true);
		SDT.setRepeats(true);
		shoulderD.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (shoulderD.getModel().isPressed()) {
					SDT.start();
					SDTest = true;
				} else if (SDTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"shoulder", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called shoulder.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					SDTest = false;
				} else {
					SDT.stop();
				}
			}
		});
		background.add(shoulderD);

		// adding label and buttons for the elbow
		addLabel(background, "Elbow", 595, 40, 100, 100);
		elbowU = new JButton("Up");
		elbowU.setLocation(580, 100);
		elbowU.setSize(75, 25);
		EUT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"elbow", Motor.State.FORWARD);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called elbow.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		EUT.setCoalesce(true);
		EUT.setRepeats(true);
		elbowU.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (elbowU.getModel().isPressed()) {
					EUT.start();
					EUTest = true;
				} else if (EUTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"elbow", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called elbow.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					EUTest = false;
				} else {
					EUT.stop();
				}
			}
		});
		background.add(elbowU);

		elbowD = new JButton("Down");
		elbowD.setLocation(580, 127);
		elbowD.setSize(75, 25);
		EDT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"elbow", Motor.State.REVERSE);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called elbow.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		EDT.setCoalesce(true);
		EDT.setRepeats(true);
		elbowD.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (elbowD.getModel().isPressed()) {
					EDT.start();
					EDTest = true;
				} else if (EDTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"elbow", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called elbow.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					EDTest = false;
				} else {
					EDT.stop();
				}
			}
		});
		background.add(elbowD);

		// adding label and buttons for the wrist
		addLabel(background, "Wrist", 392, 0, 100, 100);
		wristU = new JButton("Up");
		wristU.setLocation(337, 59);
		wristU.setSize(75, 25);
		WUT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"wrist", Motor.State.FORWARD);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called wrist.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		WUT.setCoalesce(true);
		WUT.setRepeats(true);
		wristU.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (wristU.getModel().isPressed()) {
					WUT.start();
					WUTest = true;
				} else if (WUTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"wrist", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called wrist.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					WUTest = false;
				} else {
					WUT.stop();
				}
			}
		});
		background.add(wristU);

		wristD = new JButton("Down");
		wristD.setLocation(414, 59);
		wristD.setSize(75, 25);
		WDT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"wrist", Motor.State.REVERSE);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called wrist.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		WDT.setCoalesce(true);
		WDT.setRepeats(true);
		wristD.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (wristD.getModel().isPressed()) {
					WDT.start();
					WDTest = true;
				} else if (WDTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"wrist", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called wrist.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					WDTest = false;
				} else {
					WDT.stop();
				}
			}
		});
		background.add(wristD);

		// adding label and buttons for the
		addLabel(background, "Gripper", 103, 0, 100, 100);
		gripperC = new JButton("Close");
		gripperC.setLocation(94, 85);
		gripperC.setSize(75, 25);
		GCT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"gripper", Motor.State.FORWARD);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called gripper.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		GCT.setCoalesce(true);
		GCT.setRepeats(true);
		gripperC.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (gripperC.getModel().isPressed()) {
					GCT.start();
					GCTest = true;
				} else if (GCTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"gripper", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called hawkeye.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					GCTest = false;
				} else {
					GCT.stop();
				}
			}
		});
		background.add(gripperC);

		gripperO = new JButton("Open");
		gripperO.setLocation(94, 59);
		gripperO.setSize(75, 25);
		GOT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					mState.setMotorState(AvengerState.ControllerId.GUI,
							"gripper", Motor.State.REVERSE);
					mServer.sendState();
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the motor with a name called gripper.");
				} catch (SecurityException SecE) {
					System.out
							.println("Other user is controlling this robot component right now, please wait for them to finish.");

				}
			}
		});
		GOT.setCoalesce(true);
		GOT.setRepeats(true);
		gripperO.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (gripperO.getModel().isPressed()) {
					GOT.start();
					GOTest = true;
				} else if (GOTest) {
					try {
						mState.setMotorState(AvengerState.ControllerId.GUI,
								"gripper", Motor.State.OFF);
						mServer.sendState();
					} catch (NullPointerException NPE) {
						System.out
								.println("Can't find the motor with a name called gripper.");
					} catch (SecurityException SecE) {
						System.out
								.println("Other user is controlling this robot component right now, please wait for them to finish.");

					}
					GOTest = false;
				} else {
					GOT.stop();
				}
			}
		});
		background.add(gripperO);
		addLabel(background, "LED", 160, 190, 100, 100);
		LEDButton = new JButton("LED");
		LEDButton.setLocation(135, 251);
		LEDButton.setSize(75, 25);
		LEDT = new Timer(mResendInterval, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					if (mState.getLed("hawkeye").getState()
							.equals(Led.State.OFF)) {
						try {
							mState.setLedState(AvengerState.ControllerId.GUI,
									"hawkeye", Led.State.ON);
							mServer.sendState();
						} catch (SecurityException SecE) {
							System.out
									.println("Other user is controlling this robot component right now, please wait for them to finish.");

						}
					} else {
						try {
							mState.setLedState(AvengerState.ControllerId.GUI,
									"hawkeye", Led.State.OFF);
							mServer.sendState();
						} catch (SecurityException SecE) {
							System.out
									.println("Other user is controlling this robot component right now, please wait for them to finish.");

						}
					}
				} catch (NullPointerException NPE) {
					System.out
							.println("Can't find the LED with a name called hawkeye.");
				}
			}
		});
		LEDT.setCoalesce(true);
		LEDT.setRepeats(false);
		LEDButton.getModel().addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				if (LEDButton.getModel().isPressed()) {
					LEDT.start();
				}
			}
		});
		background.add(LEDButton);
	}

	// method for creating a label and add it to the background
	public void addLabel(JLabel background, String name, int x, int y,
			int width, int height) {
		JLabel temp = new JLabel(name);
		temp.setLocation(x, y);
		temp.setSize(width, height);
		background.add(temp);
	}

	// creating a text area to display the movement of the robot arm
	// and add it to the tab
	public void historyTab(JTabbedPane tab) {
		JPanel historyP = new JPanel(false);
		text = new JTextArea();
		// adding a scroll bar to the text area
		JScrollPane scroll = new JScrollPane(text);
		// set the size of the text area
		scroll.setPreferredSize(new Dimension(805, 530));
		text.setEditable(false);
		// a for loop that helps to show the scroll bar(for demonstration
		// purpose)
		/*
		 * for (int i = 0; i <= 1000; i++) { temp1 = "\n" + i;
		 * text.append(temp1); }
		 */
		// adding the text area to the tab
		historyP.add(scroll);
		tab.addTab("History", historyP);
	}

	// method for append string to the text area
	public void appendText(String textAdd) {
		text.append(textAdd);
	}

	// creating GUI
	public static void createGUI() {
		JFrame mainFrame = new JFrame("robotic arm");
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		try {
			mainFrame.add(new Gui());
		} catch (ServerException e) {
			System.out.println("Fail to connect to the server");
			e.printStackTrace();
		} catch (SAXException e) {
			System.out.println("SAX error occured");
			e.printStackTrace();
		} catch (SecurityException e) {
			System.out
					.println("Other user is controlling this robot component right now, please wait for them to finish.");
			e.printStackTrace();
		}
		mainFrame.pack();
		mainFrame.setVisible(true);
	}

	// Main method

	public static void main(String[] args) {
		// Schedule a job for the event-dispatching thread:
		// creating and showing this application's GUI.
		javax.swing.SwingUtilities.invokeLater(new Runnable() {

			@Override
			public void run() {
				createGUI();
			}
		});
	}

	@Override
	public void actionPerformed(ActionEvent e) {
	}

	@Override
	public void update(Observable arg0, Object arg1) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				updateState();
			}
		});
	}

	public void updateState() {
		System.out.println(mHistory.toString());
		text.setText(mHistory.toString());
		if (mState.getLed("hawkeye").getState() == Led.State.ON) {
			LedOn = true;
			LEDButton.setText("ON");
		} else {
			LedOn = false;
			LEDButton.setText("OFF");
		}

	}
}