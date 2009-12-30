class BootStrap {

     def init = { servletContext ->
		new CongestionCause(reason:"อุบัติเหตุ").save()
		new CongestionCause(reason:"ฝนตก").save()
		new CongestionCause(reason:"ก่อสร้าง").save()	
		new CongestionLevel(level:1,info:"คล่องตัว").save()
		new CongestionLevel(level:2,info:"หนาแน่น").save()
		new CongestionLevel(level:3,info:"ติดขัด").save()
		new Role(description:"Admin Access",authority:"ROLE_ADMIN").save()
		new Role(description:"User Access",authority:"ROLE_USER").save()
		new Requestmap(url:"/secure/**",configAttribute:"ROLE_ADMIN").save()
     }
     def destroy = {
     }
} 