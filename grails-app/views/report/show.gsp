

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'report.label', default:'Report')}" />
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
                               <g:message code="report.id.label" default="Id" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.congestion_cause.label" default="Congestioncause" />:
                            </td>
                            
                            <td valign="top" class="value"><g:link controller="congestionCause" action="show" id="${reportInstance?.congestion_cause?.id}">${reportInstance?.congestion_cause?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.congestion_level.label" default="Congestionlevel" />:
                            </td>
                            
                            <td valign="top" class="value"><g:link controller="congestionLevel" action="show" id="${reportInstance?.congestion_level?.id}">${reportInstance?.congestion_level?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.message.label" default="Message" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'message')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.latitude.label" default="Latitude" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'latitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.longitude.label" default="Longitude" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'longitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.accuracy.label" default="Accuracy" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'accuracy')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.dateCreated.label" default="Date Created" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="report.lastUpdated.label" default="Last Updated" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reportInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${reportInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
