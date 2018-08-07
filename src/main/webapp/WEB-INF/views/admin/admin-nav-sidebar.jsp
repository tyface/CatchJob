<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<style>

.form-horizontal {
	font-size: 18px;
}

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}

#sidebar {
     min-width: 300px;
    max-width: 250px;
    min-height: 100vh;
    border-right: 1px solid gray;
    transition: all 0.3s;
    color:gray;
}

#sidebar.active {
    margin-left: -250px;
}
a[data-toggle="collapse"] {
    position: relative;
    height:50px;
}
.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

#sidebar ul {
    padding: 15px 0;

}

#sidebar ul p {
    color: #ccc;
    padding: 10px;
}

#sidebar ul li a {
    padding: 3px;
    font-size: 1.5em;
    display: block;
}
#sidebar ul li a:hover {
    color:black;
    background: #fff;
}
#sidebar ul li.active > a, a[aria-expanded="true"] {
    color:#ccc;
	background: #fff;
}
ul ul a {
    font-size: 1.1em !important;
    padding-left: 30px !important;

}
</style>
<script>

$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});
</script>
 
<nav class="navbar navbar-inverse">
	<div class="navbar-header col-md-4 container">
		<div class="row">
		
		<div class="navbar-brand"><a id="sidebarCollapse">
		&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-th-list">&nbsp;</span>Admin Page</a></div>
 		</div>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span> ADMIN_1님 접속 상태입니다</a></li>
			<li class="pull-right"><button class="btn btn-danger navbar-btn">로그아웃</button>&nbsp;</li>
		</ul>
	</div>
	</nav>
	
	
	<div class="container-fluid">
	<div class="row">
	<div class="wrapper">
	 <nav id="sidebar" class="col-sm-2">
        <ul class="list-unstyled components" style="margin-top:50px">
            <li>
              <a href="#pageSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
              <i class="fa fa-users" aria-hidden="true"></i> MEMBER
              <i class="fa  fa-angle-down pull-right" aria-hidden="true"></i></a>
				<ul class="collapse list-unstyled" id="pageSubmenu1">
				    <li>
				        <a href="mngMber">회원 그룹</a>
				    </li>
				    <li>
				        <a href="mngAdmin">관리자 그룹</a>
				    </li>
				</ul>
            </li>
            <li>
              <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
              <i class="fa fa-building" aria-hidden="true"></i> COMPANY
              <i class="fa fa-angle-down pull-right" aria-hidden="true"></i></a></a>
              
				<ul class="collapse list-unstyled" id="pageSubmenu2">
				    <li>
				        <a href="mngEnt">기업 관리</a>
				    </li>
				    <li>
				        <a href="mngReview">리뷰 관리</a>
				    </li>
				</ul>
            </li>
            <li>
              <a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
              <i class="fa fa-list" aria-hidden="true"></i> CATEGORY
              <i class="fa  fa-angle-down pull-right" aria-hidden="true"></i></a></a>
				<ul class="collapse list-unstyled" id="pageSubmenu3">
				    <li>
				        <a href="#">산업군 관리</a>
				    </li>
				</ul>
            </li>
 			<li>
              <a href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
              <i class="fa fa-tachometer" aria-hidden="true"></i> DASHBOARD
              <i class="fa  fa-angle-down pull-right" aria-hidden="true"></i></a></a>
				<ul class="collapse list-unstyled" id="pageSubmenu4">
				    <li>
				        <a href="#">통계</a>
				    </li>
				</ul>
            </li>
             <li>
              <a href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fa fa-cogs" aria-hidden="true"></i> MANAGEMENT

              <i class="fa  fa-angle-down pull-right" aria-hidden="true"></i></a></a>
				<ul class="collapse list-unstyled" id="pageSubmenu5">
				    <li>
				        <a href="#">메인화면 관리</a>
				    </li>
				     <li>
				        <a href="#">QnA 관리</a>
				    </li>
				     <li>
				        <a href="#">팝업 관리</a>
				    </li>
				</ul>
            </li>
        </ul>
    </nav>
	