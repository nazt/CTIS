

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'congestionLevel.label', default: 'CongestionLevel')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'congestionLevel.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="level" title="${message(code: 'congestionLevel.level.label', default: 'Level')}" />
                        
                            <g:sortableColumn property="info" title="${message(code: 'congestionLevel.info.label', default: 'Info')}" />
                        
                            <g:sortableColumn property="colour" title="${message(code: 'congestionLevel.colour.label', default: 'Colour')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${congestionLevelInstanceList}" status="i" var="congestionLevelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${congestionLevelInstance.id}">${fieldValue(bean: congestionLevelInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: congestionLevelInstance, field: "level")}</td>
                        
                            <td>${fieldValue(bean: congestionLevelInstance, field: "info")}</td>
                        
                            <td>${fieldValue(bean: congestionLevelInstance, field: "colour")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${congestionLevelInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
