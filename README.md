# CrowdStrike-CRITs Connection Application - User Manual

## Table of Contents
1. Introduction
2. Getting Started
3. Directory Structure
4. Code Structure
5. Dependencies
6. Configuration
7. Running the Application
8. Reporting and Logging
9. Application Architecture
10. Extending the Application
11. Threat Modeling
12. Security Mechanisms

## 1. Introduction

### CRITS (Collaborative Research into Threats)
CRITs is a web-based tool that combines an analytic engine with a cyber threat database. It serves as a repository for attack data and malware and provides analysts with a powerful platform for conducting malware analyses, correlating malware, and targeting data. Analysts can save and exploit these analyses and correlations within CRITs.

### CrowdStrike (Falcon) Threat Intelligence
Cyber threat intelligence is the product of collecting, evaluating, and analyzing cyber threat information. It reduces uncertainty for the consumer and aids in identifying threats and opportunities. Analysts identify similarities and differences in vast quantities of information and detect deceptions to produce accurate, timely, and relevant intelligence.

### Integration (CrowdStrike-CRITs Connector & Updater)
The CrowdStrike Falcon API serves as the main source of cyber threat intelligence for CRITs. The integration involves a connecting application capable of periodically updating the CRITs database. The application translates CrowdStrike's intelligence formatting into a format usable by CRITs. It leverages several connections and is built to scale, extending its functionality for future purposes.

## 2. Getting Started

This program updates the CRITs MongoDB for newly added CrowdStrike intelligence indicators. Note: Internet connectivity is required.

## 3. Directory Structure

```
.
├── Documentation
│   ├── Application (CrowdStrike-CRITS Intel Connector & Updater).jpg
│   └── Intel APIs Documentation Support Falcon.pdf
├── _end.sh
├── Engine
│   ├── functions_for_vocabulary.py
│   ├── hudgo.py
│   ├── intel_base.py
│   ├── logger.py
│   ├── Paths.py
│   ├── process_config_data.py
│   ├── push_intelligence.py
│   ├── report_generator.py
│   ├── requirements.txt
│   ├── tune.py
│   ├── utils.py
│   └── vocabulary.py
├── LICENSE
├── README
├── Reports
│   ├── guide.txt
│   ├── program_log
│   └── report.report
├── _run.sh
├── settings.ini
└── _status.sh
```

3 directories, 23 files

## 4. Code Structure

- `helpers`: logger, settings, hudgo, process_config_data
- `corefiles`: vocabulary.py, vocab_input.py, tune.py, push_intelligence.py

## 5. Dependencies

Before running the application, navigate to the `Engine/` directory and run:

```sh
pip install -r requirements.txt
```

## 6. Configuration

To configure the program, navigate to the root directory and open `settings.ini`. The file should look like this:

```ini
[crowdstrike_API]
date = 0
api_key =
api_url = https://intelapi.crowdstrike.com
api_id =
perpage = 100

[crits]
crits_user = admin
crits_sourcename = crowdstride

[hudgoDB]
host =
port = 27017
database = crits
indicators_collection = indicators
actors_collection = actors
domains_collection = domains

[timer]
timer = 1
```

### Explanation

- `[crowdstrike_API]`: Contains settings for Falcon API.
- `[crits]`: Contains settings for CRITs.
- `[hudgoDB]`: Contains settings for CRITs database.
- `[timer]`: Interval at which the CRITs DB is populated.

Areas marked `X` should remain untouched, while areas marked `O` can undergo changes.

**IMPORTANT:** Create a source in CRITs and fill in the `[crits]` section along with the username.

## 7. Running the Application

To execute the application on Linux:

```sh
sh _run.sh   # or ./_run.sh to run the app
sh _status.sh # or ./_status.sh to check the status of the app
sh _end.sh   # or ./_end.sh to end the program
```

Ensure you are in the root directory to use these functions.

**Note:** After the last action, check the status again to confirm the shutdown.

For developers (advanced users):

```sh
python push_intelligence.py
```

To kill the process, use `kill -9 PID`. This should be used when debugging.

## 8. Reporting and Logging

Please see the `Reports` directory and review `guide.txt`.

## 9. Application Architecture

Refer to the image diagram in the `Documentation` directory:

- **Data Intake:** Acts as the main source of data input into the application from CrowdStrike, providing data to CRITs.
- **CrowdStrike-CRITs Vocabulary:** Enhances communication between CrowdStrike and CRITs, serving as the main source of understanding.
- **Mapper:** Utilizes the vocabulary to enact communication flow between the two entities.
- **Data Output:** Sole means of getting data into CRITs.

## 10. Extending the Application

### Process to Add More TLOs to the Application Source Code

1. Add a collection to `settings.ini`.
2. Add the linking parser to the parameter tab in `push_intelligence.py`.
3. Add the respective object schema from `tune` into the object schema section in `push_intelligence.py`.
4. Add an operation into the operations tab in `push_intelligence.py`.
5. In the operation, copy the sample code and replace `col*` and `doc*` in the insert & query functions respectively.
6. Modify the schema version accordingly.
7. Add the object relationship to the indicator schema in `tune`.
8. Ensure you have a schema for the object in `tune.py` as a function **tune_##()**.
9. Create a function in `functions_for_vocabulary` if data cleansing is needed for the schema.

## 11. Threat Modeling

### Threat Modeling the Application

Identify potential threats and vulnerabilities to secure the application:

- **Data Breaches:** Implement encryption for data in transit and at rest.
- **Unauthorized Access:** Enforce strict access controls and authentication mechanisms.
- **Injection Attacks:** Sanitize and validate all inputs.
- **Denial of Service (DoS):** Implement rate limiting and resource quotas.

## 12. Security Mechanisms

### Security Mechanisms to Secure the Application

- **User Authentication:** Ensure only authorized users can access the application.
- **Enhanced Logging:** Maintain detailed logs for monitoring and auditing.
- **File Encryption:** Encrypt files to protect sensitive data.
- **File Name Encoding:** Encode file names to prevent unauthorized access.
- **File Upload Limit:** Set limits on the size of files that can be uploaded.
- **File Type Restrictions:** Restrict the types of files that can be uploaded to prevent malicious files.
