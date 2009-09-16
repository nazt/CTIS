class Report {
	static belongsTo = [ congestion_level : Congestion ,congestion_cause:CongestionCause]
	Double latitude
	Double longitude
	Double accuracy
	String message
 
	Date dateCreated
	Date lastUpdated	
    static constraints = {
    }
	
	String toString()
	{
		return "$id - $congestion_cause"
	}
}
