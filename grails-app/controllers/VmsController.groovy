import grails.converters.*
class VmsController {

    def index = {  }
	def getVms={ 
			def jsonparsed
			def latitude=(params.latitude).toString()
			def longitude=(params.longitude).toString()
/*			println latitude + longitude*/
			jsonparsed=JSON.parse("http://traffy.in.th/natz/vmsLocation.php?lat=${params.latitude}&lon=${params.longitude}".toURL().text)
/*			render jsonparsed*/

/*			render jsonparsed.road.size() + " : " + jsonparsed.vms.size()*/
			if(jsonparsed.road.size()==0 || jsonparsed.vms.size()==0 || latitude=="null" || longitude=="null")
			{		 
				jsonparsed=JSON.parse("http://traffy.in.th/natz/vmsLocation.php?lon=100.56046&lat=13.73704".toURL().text)					
			}
/*			jsonparsed=JSON.parse("http://traffy.in.th/natz/vmsLocation.php?lon=100.5986111&lat=14.0677778".toURL().text)				*/
			def road=jsonparsed.road.sort{ (it.value.distance as Float)} 
			
	 		[roads:road,keySet:road.keySet()]	
		
		
		 }
	def detail = {
			def vms=JSON.parse("http://traffy.in.th/natz/vmsFromLinkID.php?link=${params.id}".toURL().text)

/*			def vms=jsonparsed.vms*/
			def vmsData=[]		
			/*
			println vms
*//*			vms.each { vmsData<< it}
			println vmsData*/
			vms.each {  it.each{ vmsData << it } }
/*			println it*/
/*			render 'd'*/
/*			vms.each {println it.url}*/
	
		[vmsData:vmsData]
		
	}
}
