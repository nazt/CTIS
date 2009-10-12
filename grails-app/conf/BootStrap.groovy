class BootStrap {

     def init = { servletContext ->
		new CongestionCause(reason:"Raining").save()
		new CongestionCause(reason:"Accident").save()
		new CongestionCause(reason:"Constructing").save()	
		new CongestionLevel(level:1,info:"Low").save()
		new CongestionLevel(level:2,info:"Moderate").save()
		new CongestionLevel(level:3,info:"High").save()
		new Role(description:"Admin Access",authority:"ROLE_ADMIN").save()
		new Role(description:"User Access",authority:"ROLE_USER").save()
		new Requestmap(url:"/secure/**",configAttribute:"ROLE_ADMIN").save()
     }
     def destroy = {
     }
} 