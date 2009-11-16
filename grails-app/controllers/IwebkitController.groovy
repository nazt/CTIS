class IwebkitController {

    def index = {  }
	def say = { }
    def list = {
       params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
render   Report.list( params )
        [ reportInstanceList: Report.list( params ), reportInstanceTotal: Report.count() ]
    }
	def view= {}
	def form = { render params }
	def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return ['reportInstance':reportInstance]
    }
	def mapview={        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
	        [ reportInstanceList: Report.list( params ), reportInstanceTotal: Report.count() ] }
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
