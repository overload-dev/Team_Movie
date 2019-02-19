<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.number==1 }">
	<div class="col-sm-3" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">
							개인정보관리
						</a>
						<a href="mShipBuyForm.tm" class="list-group-item list-group-item-action">
							회원 멤버쉽
						</a>
						<a href="userDelete.tm" class="list-group-item list-group-item-action">
							회원 탈퇴
						</a>
					</div>
		      	</div>
		    </div>
		</div>
</c:if>
<c:if test="${sessionScope.number==2 }">
<div class="col-sm-3" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="userDetail.tm" class="list-group-item list-group-item-action">
							개인정보관리
						</a>
						<a href="#" class="list-group-item list-group-item-action active">
							회원 멤버쉽
						</a>
						<a href="userDelete.tm" class="list-group-item list-group-item-action">
							회원 탈퇴
						</a>
					</div>
		      	</div>
		    </div>
		</div>
</c:if>
<c:if test="${sessionScope.number==3 }">
<div class="col-sm-3" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="userDetail.tm" class="list-group-item list-group-item-action">
							개인정보관리
						</a>
						<a href="mShipBuyForm.tm" class="list-group-item list-group-item-action">
							회원 멤버쉽
						</a>
						<a href="#" class="list-group-item list-group-item-action active">
							회원 탈퇴
						</a>
					</div>
		      	</div>
		    </div>
		</div>
</c:if>
<c:if test="${sessionScope.number==4 }">
<div class="col-sm-3" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">
							개인정보관리
						</a>
						<a href="mShipBuyForm.tm" class="list-group-item list-group-item-action">
							회원 멤버쉽
						</a>
						<a href="userDelete.tm" class="list-group-item list-group-item-action">
							회원 탈퇴
						</a>
					</div>
		      	</div>
		    </div>
		</div>
</c:if>
