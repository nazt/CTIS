class Report {
	static belongsTo = [ congestion_level : CongestionLevel ,congestion_cause:CongestionCause]
	Double latitude
	Double longitude
	String locationName
	
	Double accuracy
	String heading
	Double speed
	
	Date locationTimestamp	
	
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
		heading(blank:true,nullable:true)		
		speed(blank:true,nullable:true)
		locationTimestamp(blank:true,nullable:true)
		locationName(blank:true,nullable:true)
    }
	
	String toString()
	{
		return "$id - $congestion_cause"
	}
}
