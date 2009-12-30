class CongestionCause {
	static hasMany = [congestion_cause:Report]	
	String reason
    static constraints = {
		reason(unique:true)
    }
	String toString()
	{
		return "$reason"
	}
}
