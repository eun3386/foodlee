package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;
import java.util.Date;

/*
 #### EventVO ⇔ events
- int eventId 이벤트번호 ⇔ integer event_id <<PK>> NN AI
- String eventTitle 이벤트제목 ⇔ varchar(128) event_title NN
- String eventContent 이벤트내용 ⇔ text event_content NN
- Date eventStartDate 이벤트 시작 날짜 ⇔ datetime event_start_date NN
- Date eventEndDate 이벤트 종료 날짜 ⇔ datetime event_end_date 
- boolean eventOngoing 진행중 여부 ⇔ integer event_ongoing NN
- Timestamp eventCreatedAt 이벤트등록날짜 ⇔ timestamp event_created_at   CURRENT_TIMESTAMP NN 
- Timestamp eventUpdatedAt 이벤트수정날짜 ⇔ timestamp event_updated_at   CURRENT_TIMESTAMP 
 */
public class EventVO {
	private int eventId;
	private String eventTitle;
	private String eventContent;
	private Date eventStartDate;
	private Date eventEndDate;
	private boolean eventOngoing;
	private Timestamp eventCreatedAt;
	private Timestamp eventUpdatedAt;
	
	
	public EventVO() {}
	
	public EventVO(int eventId, String eventTitle, String eventContent, Date eventStartDate, 
			boolean eventOngoing, Timestamp eventCreatedAt) {
		this(0, eventTitle, eventContent, eventStartDate, null, eventOngoing, eventCreatedAt, null);
	}
	
	public EventVO(int eventId, String eventTitle, String eventContent, Date eventStartDate, Date eventEndDate,
			boolean eventOngoing, Timestamp eventCreatedAt, Timestamp eventUpdatedAt) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventOngoing = eventOngoing;
		this.eventCreatedAt = eventCreatedAt;
		this.eventUpdatedAt = eventUpdatedAt;
	}
	
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public Date getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public Date getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public boolean isEventOngoing() {
		return eventOngoing;
	}
	public void setEventOngoing(boolean eventOngoing) {
		this.eventOngoing = eventOngoing;
	}
	public Timestamp getEventCreatedAt() {
		return eventCreatedAt;
	}
	public void setEventCreatedAt(Timestamp eventCreatedAt) {
		this.eventCreatedAt = eventCreatedAt;
	}
	public Timestamp getEventUpdatedAt() {
		return eventUpdatedAt;
	}
	public void setEventUpdatedAt(Timestamp eventUpdatedAt) {
		this.eventUpdatedAt = eventUpdatedAt;
	}
	
	
	@Override
	public String toString() {
		return "EventVO [eventId=" + eventId + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate + ", eventOngoing="
				+ eventOngoing + ", eventCreatedAt=" + eventCreatedAt + ", eventUpdatedAt=" + eventUpdatedAt + "]";
	}
	
	
	
	
	
}
