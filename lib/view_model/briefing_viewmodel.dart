import '../model/briefing_model.dart';
import '../model/level_model.dart';
import '../model/question_model.dart';

class CoursesViewModel {

  final List<CourseModel> courses = [

    CourseModel(
      id: 1,
      title: "Phishing Awareness",
      subtitle: "Learn how phishing attacks work, identify fake emails, and protect sensitive information.",
      scenario: '''
Late Tuesday evening, the Security Operations Center (SOC) at Apex Financial Services detected an unusual spike in employee login failures. Shortly afterward, several employees reported receiving an urgent email from the company's Chief Financial Officer requesting immediate verification of their corporate accounts through an external audit portal.

At first glance, the email appeared completely legitimate. It used the company's branding, included official signatures, and even copied the formatting of previous internal announcements. However, investigators soon discovered that the email originated from a malicious domain, and the linked website was a convincing clone of the organization's login page.

Several employees unknowingly entered their usernames and passwords, giving attackers unauthorized access to sensitive financial systems. If the breach is not contained quickly, confidential customer information and internal documents could be exposed.

As a Cyber Security Investigator, your mission is to analyze the attack, identify every phishing indicator, stop the compromise, and recommend security measures to prevent similar attacks in the future.
''',
      tags: [
        "#PHISHING",
        "#SOCIAL_ENGINEERING",
        "#EMAIL_SECURITY",
        "BEGINNER",
      ],
      levels: [

        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: The Shadow Link",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which of these URL attributes is a classic sign of a phishing link?",
              options: [
                "Mismatched Domain",
                "HTTPS used",
                "Short URL",
                "Valid Certificate",
              ],
              correctAnswerIndex: 0,
              hint:
              "Compare the displayed URL with the actual destination domain.",
            ),

            QuestionModel(
              question:
              "Which email characteristic most commonly indicates phishing?",
              options: [
                "Urgent request for credentials",
                "Company logo",
                "Employee signature",
                "Grammar is perfect",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers often create urgency to pressure victims into acting quickly.",
            ),
          ],
        ),
        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: The Fake Portal",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "What is the first thing you should verify before entering your credentials?",
              options: [
                "Website URL",
                "Background color",
                "Page animation",
                "Logo size",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers often create websites with URLs similar to legitimate ones.",
            ),
            QuestionModel(
              question:
              "Which security feature confirms a website's identity?",
              options: [
                "Valid HTTPS Certificate",
                "Dark Theme",
                "Large Login Button",
                "Fast Loading Speed",
              ],
              correctAnswerIndex: 0,
              hint:
              "Click the padlock icon in the browser to inspect the certificate.",
            ),
          ],
        ),LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Following the Trail",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides the best evidence for tracing phishing emails?",
              options: [
                "Email Gateway Logs",
                "Printer Logs",
                "Bluetooth Logs",
                "Keyboard Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Think about which system handles incoming and outgoing emails.",
            ),
            QuestionModel(
              question:
              "Which attack technique relies on manipulating human behavior?",
              options: [
                "Social Engineering",
                "SQL Injection",
                "Cross-Site Scripting",
                "Buffer Overflow",
              ],
              correctAnswerIndex: 0,
              hint:
              "This attack exploits trust rather than software vulnerabilities.",
            ),
          ],
        ),LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After credentials are stolen, what should be done first?",
              options: [
                "Force Password Reset",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent attackers from continuing to use compromised accounts.",
            ),
            QuestionModel(
              question:
              "Which security control provides an additional login layer?",
              options: [
                "Multi-Factor Authentication",
                "Dark Mode",
                "Firewall Theme",
                "Incognito Mode",
              ],
              correctAnswerIndex: 0,
              hint:
              "It requires something more than just a password.",
            ),
          ],
        ),LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the phishing attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future phishing attacks?",
              options: [
                "Security Awareness Training",
                "Sharing Passwords",
                "Disabling Spam Filters",
                "Ignoring Unknown Emails",
              ],
              correctAnswerIndex: 0,
              hint:
              "Educated users are the strongest defense against phishing.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 2,
      title: "SQL Injection Defense",
      subtitle: "Understand how attackers exploit databases and how to secure queries.",
      scenario: ''' 
A retail company’s online store suddenly shows strange entries in its product catalog. Investigators discover attackers injected malicious SQL 
commands into the login form, retrieving customer data and altering records. 
At first glance, the login page looked normal, but attackers exploited weak input validation to manipulate queries. Several customer records 
were exposed, and attackers gained administrative privileges in the database. 
As a Cyber Security Investigator, your mission is to analyze the injection, identify weak points, stop the compromise, and recommend secure 
coding practices to prevent similar attacks in the future. 
''',
      tags: [
        "#SQL_INJECTION",
        "#DATABASE_SECURITY",
        "#WEB_APP",
        "INTERMEDIATE",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Suspicious Query",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which coding practice prevents SQL injection?",
              options: [
                "Parameterized Queries",
                "String Concatenation",
                "Dynamic SQL",
                "Plain Text Input",
              ],
              correctAnswerIndex: 0,
              hint:
              "Use placeholders instead of directly inserting user input.",
            ),
            QuestionModel(
              question:
              "Which attack method allows attackers to bypass login forms?",
              options: [
                "SQL Injection",
                "Phishing",
                "Cross-Site Scripting",
                "Buffer Overflow",
              ],
              correctAnswerIndex: 0,
              hint:
              "Think about database manipulation through crafted inputs.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Securing Queries",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which database feature helps limit damage from SQL injection?",
              options: [
                "Least Privilege Access",
                "Unlimited Permissions",
                "Open Ports",
                "Weak Passwords",
              ],
              correctAnswerIndex: 0,
              hint:
              "Restrict database accounts to only necessary actions.",
            ),
            QuestionModel(
              question:
              "What should developers avoid when handling user input?",
              options: [
                "Direct String Concatenation",
                "Input Validation",
                "Escaping Special Characters",
                "Prepared Statements",
              ],
              correctAnswerIndex: 0,
              hint:
              "Concatenating user input directly into queries is dangerous.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Exploits",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of SQL injection attempts?",
              options: [
                "Database Error Logs",
                "Printer Logs",
                "Bluetooth Logs",
                "Clipboard Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Look for unusual query errors or failed executions.",
            ),
            QuestionModel(
              question:
              "Which input pattern is a common sign of SQL injection?",
              options: [
                "' OR '1'='1",
                "Normal Username",
                "Valid Email",
                "Strong Password",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers often use logic-based injections to bypass authentication.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting SQL injection, what should be done first?",
              options: [
                "Block Malicious IPs",
                "Restart the Database",
                "Delete All Records",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent attackers from continuing to exploit vulnerabilities.",
            ),
            QuestionModel(
              question:
              "Which security control helps detect abnormal queries?",
              options: [
                "Web Application Firewall (WAF)",
                "Dark Mode",
                "Incognito Mode",
                "Large Login Button",
              ],
              correctAnswerIndex: 0,
              hint:
              "It filters and monitors HTTP requests to block malicious inputs.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the SQL injection attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Database",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future SQL injection attacks?",
              options: [
                "Secure Coding Training",
                "Sharing Database Passwords",
                "Disabling Firewalls",
                "Ignoring Error Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Educated developers are the strongest defense against injection.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 3,
      title: "Password Security",
      subtitle: "Learn best practices for creating and managing strong passwords.",
      scenario: ''' 
Employees at TechNova reused weak passwords across multiple systems. Attackers cracked them using brute force 
and dictionary attacks, gaining unauthorized access. 
At first glance, the accounts seemed secure, but weak and reused passwords allowed attackers to escalate 
privileges and compromise sensitive data. 
As a Cyber Security Investigator, your mission is to enforce strong password policies, detect compromised accounts, 
and recommend authentication improvements. 
''',
      tags: [
        "#PASSWORDS",
        "#AUTHENTICATION",
        "#SECURITY_POLICY",
        "BEGINNER",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Weak Passwords",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which password is most secure?",
              options: [
                "P@ssw0rd123!",
                "123456",
                "CompanyName2020",
                "qwerty",
              ],
              correctAnswerIndex: 0,
              hint:
              "Strong passwords mix letters, numbers, and symbols.",
            ),
            QuestionModel(
              question:
              "Which attack tries all possible combinations?",
              options: [
                "Brute Force Attack",
                "Phishing",
                "SQL Injection",
                "Man-in-the-Middle",
              ],
              correctAnswerIndex: 0,
              hint:
              "This attack systematically guesses every possible password.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Authentication Layers",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which method adds extra security beyond passwords?",
              options: [
                "Multi-Factor Authentication",
                "Password Reuse",
                "Default Credentials",
                "Simple PINs",
              ],
              correctAnswerIndex: 0,
              hint:
              "It requires something you know plus something you have.",
            ),
            QuestionModel(
              question:
              "What is the best practice for password storage?",
              options: [
                "Hashing with Salt",
                "Plain Text Storage",
                "Excel Spreadsheet",
                "Email Archive",
              ],
              correctAnswerIndex: 0,
              hint:
              "Passwords should never be stored in plain text.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Compromise",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of password attacks?",
              options: [
                "Authentication Logs",
                "Printer Logs",
                "Bluetooth Logs",
                "Clipboard Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Look for repeated failed login attempts.",
            ),
            QuestionModel(
              question:
              "Which password habit increases risk?",
              options: [
                "Reusing the same password",
                "Using unique passwords",
                "Enabling MFA",
                "Changing passwords regularly",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers exploit reused passwords across multiple accounts.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting compromised passwords, what should be done first?",
              options: [
                "Force Password Reset",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent attackers from continuing to use compromised accounts.",
            ),
            QuestionModel(
              question:
              "Which tool helps securely manage multiple passwords?",
              options: [
                "Password Manager",
                "Sticky Notes",
                "Email Drafts",
                "Text File",
              ],
              correctAnswerIndex: 0,
              hint:
              "It stores and encrypts passwords for safe use.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the password breach, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future password attacks?",
              options: [
                "Security Awareness Training",
                "Sharing Passwords",
                "Disabling MFA",
                "Ignoring Unknown Emails",
              ],
              correctAnswerIndex: 0,
              hint:
              "Educated users are the strongest defense against weak passwords.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 4,
      title: "Network Security Basics",
      subtitle: "Explore firewalls, IDS/IPS, and secure network design.",
      scenario: ''' 
A university network experiences repeated unauthorized access attempts. Logs show traffic bypassing basic firewall 
rules. Attackers exploited weak configurations to scan internal systems and attempt credential theft. 
At first glance, the network seemed protected, but misconfigured firewalls and lack of monitoring allowed attackers 
to probe deeper into sensitive areas. 
As a Cyber Security Investigator, your mission is to strengthen perimeter defenses, detect suspicious activity, and 
recommend secure network practices. 
''',
      tags: [
        "#NETWORK_SECURITY",
        "#FIREWALL",
        "#IDS",
        "BEGINNER",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Firewall Gaps",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which device filters incoming and outgoing traffic?",
              options: [
                "Firewall",
                "Printer",
                "Router",
                "Keyboard",
              ],
              correctAnswerIndex: 0,
              hint:
              "It enforces rules for network communication.",
            ),
            QuestionModel(
              question:
              "Which traffic should be blocked by default?",
              options: [
                "Untrusted External Traffic",
                "Internal Communication",
                "Authorized VPN",
                "Secure HTTPS",
              ],
              correctAnswerIndex: 0,
              hint:
              "Block unknown sources unless explicitly allowed.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Intrusion Detection",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which system monitors suspicious activity?",
              options: [
                "Intrusion Detection System (IDS)",
                "Word Processor",
                "Spreadsheet",
                "File Explorer",
              ],
              correctAnswerIndex: 0,
              hint:
              "It alerts administrators about unusual traffic patterns.",
            ),
            QuestionModel(
              question:
              "Which protocol should be used for secure web traffic?",
              options: [
                "HTTPS",
                "HTTP",
                "FTP",
                "Telnet",
              ],
              correctAnswerIndex: 0,
              hint:
              "Look for the padlock icon in the browser.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Attacks",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of unauthorized network access?",
              options: [
                "Firewall Logs",
                "Printer Logs",
                "Bluetooth Logs",
                "Clipboard Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Check logs that record blocked or suspicious traffic.",
            ),
            QuestionModel(
              question:
              "Which attack floods a network with traffic?",
              options: [
                "Denial of Service (DoS)",
                "SQL Injection",
                "Phishing",
                "Buffer Overflow",
              ],
              correctAnswerIndex: 0,
              hint:
              "It overwhelms systems by sending massive requests.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting a DoS attack, what should be done first?",
              options: [
                "Block Malicious IPs",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent attackers from continuing to flood the network.",
            ),
            QuestionModel(
              question:
              "Which security control helps prevent unauthorized access?",
              options: [
                "Firewall Rules",
                "Dark Mode",
                "Incognito Mode",
                "Large Login Button",
              ],
              correctAnswerIndex: 0,
              hint:
              "Properly configured rules restrict unwanted traffic.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the network attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future network attacks?",
              options: [
                "Regular Security Audits",
                "Sharing Passwords",
                "Disabling Firewalls",
                "Ignoring Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Continuous monitoring and audits strengthen defenses.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 5,
      title: "Malware Analysis",
      subtitle: "Identify, analyze, and mitigate malware infections.",
      scenario: ''' 
A suspicious email attachment spread ransomware across the finance department. Files were encrypted, and 
attackers demanded payment in cryptocurrency. The malware disguised itself as a legitimate invoice and quickly 
propagated through shared drives. 
At first glance, the file looked harmless, but once opened, it executed malicious code that locked critical financial 
documents. If not contained quickly, the organization risks losing access to sensitive customer and internal records. 
As a Cyber Security Investigator, your mission is to trace the malware, isolate infected systems, and recommend 
recovery steps to prevent similar attacks in the future. 
''',
      tags: [
        "#MALWARE",
        "#RANSOMWARE",
        "#THREAT_ANALYSIS",
        "ADVANCED",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Suspicious File",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which file type is commonly used to spread malware?",
              options: [
                ".exe",
                ".jpg",
                ".mp3",
                ".txt",
              ],
              correctAnswerIndex: 0,
              hint:
              "Executable files can run malicious code when opened.",
            ),
            QuestionModel(
              question:
              "Which malware type encrypts files and demands payment?",
              options: [
                "Ransomware",
                "Adware",
                "Spyware",
                "Trojan",
              ],
              correctAnswerIndex: 0,
              hint:
              "It locks files until a ransom is paid.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Infection Signs",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which symptom indicates a ransomware infection?",
              options: [
                "Files renamed with strange extensions",
                "Faster internet speed",
                "Improved system performance",
                "New wallpapers",
              ],
              correctAnswerIndex: 0,
              hint:
              "Encrypted files often get unusual extensions.",
            ),
            QuestionModel(
              question:
              "Which log helps detect malware execution?",
              options: [
                "System Event Logs",
                "Printer Logs",
                "Bluetooth Logs",
                "Clipboard Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Check logs for unusual process activity.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Tracing the Source",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which email characteristic often indicates malware?",
              options: [
                "Unexpected attachments",
                "Company logo",
                "Perfect grammar",
                "Internal sender",
              ],
              correctAnswerIndex: 0,
              hint:
              "Malware often arrives via suspicious attachments.",
            ),
            QuestionModel(
              question:
              "Which malware spreads by disguising itself as legitimate software?",
              options: [
                "Trojan",
                "Worm",
                "Spyware",
                "Adware",
              ],
              correctAnswerIndex: 0,
              hint:
              "Named after the Trojan horse trick.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting ransomware, what should be done first?",
              options: [
                "Isolate Infected Systems",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent malware from spreading to other devices.",
            ),
            QuestionModel(
              question:
              "Which backup strategy helps recover encrypted files?",
              options: [
                "Regular Offline Backups",
                "Saving files in Downloads",
                "Using Cloud without security",
                "Keeping files on Desktop",
              ],
              correctAnswerIndex: 0,
              hint:
              "Backups stored offline are safe from ransomware.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the malware attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future malware infections?",
              options: [
                "Regular Security Updates",
                "Sharing USB drives",
                "Disabling Antivirus",
                "Ignoring Suspicious Emails",
              ],
              correctAnswerIndex: 0,
              hint:
              "Keeping systems patched prevents malware exploits.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 6,
      title: "Operating System Security",
      subtitle: "Learn how OS vulnerabilities are exploited and patched.",
      scenario: ''' 
Attackers exploited an unpatched kernel vulnerability to escalate privileges on company servers. Once inside, they gained administrative rights 
and installed backdoors, allowing persistent access to sensitive systems. 
At first glance, the servers appeared stable, but outdated patches and weak configurations left them exposed. If not contained quickly, attackers 
could compromise critical applications and confidential data. 
As a Cyber Security Investigator, your mission is to analyze the exploit, enforce patch management, and recommend OS hardening practices to 
prevent similar attacks in the future. 
''',
      tags: [
        "#OS_SECURITY",
        "#PATCHING",
        "#PRIVILEGE_ESCALATION",
        "INTERMEDIATE",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Vulnerable Kernel",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which OS vulnerability allows attackers to gain admin rights?",
              options: [
                "Privilege Escalation",
                "Phishing",
                "SQL Injection",
                "Cross-Site Scripting",
              ],
              correctAnswerIndex: 0,
              hint:
              "It occurs when attackers exploit flaws to elevate permissions.",
            ),
            QuestionModel(
              question:
              "Which practice prevents privilege escalation?",
              options: [
                "Regular Patch Updates",
                "Ignoring Updates",
                "Weak Passwords",
                "Open Ports",
              ],
              correctAnswerIndex: 0,
              hint:
              "Keeping systems updated closes known vulnerabilities.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Patch Management",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which system process records OS updates?",
              options: [
                "Update Logs",
                "Printer Logs",
                "Clipboard Logs",
                "Bluetooth Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Check logs that track applied patches.",
            ),
            QuestionModel(
              question:
              "Which tool automates OS patching?",
              options: [
                "Windows Update",
                "Notepad",
                "Calculator",
                "Paint",
              ],
              correctAnswerIndex: 0,
              hint:
              "It regularly installs security updates automatically.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Exploits",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of privilege escalation attempts?",
              options: [
                "System Security Logs",
                "Printer Logs",
                "Clipboard Logs",
                "Bluetooth Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Look for unusual admin access attempts.",
            ),
            QuestionModel(
              question:
              "Which malware type often exploits OS vulnerabilities?",
              options: [
                "Rootkit",
                "Adware",
                "Spyware",
                "Trojan",
              ],
              correctAnswerIndex: 0,
              hint:
              "It hides deep inside the OS to maintain control.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting OS exploitation, what should be done first?",
              options: [
                "Apply Security Patches",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Close the exploited vulnerability immediately.",
            ),
            QuestionModel(
              question:
              "Which OS feature helps isolate applications?",
              options: [
                "Sandboxing",
                "Dark Mode",
                "Incognito Mode",
                "Large Login Button",
              ],
              correctAnswerIndex: 0,
              hint:
              "It runs apps in restricted environments to limit damage.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the OS attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future OS attacks?",
              options: [
                "Regular Patch Management",
                "Sharing Admin Accounts",
                "Disabling Antivirus",
                "Ignoring Security Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Consistent patching and monitoring strengthen OS security.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 7,
      title: "Cryptography Essentials",
      subtitle: "Understand encryption, hashing, and secure communication.",
      scenario: ''' 
Sensitive emails were intercepted because employees used plain text communication instead of encryption. Attackers read confidential 
information and altered messages during transmission. 
At first glance, the emails looked normal, but without encryption, they were vulnerable to interception. If not secured, attackers could continue 
to eavesdrop and manipulate communications. 
As a Cyber Security Investigator, your mission is to implement cryptographic solutions, secure data in transit, and recommend practices to 
prevent similar breaches in the future. 
''',
      tags: [
        "#CRYPTOGRAPHY",
        "#ENCRYPTION",
        "#HASHING",
        "INTERMEDIATE",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Plain Text Risk",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which method secures data during transmission?",
              options: [
                "Encryption",
                "Plain Text",
                "Copy-Paste",
                "Compression",
              ],
              correctAnswerIndex: 0,
              hint:
              "It converts readable data into unreadable form.",
            ),
            QuestionModel(
              question:
              "Which protocol ensures secure web communication?",
              options: [
                "HTTPS",
                "HTTP",
                "FTP",
                "Telnet",
              ],
              correctAnswerIndex: 0,
              hint:
              "Look for the padlock icon in the browser.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Hashing Basics",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which cryptographic function verifies data integrity?",
              options: [
                "Hashing",
                "Encryption",
                "Compression",
                "Encoding",
              ],
              correctAnswerIndex: 0,
              hint:
              "It produces a fixed-length output from input data.",
            ),
            QuestionModel(
              question:
              "Which hashing algorithm is widely used for passwords?",
              options: [
                "SHA-256",
                "JPEG",
                "MP3",
                "ZIP",
              ],
              correctAnswerIndex: 0,
              hint:
              "It’s a secure hashing standard used globally.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Weaknesses",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of failed encryption attempts?",
              options: [
                "System Security Logs",
                "Printer Logs",
                "Clipboard Logs",
                "Bluetooth Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Check logs for encryption errors or failures.",
            ),
            QuestionModel(
              question:
              "Which practice weakens cryptographic security?",
              options: [
                "Using outdated algorithms",
                "Using strong keys",
                "Applying salting",
                "Regular updates",
              ],
              correctAnswerIndex: 0,
              hint:
              "Old algorithms are vulnerable to modern attacks.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting intercepted communication, what should be done first?",
              options: [
                "Enable End-to-End Encryption",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Ensure only sender and receiver can read the data.",
            ),
            QuestionModel(
              question:
              "Which cryptographic method ensures authenticity?",
              options: [
                "Digital Signatures",
                "Plain Text",
                "Incognito Mode",
                "Dark Theme",
              ],
              correctAnswerIndex: 0,
              hint:
              "It verifies the sender’s identity and message integrity.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the cryptographic breach, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future cryptographic attacks?",
              options: [
                "Regular Algorithm Updates",
                "Sharing Keys",
                "Disabling Encryption",
                "Ignoring Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Keeping cryptographic methods updated strengthens security.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 8,
      title: "Data Structures: Arrays & Linked Lists",
      subtitle: "Understand how arrays and linked lists store and manage data.",
      scenario: ''' 
A software development team at CodeWorks is building a student record system. Initially, they used arrays to store student IDs, but as the 
system grew, they faced challenges with dynamic memory allocation and insertion operations. Later, they switched to linked lists, which solved 
some problems but introduced new complexities in traversal and memory usage. 
At first glance, both structures seemed efficient, but each had trade-offs depending on the operation. If not chosen wisely, performance issues 
could affect the entire system. 
As a Computer Science Investigator, your mission is to analyze the strengths and weaknesses of arrays and linked lists, identify the right use 
cases, and recommend efficient data structure practices. 
''',
      tags: [
        "#DATA_STRUCTURES",
        "#ARRAYS",
        "#LINKED_LISTS",
        "BEGINNER",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: Static vs Dynamic",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which characteristic defines arrays?",
              options: [
                "Fixed Size",
                "Dynamic Growth",
                "Self-Referencing Nodes",
                "Automatic Garbage Collection",
              ],
              correctAnswerIndex: 0,
              hint:
              "Arrays are allocated with a fixed size in memory.",
            ),
            QuestionModel(
              question:
              "Which structure allows dynamic memory allocation?",
              options: [
                "Linked List",
                "Array",
                "Stack",
                "Queue",
              ],
              correctAnswerIndex: 0,
              hint:
              "Nodes can be added or removed without resizing.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Insertion Operations",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which data structure requires shifting elements during insertion?",
              options: [
                "Array",
                "Linked List",
                "Stack",
                "Tree",
              ],
              correctAnswerIndex: 0,
              hint:
              "Think about contiguous memory blocks.",
            ),
            QuestionModel(
              question:
              "Which structure uses pointers to connect elements?",
              options: [
                "Linked List",
                "Array",
                "Matrix",
                "Graph",
              ],
              correctAnswerIndex: 0,
              hint:
              "Each node points to the next node.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Traversal Challenges",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which operation is faster in arrays compared to linked lists?",
              options: [
                "Random Access",
                "Insertion",
                "Deletion",
                "Pointer Updates",
              ],
              correctAnswerIndex: 0,
              hint:
              "Arrays allow direct indexing using positions.",
            ),
            QuestionModel(
              question:
              "Which traversal requires visiting nodes sequentially?",
              options: [
                "Linked List",
                "Array",
                "Hash Table",
                "Binary Search Tree",
              ],
              correctAnswerIndex: 0,
              hint:
              "You must follow node pointers one by one.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Memory Management",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which structure wastes memory if not fully used?",
              options: [
                "Array",
                "Linked List",
                "Stack",
                "Queue",
              ],
              correctAnswerIndex: 0,
              hint:
              "Unused slots remain allocated in fixed-size arrays.",
            ),
            QuestionModel(
              question:
              "Which structure has overhead due to pointers?",
              options: [
                "Linked List",
                "Array",
                "Matrix",
                "Heap",
              ],
              correctAnswerIndex: 0,
              hint:
              "Each node stores extra memory for links.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After analyzing both structures, what should be documented?",
              options: [
                "Trade-offs and Use Cases",
                "Delete All Logs",
                "Ignore the Analysis",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Documentation helps guide future design decisions.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively improves data structure usage?",
              options: [
                "Choosing the Right Structure per Operation",
                "Always using Arrays",
                "Always using Linked Lists",
                "Ignoring Performance",
              ],
              correctAnswerIndex: 0,
              hint:
              "Efficiency depends on matching structure to problem.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 9,
      title: "Social Engineering Defense",
      subtitle: "Recognize manipulation tactics and protect against human-targeted attacks.",
      scenario: ''' 
Attackers posed as IT staff and tricked employees into revealing their credentials over the phone. They used psychological manipulation, 
urgency, and authority to bypass technical defenses. Once inside, attackers accessed sensitive HR records and financial data. 
At first glance, the calls seemed legitimate, but subtle cues revealed deception. If not contained quickly, attackers could continue exploiting 
human trust to compromise systems. 
As a Cyber Security Investigator, your mission is to identify social engineering tactics, train employees to resist manipulation, and recommend 
preventive measures. 
''',
      tags: [
        "#SOCIAL_ENGINEERING",
        "#HUMAN_SECURITY",
        "#AWARENESS",
        "BEGINNER",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: The Fake IT Call",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which tactic is commonly used in social engineering?",
              options: [
                "Impersonation",
                "Firewall Rules",
                "Encryption",
                "Hashing",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers pretend to be trusted individuals.",
            ),
            QuestionModel(
              question:
              "Which emotion do attackers often exploit?",
              options: [
                "Urgency",
                "Relaxation",
                "Happiness",
                "Curiosity",
              ],
              correctAnswerIndex: 0,
              hint:
              "They pressure victims to act quickly.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Email Manipulation",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which email characteristic indicates social engineering?",
              options: [
                "Urgent request for credentials",
                "Company logo",
                "Perfect grammar",
                "Internal sender",
              ],
              correctAnswerIndex: 0,
              hint:
              "Attackers create urgency to bypass caution.",
            ),
            QuestionModel(
              question:
              "Which type of attack tricks users into clicking malicious links?",
              options: [
                "Phishing",
                "SQL Injection",
                "Buffer Overflow",
                "Cross-Site Scripting",
              ],
              correctAnswerIndex: 0,
              hint:
              "It relies on fake emails or websites.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Detecting Deception",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which log provides evidence of social engineering attempts?",
              options: [
                "Helpdesk Call Logs",
                "Printer Logs",
                "Clipboard Logs",
                "Bluetooth Logs",
              ],
              correctAnswerIndex: 0,
              hint:
              "Think about where impersonation calls are recorded.",
            ),
            QuestionModel(
              question:
              "Which attack relies on manipulating human trust?",
              options: [
                "Social Engineering",
                "SQL Injection",
                "Cross-Site Scripting",
                "Buffer Overflow",
              ],
              correctAnswerIndex: 0,
              hint:
              "It targets people, not software vulnerabilities.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Damage Control",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After detecting credential theft via social engineering, what should be done first?",
              options: [
                "Force Password Reset",
                "Restart the Computer",
                "Delete Browser History",
                "Turn Off Wi-Fi",
              ],
              correctAnswerIndex: 0,
              hint:
              "Prevent attackers from continuing to use stolen accounts.",
            ),
            QuestionModel(
              question:
              "Which security control helps verify identity beyond passwords?",
              options: [
                "Multi-Factor Authentication",
                "Dark Mode",
                "Incognito Mode",
                "Large Login Button",
              ],
              correctAnswerIndex: 0,
              hint:
              "It requires something more than just a password.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After containing the social engineering attack, what should be done next?",
              options: [
                "Document the Incident",
                "Delete All Logs",
                "Ignore the Attack",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Incident reports help improve future security practices.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively reduces future social engineering attacks?",
              options: [
                "Security Awareness Training",
                "Sharing Passwords",
                "Disabling Spam Filters",
                "Ignoring Unknown Emails",
              ],
              correctAnswerIndex: 0,
              hint:
              "Educated users are the strongest defense against manipulation.",
            ),
          ],
        ),
      ],
    ),
    CourseModel(
      id: 10,
      title: "Operating System Scheduling",
      subtitle: "Learn how processes are scheduled using different algorithms.",
      scenario: ''' 
A software company is running multiple applications on its servers. Users complain about delays and uneven 
performance. Investigators discover that the operating system’s scheduling algorithm is not optimized, causing 
some processes to wait too long while others finish quickly. 
At first glance, the CPU seemed busy, but poor scheduling led to inefficiency. If not fixed, system responsiveness 
and user satisfaction will continue to decline. 
As a Computer Science Investigator, your mission is to analyze scheduling algorithms, identify their strengths and 
weaknesses, and recommend the best approach for different scenarios. 
''',
      tags: [
        "#OPERATING_SYSTEMS",
        "#CPU_SCHEDULING",
        "#ALGORITHMS",
        "INTERMEDIATE",
      ],
      levels: [
        LevelModel(
          id: 1,
          title: "LEVEL 1",
          subtitle: "Case 1: First-Come, First-Served",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which scheduling algorithm executes processes in the order they arrive?",
              options: [
                "First-Come, First-Served (FCFS)",
                "Shortest Job First (SJF)",
                "Round Robin (RR)",
                "Priority Scheduling",
              ],
              correctAnswerIndex: 0,
              hint:
              "It works like a queue: first in, first out.",
            ),
            QuestionModel(
              question:
              "What is the main drawback of FCFS?",
              options: [
                "Convoy Effect",
                "Fairness",
                "Low Overhead",
                "Predictability",
              ],
              correctAnswerIndex: 0,
              hint:
              "Long jobs delay shorter ones.",
            ),
          ],
        ),

        LevelModel(
          id: 2,
          title: "LEVEL 2",
          subtitle: "Case 2: Shortest Job First",
          isLocked: false,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which algorithm minimizes average waiting time?",
              options: [
                "Shortest Job First (SJF)",
                "FCFS",
                "Round Robin",
                "Priority Scheduling",
              ],
              correctAnswerIndex: 0,
              hint:
              "It selects the process with the smallest burst time.",
            ),
            QuestionModel(
              question:
              "What is the main risk of SJF?",
              options: [
                "Starvation of long processes",
                "Fairness",
                "Low Overhead",
                "Predictability",
              ],
              correctAnswerIndex: 0,
              hint:
              "Long jobs may never get CPU time.",
            ),
          ],
        ),

        LevelModel(
          id: 3,
          title: "LEVEL 3",
          subtitle: "Case 3: Round Robin",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which algorithm gives each process equal CPU time slices?",
              options: [
                "Round Robin (RR)",
                "FCFS",
                "SJF",
                "Priority Scheduling",
              ],
              correctAnswerIndex: 0,
              hint:
              "It cycles through processes in fixed time quanta.",
            ),
            QuestionModel(
              question:
              "What is the key factor in Round Robin performance?",
              options: [
                "Time Quantum Size",
                "Process Arrival Order",
                "Priority Value",
                "Memory Allocation",
              ],
              correctAnswerIndex: 0,
              hint:
              "Too small increases overhead, too large reduces fairness.",
            ),
          ],
        ),

        LevelModel(
          id: 4,
          title: "LEVEL 4",
          subtitle: "Case 4: Priority Scheduling",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "Which algorithm selects processes based on importance?",
              options: [
                "Priority Scheduling",
                "FCFS",
                "SJF",
                "Round Robin",
              ],
              correctAnswerIndex: 0,
              hint:
              "Higher priority processes run first.",
            ),
            QuestionModel(
              question:
              "What problem occurs if low-priority processes never run?",
              options: [
                "Starvation",
                "Fairness",
                "Convoy Effect",
                "Deadlock",
              ],
              correctAnswerIndex: 0,
              hint:
              "Processes with low priority may wait indefinitely.",
            ),
          ],
        ),

        LevelModel(
          id: 5,
          title: "LEVEL 5",
          subtitle: "Case 5: Final Report",
          isLocked: true,
          isCompleted: false,
          questions: [
            QuestionModel(
              question:
              "After analyzing scheduling algorithms, what should be documented?",
              options: [
                "Trade-offs and Use Cases",
                "Delete All Logs",
                "Ignore the Analysis",
                "Replace Every Computer",
              ],
              correctAnswerIndex: 0,
              hint:
              "Documentation helps guide future OS design decisions.",
            ),
            QuestionModel(
              question:
              "Which practice most effectively improves CPU scheduling?",
              options: [
                "Choosing the Right Algorithm per Scenario",
                "Always using FCFS",
                "Always using SJF",
                "Ignoring Performance",
              ],
              correctAnswerIndex: 0,
              hint:
              "Efficiency depends on matching algorithm to workload.",
            ),
          ],
        ),
      ],
    ),

  ];

}