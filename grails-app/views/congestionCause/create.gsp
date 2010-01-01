

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'congestionCause.label', default: 'CongestionCause')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${congestionCauseInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionCauseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
