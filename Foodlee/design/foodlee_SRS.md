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
	- 자신의 정보를 상세보기 할 수 있다
	- 자신의 정보를 갱신 할 수 있다
	- 탈퇴 할 수 있다 (미정)
	- 전체 회원의 리스트를 조회 할 수 있다 (어드민) ???
2. 판매자
3. 푸드트럭
4. 메뉴
5. 게시글
6. 댓글/리뷰
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

### 엔티티 스키마 (ERD - 논리/개념)
#### MemberVO
- int id <<PK>> 회원번호 
- String login <<UQ>> 아이디
- String password 비밀번호
- String name 이름
- String gender 성별
- String rRN 주민번호 // Resident Registration Number, RRN
- String email 이메일
- String phoneNumber 연락처
- String address 주소
- Date mbJoinedAt 가입날짜
- Date mbUpdatedAt 수정날짜

#### SellerVO
- int id <<PK>> 판매자 번호 
- String login <<UQ>> 아이디
- String password 비밀번호
- String name 이름
- String gender 성별
- String rRN 주민번호 // Resident Registration Number, RRN
- String email 이메일
- String phoneNumber 연락처
- String address 주소
- String cRN 사업자등록번호 Company Registration Number, CRN

#### FoodtruckVO
- String seller_foodtruck_location 판매자 푸드트럭 위치
- int id <<FK>> 판매자 번호
- int favoriteFoodtruck <<FK>> 좋아요 트럭
- int/String phoneNumber 연락처 <<FK>> 판매자 연락처

#### MenuVO
- 메뉴이름
- 메뉴종류
- 메뉴가격
- 메뉴사진
- 메뉴정보
- 메뉴 원산지
- 메뉴 알레르기 유발재료

<!--
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
 -->

#### NoticeVO (공지사항)


#### ReplyVO (댓글)




### DB 스키마 (ERD - 물리적)
#### members
- int id <<PK>> 회원번호  AI(AutoIncrement)
- varchar(12) login <<UQ>> 아이디 NN
- varchar(12) password 비밀번호 NN
- varchar(12) name 이름 NN
- varchar() gender 성별
- varchar() rRN 주민번호 // Resident Registration Number, RRN
- varchar() email 이메일
- varchar() phone_number 연락처
- varchar() address 주소
- timestamp mb_joined_at 가입날짜
- timestamp mb_updated_at 수정날짜

#### sellers
- int id <<PK>> 회원번호  AI(AutoIncrement)
- varchar(12) login <<UQ>> 아이디 NN
- varchar(12) password 비밀번호 NN
- varchar(12) name 이름 NN
- varchar() gender 성별
- varchar() rrn 주민번호 // Resident Registration Number, RRN
- varchar() email 이메일
- varchar() phone_number 연락처
- varchar() address 주소
- varchar() foodtruck_location 푸드트럭 위치
- varchar() crn 사업자등록번호 Company Registration Number, CRN
- timestamp mb_joined_at 가입날짜
- timestamp mb_updated_at 수정날짜

#### foodtrucks



## URL 매핑 정의
- default.my "/"
	=> 약식으로 member_login_form.my (form; get; 비회원)  
- mypage.my 마이페이지 (로그인 인증 후 리다이렉트; 회원)
- 가입 할 수 있다 (암호화 저장 처리)
	member_new_form.my (form; get; 비회원) 
	member_join.my (proc; post; dao; 비회원)
- 로그인 중복체크 할 수 있다
	member_dupcheck.my (proc; get; dao; 비회원)
- 로그인 할 수 있다 (세션+암호화 인증)
	member_login.my (proc, post, dao; 암호화; 세션; 회원)
- 로그아웃 할 수 있다
	member_logout.my (proc, get, 세션; 회원)
- 자신의 정보를 상세보기 할 수 있다
	member_show.my (proc, get, ?mbId=x, 비회원)
- 자신의 정보를 갱신 할 수 있다
	member_edit_form.my (proc, get, ?mbId=x, 회원, 인증; 세션)
	member_update.my (proc, post, 세션, dao, 회원)
- 탈퇴 할 수 있다 (미정) x
- 전체 회원의 리스트를 조회 할 수 있다 (어드민)
	member_list.my (proc, get, dao, 어드민 회원)
	member_list.my (proc, get, ?pg=1, dao, 어드민 회원)

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

## 문맥 설정
/WEB-INF/spring/appServlet/servlet-context.xml

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

