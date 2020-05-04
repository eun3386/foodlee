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
1. 회원
	- 가입 할 수 있다 (암호화 저장 처리)
	- 로그인 중복체크 할 수 있다
	- 로그인 할 수 있다 (세션+암호화 인증)
	- 로그아웃 할 수 있다
	- 리뷰를 수정 할 수 있다.
	- 리뷰를 삭제 할 수 있다.
	- 좋아요 리스트를 확인 할 수 있다.
	- 좋아요 리스트를 수정 할 수 있다.
	- 주문한 내역을 확인 할 수 있다.
	- 주문한 메뉴에 리뷰를 입력 할 수 있다.
	- 자신의 정보를 상세보기 할 수 있다
	- 자신의 정보를 갱신 할 수 있다
	- 탈퇴 할 수 있다 (미정)
	- 결제를 할수있다
	- 전체 회원의 리스트를 조회 할 수 있다 (어드민) ???
2. 판매자
	- 가입 할 수 있다.(암호화 저장 처리)
 	- 로그인 중복체크 할 수 있다
	- 로그인 할 수 있다 (세션+암호화 인증)
	- 로그아웃 할 수 있다
	- 자신의 정보를 상세보기 할 수 있다
	- 자신의 정보를 갱신 할 수 있다
	- 판매 정보를 볼 수 있다(그래프, 통계)
	- 트럭 좋아요 갯수를 볼 수 있다
	- 메뉴별 좋아요 갯수를 그래프로 볼 수 있다
	- 월간/주간 판매량을 그래프로 볼 수 있다
	- 메뉴를 등록 및 수정  할 수 있다
	- 메뉴를 삭제 할 수 있다
	- 트럭 정보를 등록 및 수정  할 수 있다
	- 판매에 대한 공지를 입력 및 수정 할 수 있다
	- 결제를 할수 있다
	- 탈퇴 할 수 있다
	- 주문 리스트를 볼수 있다
	- 광고를 등록 및 해지 할 수 있다.
	- 자신의 위치를 등록 할 수 있다
	- 구매 후기 및 댓글을 볼 수 있다
	- 구매 후기 및 댓글에 댓글을 남길 수 있다
	- 인스타 아이디를 등록 할 수 있다.
	
3. 푸드트럭
	- 메뉴를 조회할 수 있다
	- 트럭의 위치를 볼 수 있다
	- 메뉴의 정보를 볼 수 있다
	- 메뉴를 구매 리스트에 추가 할 수 있다
	- 좋아요를 할 수 있다
	- 댓글(평가)를 볼 수 있다
	
4. 구별 푸드트럭 찾기
	- 구별 푸드트럭  위치를 알 수 있다
	- 푸드트럭 의 간략 정보를 알 수 있다 
	- 푸드트럭 리스트가 푸드트럭  정보에 연동 표시 될수 있다
	
5. 내주변 푸드트럭 찾기
	- 주변 푸드트럭  위치를 알 수 있다
	- 푸드트럭 의 간략 정보를 알 수 있다
	- 푸드트럭 의 이동 경로를 알 수 있다(?)
	- 검색한 지역의 푸드트럭 위치를 알 수 있다
	- 푸드트럭  리스트가 푸드트럭 정보에 연동 표시 될수 있다

6. 메뉴
	- 푸드트럭 top 볼수 있다
	- 메뉴 분류 하여 푸드트럭을 볼수 있다
	- 푸드트럭 리스트가 푸드트럭 정보에 연동 표시될 수 있다
	- 리뷰를 볼 수 있다
	- Q&A문의리스트를 볼 수 있다

7. 게시글
8. 댓글/리뷰

## 도메인 (모델/데이터) 정의
- 회원, Member
- 판매자, Seller
- 푸드트럭, Foodtruck
- 메뉴, Menu
- 공지사항(메인), Notice
- 댓글/리뷰, Reply
- 결제 ?

### 모델 스키마
- 회원, Member => MemberVO : members table
- 판매자, Seller => SellerVO : sellers table
- 푸드트럭, Foodtruck => FoodtruckVO : foodtrucks table
- 메뉴, Menu => MenuVO : menus table
- 공지사항(메인), Notice => NoticeVO : notices table
- 댓글/리뷰, Reply => ReplyVO : replies table
- 결제 ?

### 엔티티 스키마 (ERD - 논리/개념) ⇔ DB 스키마 (ERD - 물리적)
#### MemberVO ⇔ members
- int mbId <<PK>> 회원번호 ⇔ int id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔ varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔ varchar(24) password NN
- String name 이름 ⇔ varchar(12) name NN
- String gender 성별 ⇔ varchar() gender
- String rRN 주민번호 // Resident Registration Number, RRN 
⇔  varchar() rRN
- String email 이메일 ⇔  varchar() email
- String phoneNumber 연락처 ⇔ varchar() phone_number NN
- String address 주소 ⇔ varchar() address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at

#### SellerVO ⇔ sellers
- int sellerId <<PK>> 판매자 번호 ⇔  int seller_id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔  varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔  varchar(24) password NN
- String name 이름 ⇔  varchar(12) name NN
- String gender 성별 ⇔  varchar() gender
- String rRN 주민번호 // Resident Registration Number, RRN
	⇔  varchar() rrn
- String email 이메일 ⇔ varchar() email
- String phoneNumber 연락처 ⇔ varchar() phone_number NN
- String address 주소 ⇔ varchar() address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
- String cRN 사업자등록번호 Company Registration Number, CRN
	⇔ varchar() crn

#### FoodtruckVO ⇔ foodtrucks
- int sellerId 판매자 번호 ⇔ integer seller_id NN <<FK>>
- String foodtruckImgPath 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
- String foodtruckName 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
- String foodtruckMainMenu 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
- String foodtruckLocation 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
- String foodtruckOperationHour 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
- int favoriteCount 좋아요 트럭 ⇔ integer favorite_count <<FK>>
- String sellerFoodtruckCoordinate 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
- Timestamp locationUpdatedAt 위치이동날짜 ⇔ timestamp location_updated_at
CURRENT_TIMESTAMP

#### EventVO ⇔ events
- int eventId 이벤트번호 ⇔ integer event_id <<PK>> NN AI
- String eventTitle 이벤트제목 ⇔ varchar(128) event_title NN
- String eventContent 이벤트내용 ⇔ text event_content NN
- Date eventStartDate 이벤트 시작 날짜 ⇔ datetime event_start_date NN
- Date eventEndDate 이벤트 종료 날짜 ⇔ datetime event_end_date 
- boolean eventOngoing 진행중 여부 ⇔ integer event_ongoing NN
- Timestamp eventCreatedAt 이벤트등록날짜 ⇔ timestamp event_created_at   CURRENT_TIMESTAMP NN 
- Timestamp eventUpdatedAt 이벤트수정날짜 ⇔ timestamp event_updated_at   CURRENT_TIMESTAMP                      

#### MenuVO ⇔ menus
- int menuId <<PK>> 메뉴번호 ⇔ integer menu_id <<PK>> NN AI
- String menuName 메뉴이름 ⇔ varchar(64) menu_name NN
- String menuType 메뉴종류 ⇔ varchar(32) menu_type NN
- int menuPrice 메뉴가격 ⇔ integer menu_price NN
- String menuPic 메뉴사진 ⇔ varchar(512) menu_pic NN 
- String menuInfor 메뉴정보 ⇔ varchar(512) menu_infor NN
- String rawMaterials 메뉴 원재료 ⇔ varchar(256) raw_Materials

#### Menu
- String category;
- 

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

#### Like 좋아요
- int likeMenuNum 메뉴 좋아요 개수 ⇔ integer like_menu_num
- int likefoodtruckNum 푸드트럭 좋아요 개수 ⇔ integer like_foodtruck_num

#### 배너(광고) ad
int adPrice 광고금액 ⇔ integer ad_price 
Date adStartDate 적용 시작 기간 ⇔ datetime ad_start_date 
Date adEndtDate 적용 종료 기간 ⇔ datetime ad_Endt_date 
String adLocation 노출 위치 ⇔ text ad_location 

#### 리뷰 ReviewVO ⇔ review
- int reviewId <<PK>> 리뷰번호 ⇔ integer review_id <<PK>> NN AI
- String login <<FK>> 리뷰 작성자 ⇔ varchar(12) login <<FK>> NN
- int reviewDepth 답글여부(문의는 0 답글은 1) ⇔ int review_depth NN
- int reviewPnum 답글일 경우 부모(문의) 번호 ⇔ int review_pnum
/*- String reviewTitle 리뷰제목 ⇔ varchar(64) review_title NN*/
- String reviewContent 리뷰내용 ⇔ text review_content NN
- String reviewPoto 리뷰사진 ⇔ varchar(512) review_poto
- Date reviewCreatedAt 리뷰 작성일 ⇔ timestamp review_created_at CURRENT_TIMESTAMP  NN

#### QaVO ⇔ qa Q&A
- int qaId <<PK>> 문의번호 ⇔ integer qa_id <<PK>> NN AI
- String login <<FK>> 문의 작성자 ⇔ varchar(12) login <<FK>> NN
- String qaContent 문의 내용 ⇔ varchar(2048) qa_content NN
- int qaDepth 답글여부(문의는 0 답글은 1) ⇔ int qa_depth NN
- int qaPnum 답글일 경우 부모(문의) 번호 ⇔ int qa_pnum 
- Date qaCreatedAt 문의작성일 ⇔ timestamp qa_created_at CURRENT_TIMESTAMP  NN



#### OrderVO ⇔ orders
- int orderId <<PK>> 주문번호 ⇔ integer order_id <<PK>> NN AI
- String login <<FK>> 주문한 사람의 아이디 ⇔ varchar(12) login <<FK>> NN
- String orderName 주문 메뉴 이름 ⇔ varcahr(512) order_name NN
- String orderNumber 주문 메뉴 개수 ⇔ varchar(128) order_number NN
- String orderPrice 주문 메뉴 가격 ⇔ varchar(512) order_price NN
- int orderPriceSum 주문 메뉴 가격합 ⇔ integer order_price_sum NN


## URL 매핑 정의
- default.fdl "/"
	main.fdl (form; get; 비회원)
- mypage.fdl 마이페이지 (로그인 인증 후 리다이렉트; 회원)
- 가입 할 수 있다 (암호화 저장 처리)
	member_new_form.fdl (form; get; 비회원) 
	member_join.fdl (proc; post; dao; 비회원)
- 로그인 중복체크 할 수 있다
	member_dupcheck.fdl (proc; get; dao; 비회원)
- 로그인 할 수 있다 (세션+암호화 인증)
	member_login.fdl (proc, post, dao; 암호화; 세션; 회원)
- 로그아웃 할 수 있다
	member_logout.fdl (proc, get, 세션; 회원)
- 자신의 정보를 상세보기 할 수 있다
	member_show.fdl (proc, get, ?mbId=x, 비회원)
- 자신의 정보를 갱신 할 수 있다
	member_edit_form.fdl (proc, get, ?mbId=x, 회원, 인증; 세션)
	member_update.fdl (proc, post, 세션, dao, 회원)
- 탈퇴 할 수 있다 (미정) x
- 전체 회원의 리스트를 조회 할 수 있다 (어드민)
	member_list.fdl (proc, get, dao, 어드민 회원)
	member_list.fdl (proc, get, ?pg=1, dao, 어드민 회원)

//
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

## view 디렉터리 구조 (/webapp)
webapp/resources (css, js, html, images, ...)
webapp/WEB-INF/views
webapp/WEB-INF/default.jsp
webapp/WEB-INF/views/	뷰템플릿 UI
webapp/WEB-INF/views/common
webapp/WEB-INF/views/member
webapp/WEB-INF/views/seller
webapp/WEB-INF/views/menu
webapp/WEB-INF/views/notice
webapp/WEB-INF/views/reply
webapp/WEB-INF/views/event

## 문맥 설정
/WEB-INF/spring/appServlet/servlet-context.xml

## Java 패키지 구조 (src/main/java)
com.fdl.foodlee.
com.fdl.foodlee.controller.
com.fdl.foodlee.controller.HomeController
com.fdl.foodlee.controller.BossController
com.fdl.foodlee.controller.MapController
com.fdl.foodlee.controller.MemberController (어노테이션)
com.fdl.foodlee.controller.TruckDetailController

com.fdl.foodlee.model.
com.fdl.foodlee.model.vo.MemberVO
com.fdl.foodlee.model.dao.inf.IMemberDAO
com.fdl.foodlee.model.dao.impl.MemberMysqlDAOImpl
com.fdl.foodlee.model.vo.MenuVO
com.fdl.foodlee.model.dao.inf.IMenuDAO
com.fdl.foodlee.model.dao.impl.MenuMysqlDAOImpl
com.fdl.foodlee.model.vo.FoodtruckVO
com.fdl.foodlee.model.dao.inf.IFoodtruckDAO
com.fdl.foodlee.model.dao.impl.FoodtruckMysqlDAOImpl
com.fdl.foodlee.model.vo.BossVO
com.fdl.foodlee.model.dao.inf.IBossDAO
com.fdl.foodlee.model.dao.impl.BossMysqlDAOImpl
com.fdl.foodlee.model.vo.BossVO
com.fdl.foodlee.model.dao.inf.IBossDAO
com.fdl.foodlee.model.dao.impl.BossMysqlDAOImpl
... 

## java 패키지 구조 정의 (src/main/java)
com.fdl.foodlee.
com.fdl.foodlee.controller. 컨트롤러 (서블릿)
com.fdl.foodlee.controller.MemberEditFormController
com.fdl.foodlee.controller.MemberJoinController
com.fdl.foodlee.controller.MemberListController
com.fdl.foodlee.controller.MemberLoginController
com.fdl.foodlee.controller.MemberLoginFormController
com.fdl.foodlee.controller.MemberJoinFormController
com.fdl.foodlee.controller.MemberShowController
com.fdl.foodlee.controller.MemberUpdateController
com.fdl.foodlee.model.  // data, VO/DTO 엔티티 도메인 표현
com.fdl.foodlee.model.vo.MemberVO <-> members TBL
com.fdl.foodlee.model.vo.SellerVO <-> sellers TBL
com.fdl.foodlee.model.vo.FoodtruckVO <-> foodtrucks TBL
com.fdl.foodlee.model.vo.MenuVO <-> menus TBL
com.fdl.foodlee.model.vo.NoticeVO <-> notices TBL
com.fdl.foodlee.model.vo.ReplyVO <-> replies TBL
com.fdl.foodlee.model.dao. // DAO 중개 (저장단과 다른 계층을 중개)
com.fdl.foodlee.model.dao.inf. (DAO 인터페이스)
com.fdl.foodlee.model.dao.inf.IMemberDAO
com.fdl.foodlee.model.dao.inf.ISellerDAO
com.fdl.foodlee.model.dao.inf.IFoodtruckDAO
com.fdl.foodlee.model.dao.inf.IMenuDAO
com.fdl.foodlee.model.dao.inf.INoticeDAO
com.fdl.foodlee.model.dao.inf.IReplyDAO
com.fdl.foodlee.model.dao.impl. (DAO 구현체)
com.fdl.foodlee.model.dao.impl.MemberMysqlDAOImpl
com.fdl.foodlee.model.dao.impl.SellerMysqlDAOImpl
com.fdl.foodlee.model.dao.impl.FoodtruckMysqlDAOImpl
com.fdl.foodlee.model.dao.impl.MenuMysqlDAOImpl
com.fdl.foodlee.model.dao.impl.NoticeMysqlDAOImpl
com.fdl.foodlee.model.dao.impl.ReplyMysqlDAOImpl
com.fdl.foodlee.service.
com.fdl.foodlee.service.inf.
com.fdl.foodlee.service.inf.
com.fdl.foodlee.service.impl.
com.fdl.foodlee.service.impl.

