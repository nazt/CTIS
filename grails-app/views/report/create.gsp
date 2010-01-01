

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
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
                                    <label for="congestion_cause"><g:message code="report.congestion_cause.label" default="Congestioncause" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'congestion_cause', 'errors')}">
                                    <g:select name="congestion_cause.id" from="${CongestionCause.list()}" optionKey="id" value="${reportInstance?.congestion_cause?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="congestion_level"><g:message code="report.congestion_level.label" default="Congestionlevel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'congestion_level', 'errors')}">
                                    <g:select name="congestion_level.id" from="${CongestionLevel.list()}" optionKey="id" value="${reportInstance?.congestion_level?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="report.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'message', 'errors')}">
                                    <g:textField name="message" value="${reportInstance?.message}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="report.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${fieldValue(bean: reportInstance, field: 'latitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="report.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: reportInstance, field: 'longitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accuracy"><g:message code="report.accuracy.label" default="Accuracy" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'accuracy', 'errors')}">
                                    <g:textField name="accuracy" value="${fieldValue(bean: reportInstance, field: 'accuracy')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heading"><g:message code="report.heading.label" default="Heading" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'heading', 'errors')}">
                                    <g:textField name="heading" value="${reportInstance?.heading}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="speed"><g:message code="report.speed.label" default="Speed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'speed', 'errors')}">
                                    <g:textField name="speed" value="${fieldValue(bean: reportInstance, field: 'speed')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationTimestamp"><g:message code="report.locationTimestamp.label" default="Location Timestamp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'locationTimestamp', 'errors')}">
                                    <g:datePicker name="locationTimestamp" precision="day" value="${reportInstance?.locationTimestamp}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationName"><g:message code="report.locationName.label" default="Location Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'locationName', 'errors')}">
                                    <g:textField name="locationName" value="${reportInstance?.locationName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="report.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${reportInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="report.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${reportInstance?.lastUpdated}"  />
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
