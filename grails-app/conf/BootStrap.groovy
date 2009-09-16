class BootStrap {

     def init = { servletContext ->
		new CongestionCause(reason:"Raining").save()
		new CongestionCause(reason:"Accident").save()
		new CongestionCause(reason:"Constructing").save()	
		new Congestion(level:1,info:"Low").save()
		new Congestion(level:2,info:"Moderate").save()
		new Congestion(level:3,info:"High").save()
     }
     def destroy = {
     }
} 