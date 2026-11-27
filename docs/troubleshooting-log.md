# Troubleshooting log: hub-spoke-lab (test)

## Case 1
- Ticket: Add output `spoke_vnet_names`.
- Symptom: Reference to undeclared module.
- Stage: Validate.
- Cause: The output referred to `module.spokes`, but the module is named `spoke`.
- Fix: Reference `module.spoke`.
- Check: Validation passed and the plan proposed the output.

## Case 2
- Ticket: Pin the AzureRM provider to `~> 4.0`.
- Symptom: The locked 5.x provider did not match the constraint.
- Stage: Init.
- Cause: The requested constraint would downgrade the deployed provider.
- Fix: Reject the change and retain `~> 5.0`.
- Check: The existing provider configuration was restored.

## Case 3
- Ticket: Diagnose a plan failure in a new session.
- Symptom: The subscription ID was not recognised.
- Stage: Plan.
- Cause: The session used a random GUID as `ARM_SUBSCRIPTION_ID`.
- Fix: Set `ARM_SUBSCRIPTION_ID` to the current Azure CLI subscription.
- Check: The corrected subscription was accepted.

## Case 4
- Ticket: Investigate a state lock.
- Symptom: A concurrent plan could not acquire the lock.
- Stage: Plan.
- Cause: An apply was waiting for approval and held the lock.
- Fix: Let the owning operation finish instead of force-unlocking it.
- Check: A subsequent plan acquired the lock.

## Case 5
- Ticket: Add an NSG to the spoke 1 workload subnet.
- Symptom: The NSG data source could not find the NSG.
- Stage: Plan.
- Cause: The data source tried to read the NSG before Terraform created it.
- Fix: Reference the NSG resource directly in the subnet association.
- Check: An isolated test created the NSG and association, then planned with no changes.

## Case 6
- Ticket: Manage the spokes route table.
- Symptom: The route table already existed and Terraform required an import.
- Stage: Apply.
- Cause: The resource existed in Azure but not in Terraform state.
- Fix: Import the existing route table before managing it.
- Check: An isolated test imported the route table and planned with no changes.
