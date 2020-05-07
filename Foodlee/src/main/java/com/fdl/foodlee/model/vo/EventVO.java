package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;
import java.util.Date;

/*
 #### EventVO ⇔ events
- int eventId 이벤트번호 ⇔ integer event_id <<PK>> NN AI
- Date eventStartDate 이벤트 시작 날짜 ⇔ datetime event_start_date NN
- Date eventEndDate 이벤트 종료 날짜 ⇔ datetime event_end_date 
- int eventOngoing 진행중 여부 ⇔ integer event_ongoing NN // 0종료, 1진행
- String eventTitle 이벤트제목 ⇔ varchar(128) event_title NN
- String eventContent 이벤트내용 ⇔ text event_content NN
- int readCount 조회수 ⇔ integer event_read_count 0
- int likeCount 좋아요수 ⇔ integer event_like_count 0
- String likeMembers 좋아요회원들 ⇔ varchar(1024) event_like_members
- String tags; 태그 ⇔ varchar(1024) event_tags
- String filePath; 첨부파일 ⇔ varchar(512) event_file_path  
- Timestamp eventCreatedAt 이벤트등록날짜 ⇔ timestamp event_created_at   CURRENT_TIMESTAMP NN 
- Timestamp eventUpdatedAt 이벤트수정날짜 ⇔ timestamp event_updated_at   CURRENT_TIMESTAMP                      
 */
public class EventVO {
	int eventId;
	Date eventStartDate;
	Date eventEndDate;
	int eventOngoing;
	String eventTitle;
	String eventContent;
	int readCount;
	int likeCount;
	String likeMembers;
	String tags;
	String filePath;  
	Timestamp eventCreatedAt; 
	Timestamp eventUpdatedAt;
	
	//
	
	public EventVO() {}
	public EventVO(Date eventStartDate, int eventOngoing, String eventTitle,
			String eventContent, String filePath) {
		this(0, eventStartDate, null, eventOngoing, eventTitle, eventContent, 0, 0, null, null, filePath, null, null);
	}
	public EventVO(Date eventStartDate, Date eventEndDate, int eventOngoing, String eventTitle,
			String eventContent, String tags, String filePath) {
		this(0, eventStartDate, eventEndDate, eventOngoing, eventTitle, eventContent, 0, 0, null, tags, filePath, null, null);
	}
	public EventVO(int eventId, Date eventStartDate, Date eventEndDate, int eventOngoing, String eventTitle,
			String eventContent, int readCount, int likeCount, String likeMembers, String tags, String filePath,
			Timestamp eventCreatedAt, Timestamp eventUpdatedAt) {
		super();
		this.eventId = eventId;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventOngoing = eventOngoing;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.readCount = readCount;
		this.likeCount = likeCount;
		this.likeMembers = likeMembers;
		this.tags = tags;
		this.filePath = filePath;
		this.eventCreatedAt = eventCreatedAt;
		this.eventUpdatedAt = eventUpdatedAt;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
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
	public int getEventOngoing() {
		return eventOngoing;
	}
	public void setEventOngoing(int eventOngoing) {
		this.eventOngoing = eventOngoing;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getLikeMembers() {
		return likeMembers;
	}
	public void setLikeMembers(String likeMembers) {
		this.likeMembers = likeMembers;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
		return "EventVO [eventId=" + eventId + ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate
				+ ", eventOngoing=" + eventOngoing + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", readCount=" + readCount + ", likeCount=" + likeCount + ", likeMembers=" + likeMembers + ", tags="
				+ tags + ", filePath=" + filePath + ", eventCreatedAt=" + eventCreatedAt + ", eventUpdatedAt="
				+ eventUpdatedAt + "]";
	}    
	
	
	
	
	
	
	
}
