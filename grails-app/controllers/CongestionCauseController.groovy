

class CongestionCauseController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ congestionCauseInstanceList: CongestionCause.list( params ), congestionCauseInstanceTotal: CongestionCause.count() ]
    }

    def show = {
        def congestionCauseInstance = CongestionCause.get( params.id )

        if(!congestionCauseInstance) {
            flash.message = "CongestionCause not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ congestionCauseInstance : congestionCauseInstance ]
        }
    }

    def delete = {
        def congestionCauseInstance = CongestionCause.get( params.id )
        if(congestionCauseInstance) {
            try {
                congestionCauseInstance.delete(flush:true)
                flash.message = "CongestionCause ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "CongestionCause ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "CongestionCause not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def congestionCauseInstance = CongestionCause.get( params.id )

        if(!congestionCauseInstance) {
            flash.message = "CongestionCause not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ congestionCauseInstance : congestionCauseInstance ]
        }
    }

    def update = {
        def congestionCauseInstance = CongestionCause.get( params.id )
        if(congestionCauseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(congestionCauseInstance.version > version) {
                    
                    congestionCauseInstance.errors.rejectValue("version", "congestionCause.optimistic.locking.failure", "Another user has updated this CongestionCause while you were editing.")

                    render view:'edit', model:[congestionCauseInstance:congestionCauseInstance]
                    return
                }
            }
            congestionCauseInstance.properties = params
            if(!congestionCauseInstance.hasErrors() && congestionCauseInstance.save()) {
                flash.message = "CongestionCause ${params.id} updated"

                redirect action:'show', id:congestionCauseInstance.id
            }
            else {
                render view:'edit', model:[congestionCauseInstance:congestionCauseInstance]
            }
        }
        else {
            flash.message = "CongestionCause not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def congestionCauseInstance = new CongestionCause()
        congestionCauseInstance.properties = params
        return ['congestionCauseInstance':congestionCauseInstance]
    }

    def save = {
        def congestionCauseInstance = new CongestionCause(params)
        if(congestionCauseInstance.save(flush:true)) {
            flash.message = "CongestionCause ${congestionCauseInstance.id} created"

            redirect action:"show", id:congestionCauseInstance.id
        }
        else {
            render view:'create', model:[congestionCauseInstance:congestionCauseInstance]
        }
    }
}
