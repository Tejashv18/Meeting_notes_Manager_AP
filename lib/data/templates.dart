class TemplateData {
  static const List<Map<String, String>> managerTemplates = [
    // --- 1-ON-1s ---
    {"title": "Standard 1-on-1", "description": "Regular check-in to discuss progress, blockers, and growth.", "content": "Check-in & Mood:\nBlockers & Needs:\nPriorities:\nCareer & Growth:"},
    {"title": "First 1-on-1", "description": "Initial meeting to establish rapport and expectations.", "content": "Get to know you:\nPast experience:\nExpectations:\nCommunication style preferences:"},
    {"title": "Skip-Level 1-on-1", "description": "Meeting with your manager's manager for broader alignment.", "content": "High-level thoughts:\nTeam challenges:\nIdeas for improvement:\nFeedback for management:"},
    {"title": "Career Coaching", "description": "Dedicated session focusing purely on long-term career trajectory.", "content": "Long-term goals:\nSkills to develop:\nNext 6 months focus:\nHow can I support?:"},
    {"title": "Underperformance Check-in", "description": "Addressing performance gaps and creating an action plan.", "content": "Current gaps:\nRoot causes/Blockers:\nAction plan:\nTimeline for improvement:"},
    {"title": "Peer 1-on-1", "description": "Syncing with a colleague at the same level for collaboration.", "content": "Collaboration feedback:\nDependencies/Blockers:\nShared ideas:\nNext steps:"},
    {"title": "Return from Leave", "description": "Re-onboarding a team member after an extended absence.", "content": "Welcome back:\nCatch-up on major changes:\nAdjusted priorities:\nTransition support needs:"},
    {"title": "Spot Check/Sync", "description": "Brief, ad-hoc catch-up on a specific immediate topic.", "content": "Current focus:\nQuick blockers:\nNext action:"},
    
    // --- TEAM MEETINGS ---
    {"title": "Weekly Team Sync", "description": "Weekly gathering to align the team on projects and wins.", "content": "Wins & Milestones:\nProject Updates:\nKey Roadblocks:\nAction Items:"},
    {"title": "Daily Standup", "description": "Quick daily status update to unblock the team.", "content": "Done yesterday:\nDoing today:\nBlockers:"},
    {"title": "Sprint Planning", "description": "Planning and allocating work for the upcoming sprint cycle.", "content": "Sprint Goal:\nCapacity & Allocation:\nBacklog items committed:\nRisks:"},
    {"title": "Sprint Retrospective", "description": "Reflecting on the past sprint to improve future processes.", "content": "What went well?:\nWhat didn't go well?:\nIdeas for improvement:\nAction items for next sprint:"},
    {"title": "Monthly All-Hands", "description": "Company or department-wide meeting for major updates.", "content": "Company updates:\nKey metrics review:\nRecognition/Shoutouts:\nQ&A:"},
    {"title": "Brainstorming Session", "description": "Creative session to generate ideas and solutions.", "content": "Objective:\nIdeas generated:\nFeasibility discussion:\nSelected ideas to pursue:"},
    {"title": "Architecture Review", "description": "Technical discussion to evaluate system architecture proposals.", "content": "Proposed design:\nPros & Cons:\nSecurity/Scale concerns:\nDecision:"},
    {"title": "Design Review", "description": "Reviewing UX/UI designs for feedback and iteration.", "content": "UX/UI Walkthrough:\nFeedback points:\nIteration plan:"},
    {"title": "Cross-functional Sync", "description": "Meeting between different departments to align on joint efforts.", "content": "Department updates:\nInter-team dependencies:\nJoint action items:"},
    
    // --- PROJECT MANAGEMENT ---
    {"title": "Project Kickoff", "description": "Official start of a project to align stakeholders and team.", "content": "Project Objectives:\nScope & Deliverables:\nTimeline & Milestones:\nRoles & Responsibilities:"},
    {"title": "Project Status Update", "description": "Routine update on project health, risks, and next steps.", "content": "Overall Health (R/Y/G):\nCompleted since last:\nUp next:\nRisks/Issues:"},
    {"title": "Post-Mortem / RCA", "description": "Root cause analysis after a major incident or project close.", "content": "Incident summary:\nTimeline of events:\nRoot Cause:\nPreventative measures:"},
    {"title": "Risk Assessment", "description": "Identifying and mitigating project or operational risks.", "content": "Identified risks:\nImpact & Probability:\nMitigation strategies:\nOwners:"},
    {"title": "Go/No-Go Decision", "description": "Final check before deploying or launching a major initiative.", "content": "Launch readiness criteria:\nRed flags:\nApprovals:\nNext steps:"},
    {"title": "Scope Change Request", "description": "Evaluating requests to alter project scope, timeline, or budget.", "content": "Change description:\nImpact on timeline:\nImpact on budget:\nApproval status:"},
    {"title": "Vendor/Partner Sync", "description": "Routine check-in with an external vendor or partner.", "content": "Partnership health:\nDeliverables review:\nBlockers:\nNext steps:"},
    {"title": "Resource Allocation", "description": "Planning bandwidth and staffing for upcoming initiatives.", "content": "Current bandwidth:\nReallocation needs:\nBurnout risks:"},
    
    // --- PERFORMANCE & FEEDBACK ---
    {"title": "Quarterly Performance Review", "description": "Formal quarterly evaluation of goals and achievements.", "content": "Key Achievements:\nAreas for Improvement:\nCore Values Alignment:\nGoals for Next Quarter:"},
    {"title": "Annual Review", "description": "Comprehensive yearly reflection on performance and compensation.", "content": "Year in review:\nGrowth & Trajectory:\nCompensation discussion:\nNext year goals:"},
    {"title": "Mid-Year Check-in", "description": "Halfway check point for annual goals and course correction.", "content": "Progress on annual goals:\nCourse corrections needed:\nSupport required:"},
    {"title": "360 Feedback Review", "description": "Synthesizing feedback from peers, reports, and managers.", "content": "Peer feedback summary:\nDirect report feedback:\nActionable takeaways:"},
    {"title": "Promotion Discussion", "description": "Evaluating readiness and gaps for a role promotion.", "content": "Readiness assessment:\nRequired competencies met:\nGaps to close:\nTimeline/Next steps:"},
    {"title": "Probation Review", "description": "End-of-probation evaluation to finalize employment status.", "content": "Expectations met?:\nStrengths shown:\nAreas to develop:\nFinal decision:"},
    
    // --- HIRING & ONBOARDING ---
    {"title": "Interview: Behavioral", "description": "Assessing culture fit, soft skills, and experiences.", "content": "Candidate Name:\nCommunication skills:\nTeam fit/Culture:\nRed flags:\nRecommendation (Hire/No Hire):"},
    {"title": "Interview: Technical", "description": "Assessing hard skills, coding ability, and system design.", "content": "Candidate Name:\nCoding/System Design:\nProblem solving approach:\nRed flags:\nRecommendation:"},
    {"title": "Interview Panel Debrief", "description": "Gathering feedback from all interviewers to make a decision.", "content": "Panelist votes:\nKey strengths:\nConcerns/Risks:\nFinal Decision:"},
    {"title": "Candidate Reference Check", "description": "Notes from speaking with a candidate's past employers.", "content": "Reference Name/Role:\nStrengths noted:\nAreas for improvement:\nWould rehire?:"},
    {"title": "First Day Onboarding", "description": "Making a new hire feel welcome and setting initial expectations.", "content": "Welcome & Intro:\nIT setup checklist:\nOffice/Culture tour:\nWeek 1 expectations:"},
    {"title": "30-Day Check-in", "description": "Evaluating the first month of onboarding and integration.", "content": "Ramp-up progress:\nEarly roadblocks:\nTeam integration:\nGoals for 60 days:"},
    {"title": "60-Day Check-in", "description": "Evaluating performance and alignment after two months.", "content": "Performance output:\nFeedback received/given:\nGoals for 90 days:"},
    {"title": "90-Day Check-in", "description": "End of standard onboarding and transition to regular operations.", "content": "First quarter wins:\nCulture fit alignment:\nTransition to standard 1on1s:"},
    
    // --- STRATEGY & PLANNING ---
    {"title": "Quarterly OKR Planning", "description": "Defining Objectives and Key Results for the next quarter.", "content": "Objective 1 & KRs:\nObjective 2 & KRs:\nObjective 3 & KRs:\nKey initiatives/projects:"},
    {"title": "Annual Goal Setting", "description": "High-level planning and vision setting for the entire year.", "content": "Vision for the year:\nHigh-level targets:\nMajor bets/initiatives:"},
    {"title": "Budget Review", "description": "Analyzing departmental spend against allocated budgets.", "content": "Current spend vs budget:\nExplanations for variance:\nForecast adjustments:"},
    {"title": "Roadmap Planning", "description": "Prioritizing product or team initiatives across the calendar.", "content": "Q1/Q2/Q3/Q4 Themes:\nPriority rankings:\nCapacity constraints:"},
    
    // --- CLIENT / STAKEHOLDER ---
    {"title": "Client Pitch/Discovery", "description": "Initial meeting to understand a client's needs and pitch solutions.", "content": "Client background:\nPain points:\nProposed solutions:\nNext steps:"},
    {"title": "Client Onboarding", "description": "Kicking off a new client relationship and project details.", "content": "Welcome & Setup:\nDeliverables & Timeline:\nCommunication plan:"},
    {"title": "Stakeholder Update", "description": "Keeping internal sponsors aligned on project progress.", "content": "High-level progress:\nRisks escalated:\nSupport needed from stakeholders:"},
    {"title": "Business Review (QBR)", "description": "Quarterly Business Review demonstrating value to clients/executives.", "content": "Performance metrics:\nValue delivered:\nOpportunities for growth:"},
    
    // --- MISCELLANEOUS ---
    {"title": "Exit Interview", "description": "Gathering candid feedback from a departing employee.", "content": "Primary reason for leaving:\nWhat did you like most?:\nWhat could be improved?:\nFeedback for management:"},
    {"title": "Conflict Resolution", "description": "Mediating a dispute between team members or departments.", "content": "Issue description:\nPerspective A:\nPerspective B:\nAgreed resolution:"},
    {"title": "Incident Report", "description": "Documenting a safety, HR, or operational incident.", "content": "What happened:\nWho was affected:\nImmediate actions taken:\nFollow-up plan:"},
    {"title": "Training/Workshop", "description": "Notes from attending or hosting an educational session.", "content": "Topic covered:\nKey takeaways:\nQuestions/Confusion points:\nExercises completed:"},
    {"title": "Offsite Planning", "description": "Logistics and agenda planning for a team offsite event.", "content": "Location/Logistics:\nPrimary objectives:\nAgenda outline:\nTeam building activities:"},
  ];
}
