<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "acl");%>
<%pageContext.setAttribute("currentMenu", "acl");%>
<!doctype html>
<html lang="zh_CN">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="auth.access.batchinput.title" text="批量录入"/></title>
    <%@include file="/common/s.jsp"%>
    <style type="text/css">
.dragClass {
    background-color: #EEEEEE;
}
    </style>
    <script type="text/javascript" src="${ctx}/jquery.tablednd.0.7.min.js"></script>
    <script type="text/javascript">
$(function() {
    $("#accessForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
});

function doPrev() {
    $('#accessForm').attr('method', 'get');
    $('#accessForm').attr('action', 'access-batch.do');
    $('#accessForm').submit();
}
    </script>
  </head>

  <body>
    <%@include file="/header/acl.jsp"%>

    <div class="row-fluid">
    <%@include file="/menu/acl.jsp"%>

    <!-- start of main -->
    <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="auth.access.batchinput.title" text="批量录入"/></h4>
		</header>

        <div class="content content-inner">

<form id="accessForm" method="post" action="user-connector-batch!input.do" class="form-horizontal">
  <div class="control-group">
	<label class="control-label" for="access_perm"><spring:message code='auth.access.input.import' text='批量导入'/></label>
    <div class="controls">
	  <textarea name="userText" style="width:600px;" rows="10">${userText}</textarea>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button id="submitButton" class="btn btn-primary"><spring:message code='core.step.next' text='下一步'/></button>
    </div>
  </div>
</form>
        </div>
      </article>

      <div class="m-spacer"></div>

    </section>
    <!-- end of main -->
	</div>

  </body>

</html>
