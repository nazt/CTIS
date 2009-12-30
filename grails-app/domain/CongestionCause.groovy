class CongestionCause {
	static hasMany = [congestion_cause:Report]	
	String reason 
	String imageSrc="blank.png"
    static constraints = {
		reason(unique:true)
    }
	String toString()
	{
		return "$reason"
	}
}
