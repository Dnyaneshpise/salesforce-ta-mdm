# MAXFIT Salesforce TA Activity

MAXFIT is a Salesforce Lightning app built as a TA activity project. The goal of the project is to show how a custom Salesforce app can manage an event workflow using custom objects, validation rules, permission sets, tabs, and a Lightning Web Component home screen.

The app is designed for a fitness/event scenario where organizers can create events, add locations, register attendees, assign speakers, and track event participation.

## What This Project Includes

- Custom Salesforce objects for Events, Attendees, Speakers, Locations, Event Organizers, Event Attendees, Event Speakers, and Error Logs.
- Validation rules for event data quality, including location requirements for in-person events.
- Permission sets for organizer, attendee, and speaker users.
- A custom Lightning app named `MAXFIT`.
- Custom tabs for the main objects.
- A Lightning Web Component called `maxfitHome` that gives users an interactive app home screen.
- Apex helper and test class for error logging.

## Main User Flow

An organizer can use the MAXFIT app to:

1. Create a Location.
2. Create an Event.
3. Add Attendee records.
4. Add Speaker records.
5. Register an Attendee for an Event.
6. Assign a Speaker to an Event.

The `MAXFIT Home` tab provides quick forms for these actions so users do not need to start from raw object tabs only.

## Important Note About Viewing the App

This is a Salesforce app, not a public static website. It runs inside a Salesforce org and requires Salesforce login access.

People cannot view the running app directly from GitHub. To try the app, they need one of the following:

- Access to a Salesforce org where this source has been deployed.
- A demo/test Salesforce user created by the project owner.
- Their own Salesforce Developer Org where they deploy this repository.

If sharing this project for review, include screenshots or a demo video in addition to the repository link.

## How To Deploy

Prerequisites:

- Salesforce CLI installed.
- A Salesforce Developer Org or Trailhead Playground.
- Authorized org connection using Salesforce CLI.

Authorize an org:

```bash
sf org login web --alias MyOrgAlias
```

Deploy the project:

```bash
sf project deploy start --source-dir force-app --target-org MyOrgAlias
```

Run the Apex test:

```bash
sf apex run test --tests ErrorLogHelperTest --target-org MyOrgAlias --result-format human
```

## How To Use The App After Deployment

1. Open the Salesforce org.
2. Assign a permission set to the user:
   - `Event_Organizer_Permission_Set` for organizer/admin users.
   - `Event_Attendee_Permission_Set` for attendee users.
   - `Speaker_Permission_Set` for speaker users.
3. Open the App Launcher.
4. Search for `MAXFIT`.
5. Open the `MAXFIT` app.
6. Use the `MAXFIT Home` tab to create and connect event records.

## Demo Access Guidance

For a portfolio or assignment submission, use this format:

```text
Live Salesforce App: Requires Salesforce login/demo user access.
GitHub Repository: <your repo link>
Demo Video/Screenshots: <your video or image links>
```

Salesforce internal apps are protected by login and permissions, so a public no-login URL is not available unless the project is extended with Salesforce Experience Cloud or a separate public frontend.

## Project Structure

```text
force-app/main/default/
  applications/      MAXFIT Lightning app metadata
  classes/           Apex helper and test class
  lwc/maxfitHome/    Interactive Lightning Web Component home screen
  objects/           Custom objects, fields, and validation rules
  permissionsets/    User access configuration
  tabs/              Custom tabs for app navigation
```

## Sample Data

During development, a sample workflow was created in the Salesforce org:

- Sample event: `MAXFIT Launch Workout`
- Event type: `In-Person`
- Status: `Published`
- Includes a sample location, organizer, attendee, speaker, attendee registration, and speaker assignment.

Sample data is stored in the target org, not in this repository.
