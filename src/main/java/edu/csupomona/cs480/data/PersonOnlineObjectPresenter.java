package edu.csupomona.cs480.data;

import edu.csupomona.cs480.data.provider.CalendarUserManager;
import edu.csupomona.cs480.data.provider.EventList;
import edu.csupomona.cs480.database.MalformedEventException;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class PersonOnlineObjectPresenter {

    private IndividualUser currentUser;
    private CalendarUserManager cum;

    public PersonOnlineObjectPresenter(String user) {
        cum = CalendarUserManager.getInstance();
        currentUser = cum.getUser(user);
    }

    public boolean addEvent(String event) throws MalformedEventException {
        return cum.addEvent(currentUser.getId(), new Event(currentUser.getId(), event, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now())));
    }

    public boolean removeEvent(String event) {
        return cum.removeEvent(currentUser.getId(), event);
    }

    //compares schedules with s
    public String compareSchedules(String s) {
        ArrayList<CalendarUser> calUsers = new ArrayList<>();
        CalendarUser calUser = cum.getGroup(s);
        if(calUser == null) {
            calUser = cum.getUser(s);
            if(calUser != null) {
                calUsers.add(calUser);
            }
        }
        else {
            calUsers.add(calUser);
        }
        calUsers.add(currentUser);
        EventList e = cum.compareSchedule(calUsers);

        return e.toString();
    }

  //calls CalendarUserManager's checkTimeAvailableForUser(on the user parameter)
  public String checkTimeAvailableForUser(String user, String timeSlot) {
    //TODO:

    boolean timeAvailable = cum.checkTimeAvailableForUser(user, timeSlot);
    return ""+timeAvailable;
  }
  
  //calls CalendarUserManager's getScheduleForUser(on the user parameter)
  public String getStringScheduleForUser(String user) {
    String schedule = cum.getStringScheduleForUser(user);
    return schedule;
  }
  
  public EventList getScheduleForUser(String user) {
	  EventList schedule = cum.getScheduleForUser(user);
	  return schedule;
  }

    public FriendsList getFriends() {
        FriendsList friends = currentUser.getFriends();
        return friends;
    }

    public EventList getSchedule() {
        return cum.getScheduleForUser(this.currentUser.id);
//	    return currentUser.getSchedule();
    }

    public String getUserId() {
        return currentUser.getId();
    }

    public String getFullName() {
        return currentUser.getFirstName() + " " + currentUser.getLastName();
    }

    public IndividualUser getCurrentUser() {
        return currentUser;
    }

    public void updateCurrentUser() {
        currentUser = cum.getUser(currentUser.getId());
    }

    public ArrayList<IndividualUser> getListUsersNotFriends() {
        FriendsList friends = getFriends();
        ArrayList<IndividualUser> userList = CalendarUserManager.getInstance().getAllUsers();
        ArrayList<IndividualUser> usersNotFriends = new ArrayList<>();
        for (IndividualUser u : userList) {
            if (!this.getUserId().equals(u.getId()) && !friends.contains(u)) {
                usersNotFriends.add(u);
                System.out.println(u.getId());
            }
        }
        return usersNotFriends;
    }
}
