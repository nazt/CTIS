

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'report.label', default:'Report')}" />
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
            <g:hasErrors bean="${reportInstance}">
            <div class="errors">
                <g:renderErrors bean="${reportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accuracy">
                                      <g:message code="report.accuracy.label" default="Accuracy" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'accuracy','errors')}">
                                    <input type="text" id="accuracy" name="accuracy" value="${fieldValue(bean:reportInstance,field:'accuracy')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="congestion_cause">
                                      <g:message code="report.congestion_cause.label" default="Congestioncause" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'congestion_cause','errors')}">
                                    <g:select optionKey="id" from="${CongestionCause.list()}" name="congestion_cause.id" value="${reportInstance?.congestion_cause?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="congestion_level">
                                      <g:message code="report.congestion_level.label" default="Congestionlevel" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'congestion_level','errors')}">
                                    <g:select optionKey="id" from="${Congestion.list()}" name="congestion_level.id" value="${reportInstance?.congestion_level?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">
                                      <g:message code="report.dateCreated.label" default="Date Created" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${reportInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">
                                      <g:message code="report.lastUpdated.label" default="Last Updated" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${reportInstance?.lastUpdated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude">
                                      <g:message code="report.latitude.label" default="Latitude" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'latitude','errors')}">
                                    <input type="text" id="latitude" name="latitude" value="${fieldValue(bean:reportInstance,field:'latitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude">
                                      <g:message code="report.longitude.label" default="Longitude" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'longitude','errors')}">
                                    <input type="text" id="longitude" name="longitude" value="${fieldValue(bean:reportInstance,field:'longitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message">
                                      <g:message code="report.message.label" default="Message" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reportInstance,field:'message','errors')}">
                                    <input type="text" id="message" name="message" value="${fieldValue(bean:reportInstance,field:'message')}"/>
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
