class CongestionLevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [congestionLevelInstanceList: CongestionLevel.list(params), congestionLevelInstanceTotal: CongestionLevel.count()]
    }

    def create = {
        def congestionLevelInstance = new CongestionLevel()
        congestionLevelInstance.properties = params
        return [congestionLevelInstance: congestionLevelInstance]
    }

    def save = {
        def congestionLevelInstance = new CongestionLevel(params)
        if (congestionLevelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), congestionLevelInstance.id])}"
            redirect(action: "show", id: congestionLevelInstance.id)
        }
        else {
            render(view: "create", model: [congestionLevelInstance: congestionLevelInstance])
        }
    }

    def show = {
        def congestionLevelInstance = CongestionLevel.get(params.id)
        if (!congestionLevelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [congestionLevelInstance: congestionLevelInstance]
        }
    }

    def edit = {
        def congestionLevelInstance = CongestionLevel.get(params.id)
        if (!congestionLevelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [congestionLevelInstance: congestionLevelInstance]
        }
    }

    def update = {
        def congestionLevelInstance = CongestionLevel.get(params.id)
        if (congestionLevelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (congestionLevelInstance.version > version) {
                    
                    congestionLevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'congestionLevel.label', default: 'CongestionLevel')] as Object[], "Another user has updated this CongestionLevel while you were editing")
                    render(view: "edit", model: [congestionLevelInstance: congestionLevelInstance])
                    return
                }
            }
            congestionLevelInstance.properties = params
            if (!congestionLevelInstance.hasErrors() && congestionLevelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), congestionLevelInstance.id])}"
                redirect(action: "show", id: congestionLevelInstance.id)
            }
            else {
                render(view: "edit", model: [congestionLevelInstance: congestionLevelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def congestionLevelInstance = CongestionLevel.get(params.id)
        if (congestionLevelInstance) {
            try {
                congestionLevelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionLevel.label', default: 'CongestionLevel'), params.id])}"
            redirect(action: "list")
        }
    }
}
