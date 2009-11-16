class IwebkitController {

    def index = {  }
	def say = { }
	def map = { }
	def view= {}
	def form = { render params }
	def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return ['reportInstance':reportInstance]
    }

    def save = {
        def reportInstance = new Report(params)
        if(reportInstance.save(flush:true)) {
            flash.message = "Report ${reportInstance.id} created"

            redirect action:"show", id:reportInstance.id
        }
        else {
            render view:'create', model:[reportInstance:reportInstance]
        }
    }
}
