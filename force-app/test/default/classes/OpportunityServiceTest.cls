/**
 * Test class for OpportunityService
 */
@isTest
private class OpportunityServiceTest {
    @isTest
    static void testGetOpenOpportunities() {
        // Setup test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = testAccount.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30)
        );
        insert testOpp;

        // Execute
        Test.startTest();
        List<Opportunity> results = OpportunityService.getOpenOpportunities();
        Test.stopTest();

        // Assert
        System.assertEquals(1, results.size(), 'Should return one opportunity');
        System.assertEquals('Test Opportunity', results[0].Name, 'Opportunity name should match');
    }

    @isTest
    static void testCreateOpportunity() {
        // Setup
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Opportunity newOpp = new Opportunity(
            Name = 'New Opportunity',
            AccountId = testAccount.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30)
        );

        // Execute
        Test.startTest();
        Id oppId = OpportunityService.createOpportunity(newOpp);
        Test.stopTest();

        // Assert
        System.assertNotEquals(null, oppId, 'Opportunity ID should not be null');
        Opportunity insertedOpp = [
            SELECT Id, Name
            FROM Opportunity
            WHERE Id = :oppId
        ];
        System.assertEquals('New Opportunity', insertedOpp.Name, 'Opportunity should be created');
    }
}
