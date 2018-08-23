<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
<link href="/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
p.list-group-item-text {
	margin: 5px 0;
}
#result.col-xs-6 { 
	border: 1px solid black;
}
</style>
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>



<div class="container">
	<div class="input-group">
      <input type="text" name="q" class="form-control" placeholder="직업 입력">
      <span class="input-group-btn">
        <button class="btn btn-default" id="searchBtn" type="button">검색</button>
      </span>
    </div><!-- /input-group -->
    <hr>
    <div id="result"></div>
</div>
<div id="pocket"></div>
<script src="/assets/js/jquery-3.2.1.min.js"></script>
<script src="/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
$('input[name="q"]').keydown(function(event){
	if(event.keyCode == 13){ // enter-click
		$('#searchBtn').trigger('click');
	}
});

$('#searchBtn').click(function(){
	var q = $('input[name="q"]').val();
	if(q.length > 1){
		fetchSearchResult(q);
	} else {
		alert('검색어는 2글자 이상 입력하세요!');
	}
});

function fetchSearchResult(q){
	//console.log(q);
	$.get('sarmin.php',{
		keywords: q
	}).done(function(data){
		//console.log(data);
		var items = $(data).find('job');
		var results = [];
		//console.log(items);
		$.each(items, function(k, v){
			var title = $(this).find('title').text();
			var jobtype = $(this).find('job-type').text();
			var jobcategory = $(this).find('job-category').text();
			var salary = $(this).find('salary').text();
			var url = $(this).find('url').text();
			//console.log(url);
			results.push('<a href="'+url+'" class="list-group-item" target="_blank"><div class="row"><div class="col-md-10"><h4 class="list-group-item-heading"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> '+title+'</h4><p class="list-group-item-text"><span class="label label-success"></span> '+jobtype+'</p><p class="list-group-item-text"><span class="label label-success">카테고리</span> '+jobcategory+'</p><p class="list-group-item-text"><span class="label label-success">연봉</span> '+salary+'</p></div></div></a>');
		});
		$('#result').html(results.join(''));
	});
};

// click item
$(document).on('click', 'a.list-group-item', function(evt){
	$(this).siblings().removeClass('active').end().addClass('active');
});
</script>
</body>
</html>