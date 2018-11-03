package fithy.project.dto;

import java.sql.Date;
import java.util.ArrayList;

public class Reservation {
	private String reservationCode;
	private String userCode;
	private Date today;
	private String kindCode;
	private String facilityName;
	private Date reservationDate;
	private String time;
	private String facilityCode;
	private String kindName;
	
	public Reservation() {}
	
	public Reservation(String facilityCode, String facilityName) {
		super();
		this.facilityCode = facilityCode;
		this.facilityName = facilityName;
	}

	public Reservation(String userCode, Date today, String kindCode, String facilityName, Date reservationDate,
			String time) {
		super();
		this.userCode = userCode;
		this.today = today;
		this.kindCode = kindCode;
		this.facilityName = facilityName;
		this.reservationDate = reservationDate;
		this.time = time;
	}

	public String getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(String reservationCode) {
		this.reservationCode = reservationCode;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(String facilityCode) {
		this.facilityCode = facilityCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	
}
