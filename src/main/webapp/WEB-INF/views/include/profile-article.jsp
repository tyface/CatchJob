<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<style>
.box {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.box-widget {

	border: none;
	position: relative
}
.widget-user .widget-user-header {
	padding: 20px;
	height: 120px;
	border-top-right-radius: 3px;
	border-top-left-radius: 3px
}

.widget-user .widget-user-username {
	margin-top: 0;
	margin-bottom: 5px;
	
	font-size: 25px;
	font-weight: 300;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2)
}

.widget-user .widget-user-desc {
	margin-top: 0
}

.widget-user .widget-user-image {
	position: absolute;
	top: 65px;
	left: 50%;
	margin-left: -45px
}

.widget-user .widget-user-image>img {
	width: 90px;
	height: auto;
	border: 3px solid #fff
}

.widget-user .box-footer {
	padding-top: 30px
}
.bg-aqua-active{
	color: #fff !important;
	background-color: #00a7d0 !important
}
.description-block.margin-bottom {
	margin-bottom: 25px
}
.description-block>.description-header {
	margin: 0;
	padding: 0;
	font-weight: 600;
	font-size: 16px
}

.description-block>.description-text {
	text-transform: uppercase
}
.box .border-right {
	border-right: 1px solid #f4f4f4
}


</style>
<article>
<div class="box box-widget widget-user">
          <!-- Add the bg color to the header using any of the bg-* classes -->
      <div class="widget-user-header bg-aqua-active">
        <h3 class="widget-user-username">${member.memberId}</h3>
<!--         <h5 class="widget-user-desc">Founder &amp; CEO</h5> -->
      </div>
      <div class="widget-user-image">
        <img class="img-circle" src="${pageContext.request.contextPath}/resources/img/user1-128x128.jpg" alt="User Avatar">
      </div>
      <div class="box-footer">
        <div class="row">
          <div class="col-sm-3 border-right">
            <div class="description-block">
              <h5 class="description-header" onclick="location.href='${pageContext.request.contextPath}/profile/reviews'">내 기업리뷰</h5>
<!--               <span class="description-text">숫자</span> -->
              <p class="description-text"></p>
            </div>
            <!-- /.description-block -->
          </div>
          <!-- /.col -->
          <div class="col-sm-3 border-right">
            <div class="description-block">
              <h5 class="description-header" onclick="location.href='${pageContext.request.contextPath}/profile/interviews'">내 면접후기</h5>
<!--               <span class="description-text">숫자</span> -->
              <p class="description-text"></p>
              
            </div>
            <!-- /.description-block -->
          </div>
          <!-- /.col -->
          <div class="col-sm-3">
            <div class="description-block">
              <h5 class="description-header" onclick="location.href='${pageContext.request.contextPath}/profile/follows'">팔로잉 기업</h5>
<!--               <span class="description-text">숫자</span> -->
              <p class="description-text"></p>              
            </div>
            <!-- /.description-block -->
          </div>
          <div class="col-sm-3 border-right">
            <div class="description-block">
              <h5 class="description-header" onclick="location.href='${pageContext.request.contextPath}/profile/recent'">최근 본 기업</h5>
<!--               <span class="description-text">숫자</span> -->
              <p class="description-text"></p>              
            </div>
            <!-- /.description-block -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
    </div>
</article>