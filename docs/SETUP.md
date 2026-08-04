# HamZayn Setup Guide

## Prerequisites

- Node.js (v16 or higher)
- Salesforce CLI (v2.x)
- Git
- Active Salesforce org (Developer, Sandbox, or Production)

## Installation

### 1. Install Salesforce CLI

```bash
npm install --global @salesforce/cli
```

Verify installation:
```bash
sf version
```

### 2. Clone the Repository

```bash
git clone https://github.com/aneesa666666/HamZayn.git
cd HamZayn
```

### 3. Install Dependencies

```bash
npm install
```

## Configuration

### Create a Scratch Org

```bash
sf org create scratch --definition-file config/project-scratch-org-def.json --alias HamZayn-dev
```

### Authorize a Sandbox or Production Org

```bash
sf org login web --instance-url https://test.salesforce.com --alias HamZayn-sandbox
```

For production:
```bash
sf org login web --alias HamZayn-prod
```

## Deployment

### Push to Scratch Org

```bash
sf project push --target-org HamZayn-dev
```

### Deploy to Sandbox

```bash
sf project deploy start --target-org HamZayn-sandbox
```

### Deploy to Production

```bash
sf project deploy start --target-org HamZayn-prod --test-level RunSpecifiedTests
```

## Running Tests

### Run All Tests

```bash
sf apex run test --test-level RunAllTestsInOrg
```

### Run Specific Test Class

```bash
sf apex run test --class-name TestClassName
```

## Code Quality

### Run Linter

```bash
npm run lint
```

### Fix Linting Issues

```bash
npm run lint:fix
```

### Format Code with Prettier

```bash
npm run prettier
```

## Useful Commands

### List Authorized Orgs

```bash
sf org list
```

### Open Org

```bash
sf org open --target-org HamZayn-dev
```

### Retrieve Metadata from Org

```bash
sf project retrieve start --target-org HamZayn-dev
```

### Delete Scratch Org

```bash
sf org delete scratch --no-prompt --target-org HamZayn-dev
```

## Troubleshooting

### Issue: "INVALID_FIELD" error during push
**Solution**: Ensure custom fields are properly defined in your object metadata files.

### Issue: Insufficient access rights
**Solution**: Verify your user has appropriate permissions in the target org.

### Issue: Test failures
**Solution**: Run tests individually to identify which test is failing, then review the test logs.

## Resources

- [Salesforce CLI Documentation](https://developer.salesforce.com/tools/sfdxcli)
- [Salesforce Developer Guide](https://developer.salesforce.com/docs)
- [SFDX Project Structure](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_source_file_format.htm)
