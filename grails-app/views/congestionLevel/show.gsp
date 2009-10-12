

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'congestionLevel.label', default:'CongestionLevel')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Show ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="congestionLevel.id.label" default="Id" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:congestionLevelInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="congestionLevel.level.label" default="Level" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:congestionLevelInstance, field:'level')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="congestionLevel.info.label" default="Info" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:congestionLevelInstance, field:'info')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="congestionLevel.congestion_level.label" default="Congestionlevel" />:
                            </td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="c" in="${congestionLevelInstance.congestion_level}">
                                    <li><g:link controller="report" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${congestionLevelInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
