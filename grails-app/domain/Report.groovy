class Report {
	static belongsTo = [ congestion_level : CongestionLevel ,congestion_cause:CongestionCause]
	Double latitude
	Double longitude
	Double accuracy
	String message
 
	Date dateCreated
	Date lastUpdated	
    static constraints = {
		congestion_cause(blank:false)
		congestion_level(blnak:false)
		message()
		latitude(blank:false)
		longitude(blank:false)
		accuracy(blank:true)
    }
	
	String toString()
	{
		return "$id - $congestion_cause"
	}
}
