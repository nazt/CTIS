class Report {
	static belongsTo = [ congestion_level : CongestionLevel ,congestion_cause:CongestionCause]
	Double latitude
	Double longitude
	Double accuracy
	String message
 
	Date dateCreated
	Date lastUpdated	
    static constraints = {
		congestion_cause()
		congestion_level()
		message()
		latitude()
		longitude()
		accuracy()
    }
	
	String toString()
	{
		return "$id - $congestion_cause"
	}
}
