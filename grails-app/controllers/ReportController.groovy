

class ReportController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ reportInstanceList: Report.list( params ), reportInstanceTotal: Report.count() ]
    }

    def show = {
        def reportInstance = Report.get( params.id )

        if(!reportInstance) {
            flash.message = "Report not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ reportInstance : reportInstance ]
        }
    }

    def delete = {
        def reportInstance = Report.get( params.id )
        if(reportInstance) {
            try {
                reportInstance.delete(flush:true)
                flash.message = "Report ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Report ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Report not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def reportInstance = Report.get( params.id )

        if(!reportInstance) {
            flash.message = "Report not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ reportInstance : reportInstance ]
        }
    }

    def update = {
        def reportInstance = Report.get( params.id )
        if(reportInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(reportInstance.version > version) {
                    
                    reportInstance.errors.rejectValue("version", "report.optimistic.locking.failure", "Another user has updated this Report while you were editing.")

                    render view:'edit', model:[reportInstance:reportInstance]
                    return
                }
            }
            reportInstance.properties = params
            if(!reportInstance.hasErrors() && reportInstance.save()) {
                flash.message = "Report ${params.id} updated"

                redirect action:'show', id:reportInstance.id
            }
            else {
                render view:'edit', model:[reportInstance:reportInstance]
            }
        }
        else {
            flash.message = "Report not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return ['reportInstance':reportInstance]
    }

    def save = {
        def reportInstance = new Report(params)
        if(reportInstance.save(flush:true)) {
            flash.message = "Report ${reportInstance.id} created"

			/*            redirect action:"show", id:reportInstance.id*/
			redirect(controller:"iwebkit",action:"index")
        }
        else {
            render view:'create', model:[reportInstance:reportInstance]
        }
    }
}
