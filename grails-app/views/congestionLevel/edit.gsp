

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'congestionLevel.label', default: 'CongestionLevel')}" />
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
            <g:hasErrors bean="${congestionLevelInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionLevelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${congestionLevelInstance?.id}" />
                <g:hiddenField name="version" value="${congestionLevelInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="level"><g:message code="congestionLevel.level.label" default="Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionLevelInstance, field: 'level', 'errors')}">
                                    <g:textField name="level" value="${fieldValue(bean: congestionLevelInstance, field: 'level')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="info"><g:message code="congestionLevel.info.label" default="Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionLevelInstance, field: 'info', 'errors')}">
                                    <g:textField name="info" value="${congestionLevelInstance?.info}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="colour"><g:message code="congestionLevel.colour.label" default="Colour" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionLevelInstance, field: 'colour', 'errors')}">
                                    <g:textField name="colour" value="${congestionLevelInstance?.colour}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="congestion_level"><g:message code="congestionLevel.congestion_level.label" default="Congestionlevel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: congestionLevelInstance, field: 'congestion_level', 'errors')}">
                                    
<ul>
<g:each in="${congestionLevelInstance?.congestion_level?}" var="c">
    <li><g:link controller="report" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="report" action="create" params="['congestionLevel.id': congestionLevelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'report.label', default: 'Report')])}</g:link>

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
