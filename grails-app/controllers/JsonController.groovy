import grails.converters.*
class JsonController {

    def index = {
	def jsonparsed=JSON.parse('http://tg.in.th/json.data'.toURL().text)
/*	render (jsonparsed."2113".distance)*/
	jsonparsed.road.each { k,v-> println k+"<br>\n" }
	println jsonparsed.road.keySet()
	[roadData:jsonparsed.road,roadKey:jsonparsed.road.keySet()]
	
	
	 }
}
