class CongestionCauseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [congestionCauseInstanceList: CongestionCause.list(params), congestionCauseInstanceTotal: CongestionCause.count()]
    }

    def create = {
        def congestionCauseInstance = new CongestionCause()
        congestionCauseInstance.properties = params
        return [congestionCauseInstance: congestionCauseInstance]
    }

    def save = {
        def congestionCauseInstance = new CongestionCause(params)
        if (congestionCauseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), congestionCauseInstance.id])}"
            redirect(action: "show", id: congestionCauseInstance.id)
        }
        else {
            render(view: "create", model: [congestionCauseInstance: congestionCauseInstance])
        }
    }

    def show = {
        def congestionCauseInstance = CongestionCause.get(params.id)
        if (!congestionCauseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
            redirect(action: "list")
        }
        else {
            [congestionCauseInstance: congestionCauseInstance]
        }
    }

    def edit = {
        def congestionCauseInstance = CongestionCause.get(params.id)
        if (!congestionCauseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [congestionCauseInstance: congestionCauseInstance]
        }
    }

    def update = {
        def congestionCauseInstance = CongestionCause.get(params.id)
        if (congestionCauseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (congestionCauseInstance.version > version) {
                    
                    congestionCauseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'congestionCause.label', default: 'CongestionCause')] as Object[], "Another user has updated this CongestionCause while you were editing")
                    render(view: "edit", model: [congestionCauseInstance: congestionCauseInstance])
                    return
                }
            }
            congestionCauseInstance.properties = params
            if (!congestionCauseInstance.hasErrors() && congestionCauseInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), congestionCauseInstance.id])}"
                redirect(action: "show", id: congestionCauseInstance.id)
            }
            else {
                render(view: "edit", model: [congestionCauseInstance: congestionCauseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def congestionCauseInstance = CongestionCause.get(params.id)
        if (congestionCauseInstance) {
            try {
                congestionCauseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'congestionCause.label', default: 'CongestionCause'), params.id])}"
            redirect(action: "list")
        }
    }
}
