

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'congestionLevel.label', default:'CongestionLevel')}" />
        <title>Create ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${congestionLevelInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionLevelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="level">
                                      <g:message code="congestionLevel.level.label" default="Level" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:congestionLevelInstance,field:'level','errors')}">
                                    <input type="text" id="level" name="level" value="${fieldValue(bean:congestionLevelInstance,field:'level')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="info">
                                      <g:message code="congestionLevel.info.label" default="Info" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:congestionLevelInstance,field:'info','errors')}">
                                    <input type="text" id="info" name="info" value="${fieldValue(bean:congestionLevelInstance,field:'info')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
