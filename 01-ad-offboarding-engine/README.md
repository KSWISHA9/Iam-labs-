# Enterprise Identity Offboarding Automation Engine

## Overview
This project simulates an enterprise identity offboarding workflow using Active Directory and PowerShell automation.

The goal is to ensure terminated users are immediately disabled, removed from access groups, and isolated into a termination OU.

## Problem
Manual offboarding processes often result in:

- accounts remaining active after termination
- lingering group-based access
- inconsistent administrative execution
- lack of audit evidence

## Solution
A PowerShell automation workflow performs the following:

1. Identify user targeted for termination
2. Disable the account
3. Remove all group memberships
4. Move account to Terminated OU
5. Log actions for auditing

## Evidence
See docs/evidence.md
