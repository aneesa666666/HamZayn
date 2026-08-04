# HamZayn Development Guide

## Project Structure

```
HamZayn/
├── force-app/
│   ├── main/
│   │   └── default/
│   │       ├── classes/              # Apex classes
│   │       ├── triggers/             # Apex triggers
│   │       ├── lwc/                  # Lightning Web Components
│   │       ├── aura/                 # Aura components
│   │       ├── objects/              # Custom objects
│   │       ├── pages/                # Visualforce pages
│   │       ├── components/           # Visualforce components
│   │       ├── layouts/              # Page layouts
│   │       └── flows/                # Flow definitions
│   └── test/
│       └── default/
│           └── classes/              # Test classes
├── config/
│   └── project-scratch-org-def.json  # Scratch org definition
├── docs/                             # Documentation
├── sfdx-project.json                 # SFDX configuration
├── package.json                      # NPM configuration
└── README.md                         # Project README
```

## Naming Conventions

### Apex Classes
- **Service Classes**: `[Entity]Service.cls`
  - Example: `OpportunityService.cls`, `CaseService.cls`
- **Controller Classes**: `[Name]Controller.cls`
  - Example: `SalesController.cls`, `ServiceController.cls`
- **Utility Classes**: `[Name]Utility.cls`
  - Example: `ValidationUtility.cls`, `DateUtility.cls`
- **Test Classes**: `[ClassName]Test.cls`
  - Example: `OpportunityServiceTest.cls`

### Lightning Web Components (LWC)
- Folder name: `kebab-case`
- JavaScript file: `[folderName].js`
- HTML file: `[folderName].html`
- CSS file: `[folderName].css`
- Metadata file: `[folderName].js-meta.xml`

Example structure:
```
lwc/
└── sales-dashboard/
    ├── salesDashboard.js
    ├── salesDashboard.html
    ├── salesDashboard.css
    └── salesDashboard.js-meta.xml
```

### Objects and Fields
- Custom objects: `Api_Name__c` (for custom) or standard object names
- Custom fields: `field_name__c`

## Development Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/feature-name
```

### 2. Make Changes

Create or modify components in the `force-app` directory.

### 3. Push to Scratch Org

```bash
sf project push
```

### 4. Test Changes

```bash
sf apex run test --test-level RunLocalTests
```

### 5. Lint Code

```bash
npm run lint
```

### 6. Commit Changes

```bash
git add .
git commit -m "feat: Add feature description"
```

### 7. Push to Remote

```bash
git push origin feature/feature-name
```

### 8. Create Pull Request

Create a PR on GitHub for code review.

## Best Practices

### Apex Development
- Always separate business logic into service classes
- Use custom exceptions for error handling
- Write comprehensive unit tests (80%+ coverage)
- Use meaningful variable names
- Add comments for complex logic
- Avoid hardcoding IDs
- Use SOQL efficiently (avoid N+1 queries)

### LWC Development
- Keep components small and focused
- Use shadow DOM for encapsulation
- Properly handle lifecycle hooks
- Implement error handling
- Use descriptive naming for properties and methods
- Add JSDoc comments
- Test accessibility (WCAG 2.1 AA)

### Trigger Development
- Keep triggers minimal - delegate logic to handler classes
- Follow bulkification principles
- Use a single trigger per object
- Implement proper exception handling
- Write comprehensive unit tests

## Testing

All new features must include unit tests. Test coverage should be at least 80%.

### Writing Tests

```apex
@isTest
private class OpportunityServiceTest {
    @isTest
    static void testGetOpenOpportunities() {
        // Setup
        // Execute
        // Assert
    }
}
```

## Debugging

### Enable Debug Logging

```bash
sf apex log tail --target-org HamZayn-dev
```

### View Logs

```bash
sf apex get log --log-id <LOG_ID> --target-org HamZayn-dev
```

## Security

- Always use `with sharing` for Apex classes
- Validate user permissions before data access
- Sanitize user input
- Use formula-based validation where possible
- Review security best practices regularly

## Performance

- Optimize SOQL queries
- Use batch processing for large data sets
- Implement caching strategies
- Monitor governor limits
- Use asynchronous processing when appropriate
