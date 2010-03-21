import grails.converters.*;
import winterwell.jtwitter.*
class TwitterController {

    def list = { 
		def twitter=[]
		def rssurl = "http://twitter.com/statuses/user_timeline.xml?screen_name=ctis_tu"
		def slurp = new XmlSlurper()
		def rssObj = slurp.parse(rssurl)
		rssObj.status.eachWithIndex { item , num ->	
		 def name =  item.user.screen_name.toString()
		// def url = item.user.profile_image_url.toString()
/*		    render( item.text.toString()+"<br>" ) */
			def tmp=["id":item.id,"text":item.text.toString()]
			println tmp
			twitter<<tmp

		}
		[reportInstanceList:twitter]
	}
	def post = {
		// Make a Twitter object
		Twitter twitter = new Twitter("devtraffy","improvemyself");

		// Set my status
		twitter.setStatus("Messing about in Java");

			render 'oooo'
	}
}
