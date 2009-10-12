class CongestionLevel {
	static hasMany = [congestion_level:Report]
	Integer level
	String info
	String toString()
	{
		return "$level - $info"
	}
    static constraints = {  
	level() 
	info()    }
  
}
