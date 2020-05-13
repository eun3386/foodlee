# 푸들이 SRS

## 개요

## 벤치마킹

## 주요 요구사항 (Storyboard)

## 엑터 (Actors)
- 회원
- 비회원
- 판매자
- 관리자

## 주요기능 (Usecases Diagram)

1.로그인
가입 할 수 있다. (암호화 저장 처리)
아이디를 찾을 수 있다.
비밀번호를 찾을 수 있다.
로그인 중복체크 할 수 있다.
로그인 할 수 있다. (세션 + 암호화 인증)
로그아웃 할 수 있다.
자신의 정보를 확인 할 수 있다.
자신의 정보를 갱신 할 수 있다.
탈퇴 할 수 있다.

2.회원
리뷰를 수정 할 수 있다.
리뷰를 삭제 할 수 있다.
좋아요 리스트를 확인 할 수 있다.
좋아요 리스트를 수정 할 수 있다.
주문한 내역을 확인 할 수 있다.
주문한 메뉴에 리뷰를 입력 할 수 있다.

3. 판매자
판매 정보를 볼 수 있다(그래프)
트럭 좋아요 갯수를 볼 수 있다
메뉴별 좋아요 갯수를 그래프로 볼 수 있다
월간/주간 판매량을 그래프로 볼 수 있다
메뉴를 등록 및 수정  할 수 있다
메뉴를 삭제 할 수 있다
트럭 정보를 등록 및 수정  할 수 있다
판매에 대한 공지를 입력 및 수정 할 수 있다
결제를 할 수 있다
주문 리스트를 볼 수 있다
광고를 등록 및 해지 할 수 있다.
자신의 위치를 등록 할 수 있다
구매 후기 및 댓글을 볼 수 있다
구매 후기 및 댓글에 댓글을 남길 수 있다
인스타 아이디를 등록 할 수 있다.

4. 구별 푸드트럭 찾기
구별 푸드트럭  위치를 알 수 있다
푸드트럭 의 간략 정보를 알 수 있다 
푸드트럭 리스트가 푸드트럭  정보에 연동 표시 될수 있다

5. 내주변 푸드트럭 찾기
주변 푸드트럭  위치를 알 수 있다
푸드트럭 의 간략 정보를 알 수 있다
푸드트럭 의 이동 경로를 알 수 있다(?)
검색한 지역의 푸드트럭 위치를 알 수 있다
푸드트럭  리스트가 푸드트럭 정보에 연동 표시 될수 있다

6. 메뉴
푸드트럭 top 볼수 있다
메뉴 분류 하여 푸드트럭을 볼수 있다
푸드트럭 리스트가 푸드트럭 정보에 연동 표시될 수 있다
리뷰를 볼 수 있다
Q&A문의리스트를 볼 수 있다

7.  푸드트럭 정보
메뉴를 조회할 수 있다
트럭의 위치를 볼 수 있다
메뉴의 정보를 볼 수 있다
메뉴를 구매 리스트에 추가 할 수 있다
좋아요를 할 수 있다
댓글(평가)를 볼 수 있다
 
8. 배너 광고
배너의 트럭 상세보기 할수 있다
판매자가 일정 금액 기준 등록시간 선착순으로 배너를 등록 할 수 있다

9. 리뷰 & Q&A
회원이 리뷰 및 QnA를 작성 할 수 있다
회원이 리뷰 및 QnA를 편집 갱신 할 수 있다
회원이 리뷰 및 QnA를 삭제 할 수 있다
전체 리뷰 및 QnA 리스트를 조회 할 수 있다



10. admin
회원 조회  할 수 있다(리스트 조회 회원번호, 아이디, 로그인시간, 로그아웃 시간)
회원 상세보기 할 수 있다(회원 리스트 클릭시)
회원 정보 수정 할 수 있다(회원 상세보기에서 )
회원 추가 할 수 있다(?)
회원 삭제 할 수 있다(활동 정지한 판매자)

회원 통계 할수 있다(남/녀, 메뉴, 가격, 구별) 
트럭 통계 할수 있다(구별, 매출, 좋아요수)
메뉴 카테고리 통계 할 수 있다( 각 카테고리 개수, 매출, 구별 )
회원 가입통계 할 수 있다(ex 이번달 회원 가입수)

이벤트를 관리할 수 있다.

나중에….
관리자 그룹을 만들수 있다( 구별 판매자 그룹)
관리자 그룹 지정 할 수 있다
광고자 리스트를 볼 수 있다.


11. 이벤트
- 관리자가 신규 이벤트 게시글을 등록할 수 있다.(+파일업로드..)
- 이벤트 게시글 상세보기 할 수 있다
- 회원이 이벤트 게시글을 좋아요 할 수 있다
- 관리자가 자신의 게시글을 편집 갱신 할 수 있다
- 관리자가 자신의 게시글을 삭제 할 수 있다
- 이벤트 게시글 리스트를 조회할 수 있다. (페이지네이션, 정렬, 태그)
- 이벤트 게시글 리스트를 검색할 수 있다. (페이지네이션, 정렬)


## 도메인 (모델/데이터) 정의
- 관리자, Admin
- 회원, Member
- 판매자, Seller
- 푸드트럭, Foodtruck
- 메뉴, Menu
- 공지사항(메인), Notice
- 리뷰, Review
- QnA, QnA
- 결제 Order

### 모델 스키마
- 관리자, Admin => AdminVO : admin table
- 회원, Member => MemberVO : members table
- 판매자, Seller => SellerVO : sellers table
- 푸드트럭, Foodtruck => FoodtruckVO : foodtrucks table
- 메뉴, Menu => MenuVO : menus table
- 공지사항(메인), Notice => NoticeVO : notices table
- 댓글/리뷰, Review => ReviewVO : reviews table
- 문의, QnA => QnaVO : qna table
- 주문, Order => OrderVO : orders table

### 엔티티 스키마 (ERD - 논리/개념) ⇔ DB 스키마 (ERD - 물리적)

#### AdminVO ⇔ admin
- int adId 관리자번호 ⇔ int ad_id <<PK>> 
- String login 아이디 ⇔ varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔ varchar(24) password NN
- String email 이메일 ⇔  varchar(24) email
- String phoneNumber 연락처 ⇔ varchar(12) phone_number NN
- Stirng notice 공지(인수인계) ⇔ text
- timestamp createdAt 생성날짜 ⇔ timestamp created_at 
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
- timestamp loginTime 로그인일자 ⇔ timestamp login_time
- timestamp logoutTime 로그아웃일자 ⇔ timestamp logout_time

#### MemberVO ⇔ members
- int mbId <<PK>> 회원번호 ⇔ int mb_id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔ varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔ varchar(24) password NN
- String name 이름 ⇔ varchar(12) name NN
- String gender 성별 ⇔ varchar(4) gender
- int age 나이 ⇔ int age
- String residentRN 주민번호 // Resident Registration Number, RRN 
⇔  varchar(13) resident_rn
- String email 이메일 ⇔  varchar(24) email
- String phoneNumber 연락처 ⇔ varchar(12) phone_number NN
- String address 주소 ⇔ varchar(24) address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
- timestamp loginTime 로그인일자 ⇔ timestamp login_time
- timestamp logoutTime 로그아웃일자 ⇔ timestamp logout_time

#### SellerVO ⇔ sellers
- int sellerId <<PK>> 판매자 번호 ⇔  int seller_id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔  varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔  varchar(24) password NN
- String name 이름 ⇔  varchar(12) name NN
- String gender 성별 ⇔  varchar() gender
- int age 나이 ⇔ int age
- String residentRN 주민번호 // Resident Registration Number, RRN	
⇔  varchar(13) resident_rn
- String email 이메일 ⇔ varchar() email
- String phoneNumber 연락처 ⇔ varchar() phone_number NN
- String address 주소 ⇔ varchar() address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
- String companyRN 사업자등록번호 Company Registration Number, CRN 
⇔ varchar() company_rn 
- timestamp loginTime 로그인일자 ⇔ timestamp login_time 
- timestamp logoutTime 로그아웃일자 ⇔ timestamp logout_time 


#### FoodtruckVO ⇔ foodtrucks
- int sellerId 판매자 번호 ⇔ integer seller_id NN <<FK>>
- String foodtruckImgPath 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
- String foodtruckName 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
- String foodtruckMainMenu 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
- String foodtruckLocation 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
- String foodtruckMuni 푸드트럭 구 ⇔ varchar(256) foodtruck_muni NN
- String foodtruckOperationHour 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
- int favoriteCount 좋아요 트럭 ⇔ integer favorite_count <<FK>>
- String sellerFoodtruckCoordinate 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
- Timestamp locationUpdatedAt 위치이동날짜 ⇔ timestamp location_updated_at
CURRENT_TIMESTAMP


#### EventVO ⇔ events
- int eventId 이벤트번호 ⇔ integer event_id <<PK>> NN AI
- Date eventStartDate 이벤트 시작 날짜 ⇔ datetime event_start_date NN
- Date eventEndDate 이벤트 종료 날짜 ⇔ datetime event_end_date 
- int eventOngoing 진행중 여부 ⇔ integer event_ongoing NN // 0종료, 1진행
- String eventTitle 이벤트제목 ⇔ varchar(128) event_title NN
- String eventContent 이벤트내용 ⇔ text event_content NN
- int readCount 조회수 ⇔ integer read_count 0
- int likeCount 좋아요수 ⇔ integer like_count 0
- String likeMembers 좋아요회원들 ⇔ varchar(1024) like_members
- String tags; 태그 ⇔ varchar(1024) tags
- String filePath; 첨부파일 ⇔ varchar(512) file_path  
- Timestamp eventCreatedAt 이벤트등록날짜 ⇔ timestamp event_created_at   CURRENT_TIMESTAMP NN 
- Timestamp eventUpdatedAt 이벤트수정날짜 ⇔ timestamp event_updated_at   CURRENT_TIMESTAMP
                      
#### EventAnswerVO ⇔ event_answers
- 순서번호/ int evAsId;  ⇔  integer ev_as_id <<PK>> AI
- 내용/String evAsReply ⇔ text ev_as_reply NN
- 공감수/int evAsCompassion ⇔ integer ev_as_compassion 0 
- 대상게시글/int eventId; ⇔ integer event_id <<FK>> 
- 글쓴회원/int memberId; ⇔ integer mb_id <<FK>> 
- 생성일/ Timestamp createdAt ⇔ timestamp created_at 
- 갱신일/ Timestamp updatedAt ⇔ timestamp updated_at CURRENT_TIMESTAMP 



#### MenuVO ⇔ menus
- int menuId <<PK>> 메뉴번호 ⇔ integer menu_id <<PK>> NN AI
- String menuName 메뉴이름 ⇔ varchar(64) menu_name NN
- String menuType 메뉴종류 ⇔ varchar(32) menu_type NN
- int menuPrice 메뉴가격 ⇔ integer menu_price NN
- String menuPic 메뉴사진 ⇔ varchar(512) menu_pic NN 
- String menuInfor 메뉴정보 ⇔ varchar(512) menu_infor NN
- String rawMaterials 메뉴 원재료 ⇔ varchar(256) raw_Materials


#### menuOrigin 메뉴 원산지 ⇔ varchar(32) menu_origin
- 원산지 의무 표시 품목
- 원산지 국명

○ 대상 품목
 - 쇠고기의 식육, 포장육, 식육가공품을 포함
 - 돼지고기의 식육, 포장육, 식육가공품을 포함
 - 닭고기의 식육, 포장육, 식육가공품을 포함
 - 오리고기의 식육, 포장육, 식육가공품을 포함
 - 양(염소 등 산양을 포함) 고기의 식육, 포장육, 식육가공품을 포함
 - 쌀 :  밥, 죽 누룽지로 제공하는 것(쌀에는 찹쌀, 현미 및 찐쌀 포함, 쌀가공품 포함)
 - 배추김치(배추김치가공품 포함)의 원료인 배추(얼갈이배추, 봄동배추 포함)와 고춧가루
 - 콩 : 두부류(가공두부, 유바는 제외), 콩비지, 콩국수에 사용하는 콩(콩가공품 포함)
 - 넙치, 조피볼락, 참돔, 미꾸라지, 뱀장어, 낙지, 명태(황태, 북어 등 건조한 것은 제외한다), 고등어, 갈치, 오징어, 꽃게, 참조기(해당 수산물가공품 포함)
 - 살아있는 수산물 : 조리하여 판매, 제공하기 위하여 수족관 등에 보관, 진열하는 것

#### menuAllergyStuff 메뉴 알레르기 유발재료 ⇔ varchar(512) menu_allergy_stuff
식품 알레르기 표시대상은 난류(가금류에 한한다), 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류(이를 첨가해 최종제품에 이산화황으로 10mg/kg 이상 함유한 경우), 호두, 닭고기, 쇠고기, 오징어, 조개류(굴·전복·홍합 포함)를 원재료로 사용한 경우, 이런 식품으로부터 추출 등의 방법으로 얻은 성분, 이런 식품이나 성분을 함유한 식품 또는 식품첨가물을 원재료로 사용한 경우다. 표시방법은 원재료명 표시란 근처에 바탕색과 구분되도록 별도의 알레르기 표시란을 마련해 알레르기 표시대상 원재료명을 표시하게 돼 있다. 예컨대 ‘계란·우유·새우·이산화황·조개류(굴) 함유’라고 표시한다.
boolean algEgg 난류 포함 여부 ⇔ boolean alg_egg
boolean algMilk 우유 포함 여부 ⇔ boolean alg_milk
boolean algBuckwheat 메밀 포함 여부 ⇔ boolean alg_buckwheat
boolean algPeanut 땅콩 포함 여부 ⇔ boolean alg_peanut
boolean algSoybean 대두 포함 여부 ⇔ boolean alg_soybean
boolean algWheat 밀 포함 여부 ⇔ boolean alg_wheat
boolean algMackerl 고등어 포함 여부 ⇔ boolean alg_mackerl
boolean algCrab 게 포함 여부 ⇔ boolean alg_crab
boolean algShrimp 새우 포함 여부 ⇔ boolean alg_shrimp
boolean algPork 돼지고기 포함 여부 ⇔ boolean alg_pork
boolean algPeach 복숭아 포함 여부 ⇔ boolean alg_peach
boolean algTomato 토마토 포함 여부 ⇔ boolean alg_tomato
boolean algSulfuricAcid 아황산류 포함 여부 ⇔ boolean alg_sulfutic_acid
boolean algWalnut 호두 포함 여부 ⇔ boolean alg_walnut
boolean algChicken 닭고기 포함 여부 ⇔ boolean alg_chicken
boolean algBeef 쇠고기 포함 여부 ⇔ boolean alg_beef
boolean algSquid 오징어 포함 여부 ⇔ boolean alg_squid
boolean algShellfish 조개류 포함 여부 ⇔ boolean alg_shellfish


#### Like 좋아요
- int likeMenuNum 메뉴 좋아요 개수 ⇔ integer like_menu_num
- int likefoodtruckNum 푸드트럭 좋아요 개수 ⇔ integer like_foodtruck_num


#### 배너(광고) ad
int fodId 푸드트럭 번호 ⇔ integer fod_id <<FK>>
int adPrice 광고금액 ⇔ integer ad_price 
Date adStartDate 적용 시작 기간 ⇔ datetime ad_start_date 
Date adEndtDate 적용 종료 기간 ⇔ datetime ad_Endt_date 
String adLocation 노출 위치 ⇔ text ad_location 

#### 리뷰 ReviewVO ⇔ review
- int reviewId <<PK>> 리뷰번호 ⇔ integer review_id <<PK>> NN AI
- String login <<FK>> 리뷰 작성자 ⇔ varchar(12) login <<FK>> NN
- int sellerId <<FK>> 판매자 번호 ⇔ integer seller_id NN <<FK>>
- int reviewDepth 답글여부(문의는 0 답글은 1) ⇔ int review_depth NN
- int reviewPnum 답글일 경우 부모(문의) 번호 ⇔ int review_pnum
- String reviewContent 리뷰내용 ⇔ text review_content NN
- String reviewPic 리뷰사진 ⇔ varchar(512) review_pic
- timestamp reviewCreatedAt 리뷰 작성일 ⇔ timestamp review_created_at CURRENT_TIMESTAMP  NN




#### QnaVO ⇔ qna QnA
- int qnaId <<PK>> 문의번호 ⇔ integer qna_id <<PK>> NN AI
- String login <<FK>> 문의 작성자 ⇔ varchar(12) login <<FK>> NN
- int sellerId <<FK>> 판매자 번호 ⇔ integer seller_id NN <<FK>>
- int qnaDepth 답글여부(문의는 0 답글은 1) ⇔ int qna_depth NN
- int qnaPnum 답글일 경우 부모(문의) 번호 ⇔ int qna_pnum 
- String qnaContent 문의 내용 ⇔ varchar(2048) qna_content NN
- Date qnaCreatedAt 문의작성일 ⇔ timestamp qna_created_at CURRENT_TIMESTAMP  NN



#### OrderVO ⇔ orders
- int orderId <<PK>> 주문번호 ⇔ integer order_id <<PK>> NN AI
- String login <<FK>> 주문한 사람의 아이디 ⇔ varchar(12) login <<FK>> NN
- int sellerId <<FK>> 판매자 번호 ⇔ integer seller_id NN <<FK>>
- String orderName 주문 메뉴 이름 ⇔ varcahr(512) order_name NN
- String orderNumber 주문 메뉴 개수 ⇔ varchar(128) order_number NN
- String orderPrice 주문 메뉴 가격 ⇔ varchar(512) order_price NN
- int orderPriceSum 주문 메뉴 가격합 ⇔ integer order_price_sum NN
- int orderState 주문 상황 ⇔ integer order_state NN(1 회원 주문 2 회원 취소
3 판매자 주문 접수 4 판매자 주문 취소)


## URL 매핑 정의
//
<admin>
-회원 조회  할 수 있다(리스트 조회 회원번호, 아이디, 로그인시간, 로그아웃 시간)
	admin_
	admin_list.fdl(proc, get, dao)
-회원 상세보기 할 수 있다(회원 리스트 클릭시)
	admin_show.fdl(get, proc, dao, param? vo)
-회원 정보 수정 할 수 있다(회원 상세보기에서 )
	admin_edit_form.fdl(get, proc, dao, param?id)
admin_mb_pw_chagnge.fdl(proc, post, dao, 회원)
	admin_mb_update.fdl (proc, post, 세션, dao, 회원)
-회원 삭제 할 수 있다(활동 정지한 판매자)
admin_del.fdl(proc, get, dao, param?id)
-회원 추가 할 수 있다(?)
	admin_new_join_form.fdl(get)
	admin_add_join.fdl(proc, post, dao)
-회원 통계 할수 있다(남/녀, 메뉴, 가격, 구별)
admin_mb_statistics_form.fdl(get)
admin_statistics.fdl(get, proc, dao, param..vo)
-트럭 통계 할수 있다(구별, 매출, 좋아요수)
	admin_truck_statistics_form.fdl(get)
admin_truck_statistics.fdl(get, proc, dao, param..vo)
-메뉴 카테고리 통계 할 수 있다( 각 카테고리 개수, 매출, 구별 )
	admin_menu_statistics_form.fdl(get)
admin_menu_statistics.fdl(get, proc, dao, param..vo)
-회원 가입통계 할 수 있다(ex 이번달 회원 가입수)
admin_join_statistics_form.fdl(get)
admin_join_statistics.fdl(get, proc, dao, param..vo)
-이벤트를 관리할 수 있다.

나중에….
관리자 그룹을 만들수 있다( 구별 판매자 그룹)
관리자 그룹 지정 할 수 있다
광고자 리스트를 볼 수 있다.
//
<배너>
-판매자가 배너를 신청 할 수 있다
banner_new_form.fdl(get)
banner_apply.fdl(get, proc, dao, param.fdId,price)
-판매자가 일정 금액 기준 등록시간 선착순으로 배너를 등록 할 수 있다
banner_add.fdl(get, proc, dao, param..vo)
-배너의 트럭 상세보기 할수 있다
banner_show.fdl(get, proc, dao, param?fdId)
// 
<이벤트>
- 관리자가 신규 이벤트 게시글을 등록할 수 있다.(+파일업로드..)
	event_new_form.fdl (get)
	event_add.fdl (post, proc, dao, param..vo)
- 이벤트 게시글 상세보기 할 수 있다
	event_show.fdl (get, proc, dao, param?id)
- 회원이 이벤트 게시글을 좋아요 할 수 있다
	event_like.fdl (get, proc, dao, param?atId&mbId..) 
- 관리자가 자신의 게시글을 편집 갱신 할 수 있다
	event_edit_form.fdl (get, proc, dao, param?id)
	event_update.fdl (post, proc, dao, param...vo)
- 관리자가 자신의 게시글을 삭제 할 수 있다
	event_remove.fdl (get, proc, dao, param?id)
- 이벤트 게시글 리스트를 조회할 수 있다. (페이지네이션, 정렬, 태그)
	event_list.fdl (get, proc, dao)
	event_list.fdl (get, proc, dao, param?pn&order)
- 이벤트 게시글 리스트를 검색할 수 있다. (페이지네이션, 정렬)
	event_form.fdl (get, form) 
	event_search.fdl (post, proc, dao, param?pn&order&keyword&날짜 범위..)
//
<이벤트 댓글>
- 회원이 대상 게시글에 대해 답글을 추가할 수 있다.
	event_answer_new_form.my
	event_answer_add.my	
- 댓글 리스트가 게시글 상세보기에 연동 표시될 수 있다.
	event_answer_list.my
- 회원이 댓글에 대해 공감(+1) 할 수 있다.
	event_answer_compassion.my	
- 회원이 댓글을 갱신할 수 있다.
	event_answer_edit_form.my
	event_answer_update.my	
- 회원이 댓글을 삭제할 수 있다. 
	event_answer_remove.my
//	
<member>
- 회원가입구분/약관동의 할 수 있다.
	member/join_choice_form.fdl (get, )
- 회원가입 할 수 있다.
	member/new_join_form.fdl
	member/join.fdl
- 아이디를 찾을 수 있다.
	member/find_id.fdl
- 비밀번호를 찾을 수 있다.
	member/find_pw.fdl
- 아이디 중복체크를 할 수 있다.
	member/dupcheck.fdl
- 로그인 할 수 있다.
	member/login_form.fdl
	member/login.fdl
- 로그아웃 할 수 있다.
	member/logout.fdl
- 자신의 정보를 확인 할 수 있다.
	member/show.fdl
- 자신의 정보를 갱신 할 수 있다.
	member/edit_form.fdl
	member/update.fdl
- 탈퇴 할 수 있다.
	member/delete.fdl

<seller>
- 회원가입구분/약관동의 할 수 있다.
	seller/join_choice_form.fdl (get, )
- 회원가입 할 수 있다.
	seller/new_join_form.fdl
	seller/join.fdl
- 아이디를 찾을 수 있다.
	seller/find_id.fdl
- 비밀번호를 찾을 수 있다.
	seller/find_pw.fdl
- 아이디 중복체크를 할 수 있다.
	seller/dupcheck.fdl
- 로그인 할 수 있다.
	seller/login_form.fdl
	seller/login.fdl
- 로그아웃 할 수 있다.
	seller/logout.fdl
- 자신의 정보를 확인 할 수 있다.
	seller/show.fdl
- 자신의 정보를 갱신 할 수 있다.
	seller/edit_form.fdl
	seller/update.fdl
- 탈퇴 할 수 있다.
	seller/delete.fdl
<menu>
-메뉴를 작성 할 수 있다.
	menu/new_menu/fdl
-메뉴를 수정 할 수 있다.
	menu/menu_update/fdl
-메뉴를 삭제할 수 있다.
	menu/menu_delete/fdl
-전체메뉴를 조회 할 수 있다.
	menu/menu_list/fdl
-가게 정보를 작성 할 수 있다.
menu/new_truck/fdl
-가게 정보를 수정 할 수 있다.
	menu/truck_update/fdl

<foodtruck>
-푸드트럭을 등록 할 수 있다.
	foodtruck/new_foodtruck/fdl
-푸드 트럭을 조회 할 수 있다.
	foodtruck/foodtruck_select/fdl
-푸드 트럭을 수정 할 수 있다.
	foodtruck/foodtruck_update/fdl
-푸드 트럭을 삭제할 수 있다.
	foodtruck/foodtruck_delete/fdl

<review>
- 리뷰를 작성 할 수 있다.
	review/new_review.fdl
- 리뷰를 수정 할 수 있다.
	review/review_update.fdl
- 리뷰를 삭제 할 수 있다.
	review/review_delete.fdl
- 전체 리뷰를 조회 할 수 있다.
	review/review_list.fdl

<QnA>
- 문의를 작성 할 수 있다.
	qna/new_qna.fdl
- 문의를 수정 할 수 있다
qna/qna_update.fdl
- 문의를 삭제 할 수 있다.
	qna/qna_delete.fdl
- 전체 문의를 조회 할 수 있다.
	qna/qna_list.fdl

<Order>
- 회원이 주문을 할 수 있다.
	order/new_order.fdl
- 회원이 주문 취소를(주문 접수 전까지) 할 수 있다.
	order/order_cancel.fdl
- 판매자가 주문을 접수 할 수 있다.
- 판매자가 주문을 거절(상황에 따라) 할 수 있다.







<like>
- 메뉴를 좋아요 할 수 있다
	menu/menu_like_check.fdl (post
- 좋아요 목록을 불러 올 수 있다.
	mypage/like_list.fdl (get
- 좋아요를 취소 할 수 있다
	mypage/like_delete.fdl (post,
- (좋아요 한)메뉴 페이지로 이동 할 수 있다
	menu/menu_detail.fdl (get,


<마이페이지>
- 주문 내역 리스트를 확인 할 수 있다
	mypage/order_list.fdl (get
- 내가 쓴 댓글/리뷰를 확인 할 수 있다
	mypage/comment_list.fdl (get
- 내가 쓴 댓글/리뷰를 수정 할 수 있다
	mypage/comment_update.fdl (post
- 내가 쓴 댓글/리뷰를 삭제 할 수 있다
	mypage/comment_delete.fdl (post
- 내 정보를 수정 할 수 있다
	mypage/my_info.fdl (get, proc, dao, param




## 디렉터리 구조
/WebContent => /Foodlee
/Foodlee/
/Foodlee/default.jsp
/Foodlee/views/	뷰템플릿 UI
/Foodlee/views/common
/Foodlee/views/member
/Foodlee/views/seller
/Foodlee/views/menu
/Foodlee/views/notice
/Foodlee/views/review
		
/Foodlee/resources/	뷰에서 사용하는 웹표준 자원
/Foodlee/resources/css
/Foodlee/resources/js
/Foodlee/resources/image


## 패키지 구조 정의
src/
src/fdl.
src/fdl.controller. 컨트롤러 (서블릿)
src/fdl.controller.FrontController 프론트 요청처리 컨트롤러
src/fdl.model.  // data, VO/DTO 엔티티 도메인 표현
src/fdl.model.MemberVO <-> members TBL
src/fdl.model.SellerVO <-> sellers TBL
src/fdl.model.FoodtruckVO <-> foodtrucks TBL
src/fdl.model.MenuVO <-> menus TBL
src/fdl.model.NoticeVO <-> notices TBL
src/fdl.model.ReviewVO <-> reviews TBL
src/fdl.dao. // DAO 중개 (저장단과 다른 계층을 중개)
src/fdl.dao.inf. (DAO 인터페이스)
src/fdl.dao.inf.IMemberDAO
src/fdl.dao.inf.ISellerDAO
src/fdl.dao.inf.IFoodtruckDAO
src/fdl.dao.inf.IMenuDAO
src/fdl.dao.inf.INoticeDAO
src/fdl.dao.inf.IReviewDAO
src/fdl.dao.impl. (DAO 구현체)
src/fdl.dao.impl.MemberMysqlDAOImpl
src/fdl.dao.impl.SellerMysqlDAOImpl
src/fdl.dao.impl.FoodtruckMysqlDAOImpl
src/fdl.dao.impl.MenuMysqlDAOImpl
src/fdl.dao.impl.NoticeMysqlDAOImpl
src/fdl.dao.impl.ReviewMysqlDAOImpl
	src/my.dao.impl.mysql.
	src/my.dao.impl.oracle.
	src/my.dao.impl.cloud.
	...
src/fdl.svc. (service의 약자)
src/fdl.svc.inf.
src/fdl.svc.impl.
src/fdl.svc.inf.IMemberSVC (모든 기능 서비스)
src/fdl.svc.impl.MemberSvcImpl
src/fdl.svc.inf.ISellerSVC (모든 기능 서비스)
src/fdl.svc.impl.SellerSvcImpl
src/fdl.svc.inf.IFoodtruckSVC (모든 기능 서비스)
src/fdl.svc.impl.FoodtruckSvcImpl
src/fdl.svc.inf.IMenuSVC (모든 기능 서비스)
src/fdl.svc.impl.MenuSvcImpl
src/fdl.svc.inf.INoticeSVC (모든 기능 서비스)
src/fdl.svc.impl.NoticeSvcImpl
src/fdl.svc.inf.IReviewSVC (모든 기능 서비스)
src/fdl.svc.impl.ReviewSvcImpl

src/fdl.svc.inf.IMemberJoinSVC
src/fdl.svc.impl.MemberJoinSvcImpl
src/fdl.svc.inf.IMemberLoginSVC
src/fdl.svc.impl.MemberLoginSvcImpl
src/fdl.svc.inf.IMemberLogoutSVC
src/fdl.svc.impl.MemberLogoutSvcImpl
src/fdl.svc.impl.MemberDupCheckSvcImpl
......

src/fdl.util.
src/fdl.util.db.
src/fdl.util.db.DBConnection

