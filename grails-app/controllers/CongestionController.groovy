

class CongestionController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ congestionInstanceList: Congestion.list( params ), congestionInstanceTotal: Congestion.count() ]
    }

    def show = {
        def congestionInstance = Congestion.get( params.id )

        if(!congestionInstance) {
            flash.message = "Congestion not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ congestionInstance : congestionInstance ]
        }
    }

    def delete = {
        def congestionInstance = Congestion.get( params.id )
        if(congestionInstance) {
            try {
                congestionInstance.delete(flush:true)
                flash.message = "Congestion ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Congestion ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Congestion not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def congestionInstance = Congestion.get( params.id )

        if(!congestionInstance) {
            flash.message = "Congestion not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ congestionInstance : congestionInstance ]
        }
    }

    def update = {
        def congestionInstance = Congestion.get( params.id )
        if(congestionInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(congestionInstance.version > version) {
                    
                    congestionInstance.errors.rejectValue("version", "congestion.optimistic.locking.failure", "Another user has updated this Congestion while you were editing.")

                    render view:'edit', model:[congestionInstance:congestionInstance]
                    return
                }
            }
            congestionInstance.properties = params
            if(!congestionInstance.hasErrors() && congestionInstance.save()) {
                flash.message = "Congestion ${params.id} updated"

                redirect action:'show', id:congestionInstance.id
            }
            else {
                render view:'edit', model:[congestionInstance:congestionInstance]
            }
        }
        else {
            flash.message = "Congestion not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def congestionInstance = new Congestion()
        congestionInstance.properties = params
        return ['congestionInstance':congestionInstance]
    }

    def save = {
        def congestionInstance = new Congestion(params)
        if(congestionInstance.save(flush:true)) {
            flash.message = "Congestion ${congestionInstance.id} created"

            redirect action:"show", id:congestionInstance.id
        }
        else {
            render view:'create', model:[congestionInstance:congestionInstance]
        }
    }
}
