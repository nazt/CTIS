import grails.converters.*;
class IwebkitController {

    def index = {  }
	def say = { }
    def list = {
       params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
render   Report.list( params )
        [ reportInstanceList: Report.list( params ), reportInstanceTotal: Report.count() ]
    }
	def map={}
	def view= {}
	def about = { }
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
	def form = { render params }
	def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return ['reportInstance':reportInstance]
    }
	def mapview={
		params.max = Math.min( params.max ? params.max.toInteger() : 5,  10)
	        [ reportInstanceList: Report.list(sort:"dateCreated", order:"desc"),congestionCauseInstanceList: CongestionCause.list(), reportInstanceTotal: Report.count() ] 
	}
	def report={
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportInstance: reportInstance]
        }
	}	
	def listview={
        params.max = Math.min( params.max ? params.max.toInteger() : 100,  100)
		params.sort="createdDate"
		params.order="desc"
        [ reportInstanceList: Report.list(sort:"dateCreated", order:"desc"), reportInstanceTotal: Report.count() ]		
	}
	def twitterlist={
			def url = new URL("http://twitter.com/statuses/user_timeline.json?screen_name=ctis_tu")
			def response = JSON.parse(url.newReader()) // response is an instance of JSONObject (see Grails API docs)
			response.text.each {  println it   }
/*			println response	*/
			[ reportInstanceList:response]		
		
	}
}
