package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

/*
 #### EventVO ⇔ events
- int eventId 이벤트번호 ⇔ integer event_id <<PK>> NN AI
- String eventTitle 이벤트제목 ⇔ varchar(128) event_title NN
- String eventContent 이벤트내용 ⇔ text event_content NN
- String eventStartString 이벤트 시작 날짜 ⇔ Stringtime event_start_String NN
- String eventEndString 이벤트 종료 날짜 ⇔ Stringtime event_end_String 
- int eventOngoing 진행중 여부 ⇔ integer event_ongoing NN // 0종료, 1진행
- Timestamp eventCreatedAt 이벤트등록날짜 ⇔ timestamp event_created_at   CURRENT_TIMESTAMP NN 
- Timestamp eventUpStringdAt 이벤트수정날짜 ⇔ timestamp event_upStringd_at   CURRENT_TIMESTAMP
- int likeCount 좋아요수 ⇔ integer event_like_count 0
- int readCount 조회수 ⇔ integer event_read_count 0
- String likeMembers 좋아요회원들 ⇔ varchar(1024) event_like_members
- String tags; 태그 ⇔ varchar(1024) event_tags
- String filePath; 첨부파일 ⇔ varchar(2048) event_file_path                      
 */
public class EventVO {
	int eventId;
	String eventTitle;
	String eventContent;
	String eventStartDate;
	String eventEndDate; 
	int eventOngoing;
	Timestamp eventCreatedAt; 
	Timestamp eventUpdatedAt;
	int likeCount;
	int readCount;
	String likeMembers;
	String tags;
	String filePath;
	
	
	public EventVO() {}
	public EventVO(String eventTitle, String eventContent, String eventStartDate, String eventEndDate,
			int eventOngoing, String filePath) {
		this(0, eventTitle, eventContent, eventStartDate, eventEndDate, eventOngoing, null, null, 0, 0, null, null, filePath);
	}
	public EventVO(int eventId, String eventTitle, String eventContent, String eventStartDate, String eventEndDate,
			int eventOngoing, Timestamp eventCreatedAt, Timestamp eventUpdatedAt, int likeCount, int readCount,
			String likeMembers, String tags, String filePath) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventOngoing = eventOngoing;
		this.eventCreatedAt = eventCreatedAt;
		this.eventUpdatedAt = eventUpdatedAt;
		this.likeCount = likeCount;
		this.readCount = readCount;
		this.likeMembers = likeMembers;
		this.tags = tags;
		this.filePath = filePath;
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
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate= eventEndDate;
	}
	public int getEventOngoing() {
		return eventOngoing;
	}
	public void setEventOngoing(int eventOngoing) {
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
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
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
	
	
	@Override
	public String toString() {
		return "EventVO [eventId=" + eventId + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventStartDate=" + eventStartDate+ ", eventEndDate=" + eventEndDate + ", eventOngoing="
				+ eventOngoing + ", eventCreatedAt=" + eventCreatedAt + ", eventUpdatedAt=" + eventUpdatedAt
				+ ", likeCount=" + likeCount + ", readCount=" + readCount + ", likeMembers=" + likeMembers + ", tags="
				+ tags + ", filePath=" + filePath + "]";
	}
	
	
}
