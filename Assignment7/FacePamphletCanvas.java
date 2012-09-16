/*
 * File: FacePamphletCanvas.java
 * -----------------------------
 * This class represents the canvas on which the profiles in the social
 * network are displayed.  NOTE: This class does NOT need to update the
 * display when the window is resized.
 */


import acm.graphics.*;
import java.awt.*;
import java.util.*;
import java.awt.event.*;

public class FacePamphletCanvas extends GCanvas 
					implements FacePamphletConstants {
	
	/** 
	 * Constructor
	 * This method takes care of any initialization needed for 
	 * the display
	 */
	public FacePamphletCanvas() {
	}
	
	/** 
	 * This method displays a message string near the bottom of the 
	 * canvas.  Every time this method is called, the previously 
	 * displayed message (if any) is replaced by the new message text 
	 * passed in.
	 */
	public void showMessage(String msg) {		
		msgBox = new GLabel(msg);
		msgBox.setFont(MESSAGE_FONT);
		add(msgBox, ( getWidth() - msgBox.getWidth() ) / 2, getHeight() - BOTTOM_MESSAGE_MARGIN);
		msgBox.setLabel(msg);
	}	
	
	/** 
	 * This method displays the given profile on the canvas.  The 
	 * canvas is first cleared of all existing items (including 
	 * messages displayed near the bottom of the screen) and then the 
	 * given profile is displayed.  The profile display includes the 
	 * name of the user from the profile, the corresponding image 
	 * (or an indication that an image does not exist), the status of
	 * the user, and a list of the user's friends in the social network.
	 */
	public void displayProfile(FacePamphletProfile profile) {
		GProfile profileDisplay = new GProfile(profile, getWidth());
		add(profileDisplay, LEFT_MARGIN, TOP_MARGIN);
		String msg = "Displaying " + profile.getName();
		showMessage(msg);
	}
	
	

	public void test(String msg) {
		
	}
	
	private GLabel msgBox;
	
	class GProfile  extends GCompound {
		
		public GProfile (FacePamphletProfile profile, double width) {	
			
			GLabel name = new GLabel(profile.getName());
			name.setFont(PROFILE_NAME_FONT);
			name.setColor(Color.BLUE);
			
			GCompound avatarPlaceHolder  = createAvatarPlaceHolder();
			
			GLabel status = new GLabel(profile.getStatus());
			status.setFont(PROFILE_STATUS_FONT);
			Iterator<String> friends = profile.getFriends();
			System.out.println("friends.hasNext(): " + friends.hasNext());
			GCompound friendsList = createFriendsLabels(friends);
			
			double mark = name.getHeight();
			double friendsMark = mark;
			add(name, 0, mark);
			mark += IMAGE_MARGIN;			
			add(avatarPlaceHolder, 0, mark);
			mark += avatarPlaceHolder.getHeight() + STATUS_MARGIN + status.getHeight();
			add(status, 0, mark);
			add(friendsList, width  /2 , friendsMark );
			
		}
		
		private GCompound createFriendsLabels( Iterator<String> iter) {
			System.out.println("createFriendsLabels...");
			GCompound friendsDisplay = new GCompound();
			String title = "Friends:";
			GLabel label = new GLabel( title);
			label.setFont(PROFILE_FRIEND_LABEL_FONT);
			
			String friends = "";
			while (iter.hasNext()) {				
				friends = iter.next();
			}
			System.out.println("friends: " + friends);
			GLabel listOfFriends = new GLabel(friends);
			
			double mark = label.getHeight();
			friendsDisplay.add(label, 0, mark);			
			mark += listOfFriends.getHeight();
			friendsDisplay.add(listOfFriends, 0, mark);
			
			return friendsDisplay;
		}
		
		private GCompound createAvatarPlaceHolder() {
			GCompound avatarPlaceHolder = new GCompound();
			GRect box  = new GRect(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);
			GLabel status = new GLabel("No Image");
			status.setFont(PROFILE_IMAGE_FONT);
			
			avatarPlaceHolder.add(box);
			avatarPlaceHolder.add(status, ( box.getWidth() - status.getWidth() ) / 2,  box.getHeight() / 2 );
			
			return avatarPlaceHolder;
		}
		
	}
}
