package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;
/*- 순서번호/ int evAsId;  ⇔  integer ev_as_id <<PK>> AI
- 내용/String evAsReply ⇔ text ev_as_reply NN
- 공감수/int evAsCompassion ⇔ integer ev_as_compassion 0 
- 대상게시글/int eventId; ⇔ integer event_id <<FK>> 
- 글쓴회원/int memberId; ⇔ integer mb_id <<FK>> 
- 생성일/ Timestamp createdAt ⇔ timestamp created_at 
- 갱신일/ Timestamp updatedAt ⇔ timestamp updated_at CURRENT_TIMESTAMP */
public class EventAnswerVO {
	int evAsId;
	String evAsReply;
	int evAsCompassion;
	int eventId;
	int memberId;
	Timestamp createdAt;
	Timestamp updatedAt;
	
	public EventAnswerVO() {}
	public EventAnswerVO(String evAsReply, int eventId, int memberId) {
		this(0, evAsReply, 0, eventId, memberId, null, null);
	}
	public EventAnswerVO(int evAsId, String evAsReply, int evAsCompassion, int eventId, int memberId,
			Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.evAsId = evAsId;
		this.evAsReply = evAsReply;
		this.evAsCompassion = evAsCompassion;
		this.eventId = eventId;
		this.memberId = memberId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public int getEvAsId() {
		return evAsId;
	}
	public void setEvAsId(int evAsId) {
		this.evAsId = evAsId;
	}
	public String getEvAsReply() {
		return evAsReply;
	}
	public void setEvAsReply(String evAsReply) {
		this.evAsReply = evAsReply;
	}
	public int getEvAsCompassion() {
		return evAsCompassion;
	}
	public void setEvAsCompassion(int evAsCompassion) {
		this.evAsCompassion = evAsCompassion;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	@Override
	public String toString() {
		return "EventAnswerVO [evAsId=" + evAsId + ", evAsReply=" + evAsReply + ", evAsCompassion=" + evAsCompassion
				+ ", eventId=" + eventId + ", memberId=" + memberId + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + "]";
	}
	
	
	
	
}
