

class CongestionLevelController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ congestionLevelInstanceList: CongestionLevel.list( params ), congestionLevelInstanceTotal: CongestionLevel.count() ]
    }

    def show = {
        def congestionLevelInstance = CongestionLevel.get( params.id )

        if(!congestionLevelInstance) {
            flash.message = "CongestionLevel not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ congestionLevelInstance : congestionLevelInstance ]
        }
    }

    def delete = {
        def congestionLevelInstance = CongestionLevel.get( params.id )
        if(congestionLevelInstance) {
            try {
                congestionLevelInstance.delete(flush:true)
                flash.message = "CongestionLevel ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "CongestionLevel ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "CongestionLevel not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def congestionLevelInstance = CongestionLevel.get( params.id )

        if(!congestionLevelInstance) {
            flash.message = "CongestionLevel not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ congestionLevelInstance : congestionLevelInstance ]
        }
    }

    def update = {
        def congestionLevelInstance = CongestionLevel.get( params.id )
        if(congestionLevelInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(congestionLevelInstance.version > version) {
                    
                    congestionLevelInstance.errors.rejectValue("version", "congestionLevel.optimistic.locking.failure", "Another user has updated this CongestionLevel while you were editing.")

                    render view:'edit', model:[congestionLevelInstance:congestionLevelInstance]
                    return
                }
            }
            congestionLevelInstance.properties = params
            if(!congestionLevelInstance.hasErrors() && congestionLevelInstance.save()) {
                flash.message = "CongestionLevel ${params.id} updated"

                redirect action:'show', id:congestionLevelInstance.id
            }
            else {
                render view:'edit', model:[congestionLevelInstance:congestionLevelInstance]
            }
        }
        else {
            flash.message = "CongestionLevel not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def congestionLevelInstance = new CongestionLevel()
        congestionLevelInstance.properties = params
        return ['congestionLevelInstance':congestionLevelInstance]
    }

    def save = {
        def congestionLevelInstance = new CongestionLevel(params)
        if(congestionLevelInstance.save(flush:true)) {
            flash.message = "CongestionLevel ${congestionLevelInstance.id} created"

            redirect action:"show", id:congestionLevelInstance.id
        }
        else {
            render view:'create', model:[congestionLevelInstance:congestionLevelInstance]
        }
    }
}
