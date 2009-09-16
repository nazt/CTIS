class CongestionCause {
	static hasMany = [congestion_cause:Report]	
	String reason
    static constraints = {
    }
	String toString()
	{
		return "$reason"
	}
}
