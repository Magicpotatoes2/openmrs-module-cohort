<!--Uncomment this and comment the rest to see new UI prototype -->

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="template/header.jsp" %>
<openmrs:htmlInclude file="/moduleResources/cohort/styles/manageCohorts.css" />
<title><openmrs:message code="openmrs.title"/></title> <!--set page title-->
</head>
<%@ include file="template/navbar.jsp" %>

<!--Code body here -->

<section class="top-options">
    <div class="container">
        <div class="row">
            <div class="col-sm-7">
                <form class="form-inline" id="login" method="get">
                    <input class="btn btn-default form-control" type="submit" id="search" name="search" value="search">
                    <spring:bind path="cohortmodule.name">
                        <input class="form-control cohort-search" type="text" id="name" name="name" value="${status.value}" placeholder="Cohort Search"
                               required>
                        <c:if test="${status.errorMessage != ''}">
                            <span class="error">${status.errorMessage}</span>
                        </c:if>
                    </spring:bind>
                </form>
            </div>
            <div class="col-sm-2 create-cohort-button">
                <a class="btn btn-default" href="addcohort.form">
                    <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                    <span><spring:message code="cohort.createcohort"/></span>
                </a>
            </div>
            <div class="col-sm-2 create-group-cohort-button">
                <a class="btn btn-default" href="groupcohort.form">
                    <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                    <span>Create Group Cohort</span>
                </a>
            </div>
        </div>
    </div>
</section>

<c:if test="${cohortExists == 'true'}">
    <c:forEach var="cohort" items="${cohortList}" varStatus="status">
        <section class="successful-search-body">
            <div class="container" >
                <div class="row">
                    <div class="col-sm-4">
                        <div class="table-container details-container">
                            <table class="table">
                                <thead class="thead-inverse">
                                <tr>
                                    <th><h4>Details</h4></th>
                                    <th ></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Cohort Name</th>
                                        <td>${cohort.name}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Cohort Id</th>
                                        <td>${cohort.id}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Cohort Program</th>
                                        <td>${cohort.cohortProgram.name}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Location</th>
                                        <td>${cohort.clocation}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Start Date</th>
                                        <td>${fn:substring(cohort.startDate, 0, 10)}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">End Date</th>
                                        <td>${fn:substring(cohort.endDate, 0, 10)}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="cohort-name">
                            <h2>
                                <span>${cohort.name}</span>
                            </h2>
                        </div>
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="cohort-description-heading">
                                    <h4>Description</h4>
                                </div>
                                <div class="cohort-description-content">
                                        ${cohort.description}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <!--Visits and Encounters here -->
                    </div>
                    <div class="col-sm-2">
                        <div class="box-right">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/module/cohort/addcohortattributes.form?ca=${cohort.cohortId}"><i class="fa fa-dot-circle-o fa-2x" aria-hidden="true"></i>
                                <span class="desc-1">Add Attribute</span></a>
                        </div>
                        <div class="box-right">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/module/cohort/htmlFormEntry.form?coh=${cohort.cohortId}&htmlformId=${htmlformId}"><i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>
                                <span class="desc-2">Add Encounter</span></a>
                        </div>
                        <div class="box-right">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/module/cohort/cpatients.form?cpid=${cohort.cohortId}">
                                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i><span class="desc-3"> Add Member</span></a>
                        </div>
                    </div>
                </div>
            </div>
    
            <!--User media carousel-->
    
            <div class="container carousel-outer">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="cohort-description-heading users-heading">
                            <h4>Cohort Members</h4>
                        </div>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-sm-12'>
                        <div class="jumbotron carousel slide media-carousel" id="media">
                            <div class="carousel slide media-carousel" id="eventCarousel" data-interval="0">
                                <div class="carousel-inner onebyone-carosel" id="carousel-inner">
                                    
                                    
                                    <c:forEach var="member" items="${memberList[status.index]}" varStatus="memberStatus">
                                        <div class="item">
                                            <div class="col-sm-3">
                                                <div class="dropdown">
                                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                        <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                        <li>
                                                            <table class="table table-hover person-details-table">
                                                                <tbody>
                                                                <tr>
                                                                    <span class="person-attribute-label"><strong>Name</strong>:</span>
                                                                    <span class="person-detail-label">${member.person.givenName} ${member.person.familyName}</span>
                                                                </tr>
                                                        <li role="separator" class="divider"></li>
    
                                                        <tr>
                                                            <span class="person-attribute-label"><strong>Member Id</strong>:</span>
                                                            <span class="person-detail-label">${member.cohortMemberId}</span>
                                                        </tr>
                                                        <li role="separator" class="divider"></li>
    
    
                                                        <tr>
                                                            <span class="person-attribute-label"><strong>Start Date</strong>:</span>
                                                            <span class="person-detail-label">${fn:substring(member.startDate, 0, 10)}</span>
                                                        </tr>
                                                        <li role="separator" class="divider"></li>
    
                                                        <tr>
                                                            <span class="person-attribute-label"><strong>End Date</strong>:</span>
                                                            <span class="person-detail-label">${fn:substring(member.endDate, 0, 10)}</span>
                                                        </tr>
                                                        <li role="separator" class="divider"></li>
    
                                                        <tr>
                                                            <span class="person-attribute-label"><strong>Role</strong>:</span>
                                                            <span class="person-detail-label">${member.role}</span>
                                                        </tr>
    
                                                        </tbody>
                                                        </table>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${member.person.gender == 'F'}">
                                                        <a class="female thumbnail" href="#"></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="male thumbnail" href="#"></a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <h3 class="member-name">${member.person.givenName} ${member.person.familyName}</h3>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    
                                </div>
                                <a data-slide="prev" href="#eventCarousel" class="left carousel-control"><i class="fa fa-caret-left fa-4x" aria-hidden="true"></i></a>
                                <a data-slide="next" href="#eventCarousel" class="right carousel-control"><i class="fa fa-caret-right fa-4x" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
        </section>
        <hr />
    </c:forEach>
</c:if>

<c:if test="${cohortExists == 'false'}">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="not-found">No cohorts currently exist with this name!</h3>            
            </div>
        </div>
    </div>
    
    
</c:if>
<!--Script includes for new UI -->
<openmrs:htmlInclude file="/moduleResources/cohort/scripts/jquery.js" />
<openmrs:htmlInclude file="/moduleResources/cohort/bootstrap/js/bootstrap.js" />
<openmrs:htmlInclude file="/moduleResources/cohort/scripts/manageCohorts.js" />
<!--END-->


<%--<!--LEGACY CODE -->--%>


<%--<%@ include file="/WEB-INF/template/include.jsp" %>--%>
<%--<%@ include file="/WEB-INF/template/header.jsp" %>--%>

<%--<%@ include file="template/localHeader.jsp" %>--%>
<%--<h3>Manage Cohort </h3>--%>
<%--<a href="addcohort.form"><spring:message code="cohort.createcohort"/></a>--%>
<%--<a href="groupcohort.form">Create Group Cohort</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<div>--%>
<%--<b class="boxHeader"><spring:message code="cohort.findcohort"/></b>--%>
<%--<div class="box">--%>
<%--<!--   <div class="searchWidgetContainer" id="createCohort">--%>
<%--</div>--%>
<%---->--%>
<%--<form id="login" method="get">--%>
<%--<spring:bind path="cohortmodule.name">--%>
<%--<spring:message--%>
<%--code="cohort.searchcohorts"/> :<input type="text" id="name" name="name" value="${status.value}" placeholder="Search..."--%>
<%--required>--%>
<%--<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>--%>
<%--</spring:bind>--%>
<%--<input type="submit" id="search" name="search" value="search">--%>
<%--</form>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="box">--%>
<%--<div>--%>
<%--<table class="tableStlye">--%>
<%--<thead>--%>
<%--<tr>--%>
<%--<th class="thStyle" id="thStyle">Cohort Name</th>--%>
<%--<th class="thStyle" id="thStyle">Description</th>--%>
<%--<th class="thStyle" id="thStyle">Cohort Type</th>--%>
<%--<th class="thStyle" id="thStyle">Cohort Program</th>--%>
<%--<th class="thStyle" id="thStyle">Location</th>--%>
<%--<th class="thStyle" id="thStyle">Start Date</th>--%>
<%--<th class="thStyle" id="thStyle">End Date</th>--%>
<%--</tr>--%>
<%--</thead>--%>
<%--<tbody>--%>
<%--<c:forEach var="ls" items="${CohortList}" varStatus="status">--%>
<%--<tr class='${status.index % 2 == 0 ? "oddRow" : "evenRow" }'>--%>
<%--<td class="tdStyle">--%>
<%--<a href="${pageContext.request.contextPath}/module/cohort/editcohort.form?cid=${cohort.cohortId}">${cohort.name}</a>--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.description}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.cohortType.name}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.cohortProgram.name}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.clocation}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.startDate}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--${cohort.endDate}--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--<a href="${pageContext.request.contextPath}/module/cohort/addcohortattributes.form?ca=${cohort.cohortId}">Add--%>
<%--Attribute</a>--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--<a href="${pageContext.request.contextPath}/module/cohort/cpatients.form?cpid=${cohort.cohortId}">Add--%>
<%--Cohort Member</a>--%>
<%--</td>--%>
<%--<td class="tdStyle">--%>
<%--<a href="${pageContext.request.contextPath}/module/cohort/htmlFormEntry.form?coh=${cohort.cohortId}&htmlformId=${htmlformId}">Add--%>
<%--Encounter</a>--%>
<%--</td>--%>
<%--</tr>--%>
<%--</c:forEach>--%>
<%--</tbody>--%>
<%--</table>--%>
<%--</div>--%>
<%--</div>--%>
<%--<%@ include file="/WEB-INF/template/footer.jsp" %>--%>