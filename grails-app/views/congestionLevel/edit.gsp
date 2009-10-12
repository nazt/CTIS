

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'congestionLevel.label', default:'CongestionLevel')}" />
        <title>Edit ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${congestionLevelInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionLevelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${congestionLevelInstance?.id}" />
                <input type="hidden" name="version" value="${congestionLevelInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="congestion_level">
                                    <g:message code="congestionLevel.congestion_level.label" default="Congestionlevel" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:congestionLevelInstance,field:'congestion_level','errors')}">
                                    <g:select name="congestion_level"
from="${Report.list()}"
size="5" multiple="yes" optionKey="id"
value="${congestionLevelInstance?.congestion_level}" />

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
