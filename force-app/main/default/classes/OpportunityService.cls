// Sample Apex Service Class
public with sharing class OpportunityService {
    /**
     * Retrieves all open opportunities
     * @return List of open opportunities
     */
    public static List<Opportunity> getOpenOpportunities() {
        return [
            SELECT Id, Name, StageName, Amount, CloseDate, AccountId
            FROM Opportunity
            WHERE IsClosed = false
            ORDER BY CloseDate ASC
        ];
    }

    /**
     * Retrieves opportunities by stage
     * @param stageName The opportunity stage name
     * @return List of opportunities at the specified stage
     */
    public static List<Opportunity> getOpportunitiesByStage(String stageName) {
        return [
            SELECT Id, Name, Amount, CloseDate, AccountId
            FROM Opportunity
            WHERE IsClosed = false AND StageName = :stageName
            ORDER BY CloseDate ASC
        ];
    }

    /**
     * Creates a new opportunity
     * @param opp The opportunity to create
     * @return The created opportunity ID
     */
    public static Id createOpportunity(Opportunity opp) {
        insert opp;
        return opp.Id;
    }

    /**
     * Updates an existing opportunity
     * @param opp The opportunity to update
     */
    public static void updateOpportunity(Opportunity opp) {
        update opp;
    }
}
