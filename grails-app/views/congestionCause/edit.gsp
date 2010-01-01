

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'congestionCause.label', default: 'CongestionCause')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${congestionCauseInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionCauseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${congestionCauseInstance?.id}" />
                <g:hiddenField name="version" value="${congestionCauseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reason"><g:message code="congestionCause.reason.label" default="Reason" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionCauseInstance, field: 'reason', 'errors')}">
                                    <g:textField name="reason" value="${congestionCauseInstance?.reason}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imageSrc"><g:message code="congestionCause.imageSrc.label" default="Image Src" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionCauseInstance, field: 'imageSrc', 'errors')}">
                                    <g:textField name="imageSrc" value="${congestionCauseInstance?.imageSrc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="congestion_cause"><g:message code="congestionCause.congestion_cause.label" default="Congestioncause" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionCauseInstance, field: 'congestion_cause', 'errors')}">
                                    
<ul>
<g:each in="${congestionCauseInstance?.congestion_cause?}" var="c">
    <li><g:link controller="report" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="report" action="create" params="['congestionCause.id': congestionCauseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'report.label', default: 'Report')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iconName"><g:message code="congestionCause.iconName.label" default="Icon Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionCauseInstance, field: 'iconName', 'errors')}">
                                    <g:textField name="iconName" value="${congestionCauseInstance?.iconName}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
