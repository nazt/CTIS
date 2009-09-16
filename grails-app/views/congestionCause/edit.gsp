

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'congestionCause.label', default:'CongestionCause')}" />
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
            <g:hasErrors bean="${congestionCauseInstance}">
            <div class="errors">
                <g:renderErrors bean="${congestionCauseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${congestionCauseInstance?.id}" />
                <input type="hidden" name="version" value="${congestionCauseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="congestion_cause">
                                    <g:message code="congestionCause.congestion_cause.label" default="Congestioncause" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:congestionCauseInstance,field:'congestion_cause','errors')}">
                                    
<ul>
<g:each var="c" in="${congestionCauseInstance?.congestion_cause?}">
    <li><g:link controller="report" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="report" params="['congestionCause.id':congestionCauseInstance?.id]" action="create">Add Report</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reason">
                                    <g:message code="congestionCause.reason.label" default="Reason" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:congestionCauseInstance,field:'reason','errors')}">
                                    <input type="text" id="reason" name="reason" value="${fieldValue(bean:congestionCauseInstance,field:'reason')}"/>
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
