

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'report.id.label', default: 'Id')}" />
                        
                            <th><g:message code="report.congestion_cause.label" default="Congestioncause" /></th>
                   	    
                            <th><g:message code="report.congestion_level.label" default="Congestionlevel" /></th>
                   	    
                            <g:sortableColumn property="message" title="${message(code: 'report.message.label', default: 'Message')}" />
                        
                            <g:sortableColumn property="latitude" title="${message(code: 'report.latitude.label', default: 'Latitude')}" />
                        
                            <g:sortableColumn property="longitude" title="${message(code: 'report.longitude.label', default: 'Longitude')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportInstanceList}" status="i" var="reportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reportInstance.id}">${fieldValue(bean: reportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reportInstance, field: "congestion_cause")}</td>
                        
                            <td>${fieldValue(bean: reportInstance, field: "congestion_level")}</td>
                        
                            <td>${fieldValue(bean: reportInstance, field: "message")}</td>
                        
                            <td>${fieldValue(bean: reportInstance, field: "latitude")}</td>
                        
                            <td>${fieldValue(bean: reportInstance, field: "longitude")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
