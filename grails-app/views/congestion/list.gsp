

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'congestion.label', default:'Congestion')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>${entityName} List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="${message(code:'congestion.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="info" title="${message(code:'congestion.info.label', default:'Info')}" />
                        
                   	        <g:sortableColumn property="level" title="${message(code:'congestion.level.label', default:'Level')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${congestionInstanceList}" status="i" var="congestionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${congestionInstance.id}">${fieldValue(bean:congestionInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:congestionInstance, field:'info')}</td>
                        
                            <td>${fieldValue(bean:congestionInstance, field:'level')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${congestionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
