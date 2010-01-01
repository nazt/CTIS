class ReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [reportInstanceList: Report.list(params), reportInstanceTotal: Report.count()]
    }

    def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return [reportInstance: reportInstance]
    }

    def save = {
        def reportInstance = new Report(params)
        if (reportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])}"
            redirect(action: "show", id: reportInstance.id)
        }
        else {
            render(view: "create", model: [reportInstance: reportInstance])
        }
    }

    def show = {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportInstance: reportInstance]
        }
    }

    def edit = {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportInstance: reportInstance]
        }
    }

    def update = {
        def reportInstance = Report.get(params.id)
        if (reportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportInstance.version > version) {
                    
                    reportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'report.label', default: 'Report')] as Object[], "Another user has updated this Report while you were editing")
                    render(view: "edit", model: [reportInstance: reportInstance])
                    return
                }
            }
            reportInstance.properties = params
            if (!reportInstance.hasErrors() && reportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])}"
                redirect(action: "show", id: reportInstance.id)
            }
            else {
                render(view: "edit", model: [reportInstance: reportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportInstance = Report.get(params.id)
        if (reportInstance) {
            try {
                reportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
    }
}
