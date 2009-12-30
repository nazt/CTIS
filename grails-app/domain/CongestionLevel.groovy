class CongestionLevel {
	static hasMany = [congestion_level:Report]
	Integer level
	String info
	String colour
	String toString()
	{
		return "$info"
	}
    static constraints = {  
	level(unique:true,blank:false) 
	info(blank:true)   
	colour(nullable:true)
	 }
  
}
