# Tokenized Consulting Knowledge Management System

A decentralized platform for managing consulting services, knowledge sharing, and performance tracking using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a comprehensive solution for the consulting industry, featuring:

- **Consultant Verification**: Validates and manages consulting professionals
- **Knowledge Sharing**: Incentivizes knowledge sharing through tokenized rewards
- **Project Coordination**: Manages consulting projects and client relationships
- **Client Management**: Handles client onboarding and feedback
- **Performance Measurement**: Tracks consultant performance and rankings

## Smart Contracts

### 1. Consultant Verification Contract (`consultant-verification.clar`)
- Manages consultant registration and verification
- Tracks specializations and experience levels
- Handles verification requests and approvals

### 2. Knowledge Sharing Contract (`knowledge-sharing.clar`)
- Enables consultants to share knowledge and expertise
- Implements token-based reward system
- Supports upvoting and community validation

### 3. Project Coordination Contract (`project-coordination.clar`)
- Manages project creation and assignment
- Tracks project status and milestones
- Handles consultant-client matching

### 4. Client Management Contract (`client-management.clar`)
- Client registration and profile management
- Relationship tracking between clients and consultants
- Feedback and rating system

### 5. Performance Measurement Contract (`performance-measurement.clar`)
- Tracks consultant performance metrics
- Calculates performance scores and rankings
- Monitors project completion rates and client satisfaction

## Key Features

### For Consultants
- Verification and credentialing system
- Knowledge sharing with token rewards
- Project assignment and management
- Performance tracking and rankings
- Peer review and feedback system

### For Clients
- Verified consultant directory
- Project posting and management
- Consultant rating and feedback
- Relationship tracking
- Quality assurance through performance metrics

### Token Economics
- Knowledge Token (KT) rewards for sharing expertise
- Upvoting system for quality content
- Performance-based token distribution
- Incentivized participation in the ecosystem

## Getting Started

### Prerequisites
- Stacks blockchain environment
- Clarity development tools
- Node.js for testing

### Installation

1. Clone the repository
   \`\`\`bash
   git clone <repository-url>
   cd tokenized-consulting-system
   \`\`\`

2. Install dependencies
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks blockchain:

\`\`\`bash
# Deploy consultant verification contract
clarinet deploy consultant-verification

# Deploy knowledge sharing contract
clarinet deploy knowledge-sharing

# Deploy project coordination contract
clarinet deploy project-coordination

# Deploy client management contract
clarinet deploy client-management

# Deploy performance measurement contract
clarinet deploy performance-measurement
\`\`\`

## Usage Examples

### Consultant Registration
\`\`\`clarity
(contract-call? .consultant-verification request-verification "Blockchain Development" u5)
\`\`\`

### Knowledge Sharing
\`\`\`clarity
(contract-call? .knowledge-sharing share-knowledge
"Smart Contract Best Practices"
"QmHash123..."
"Development")
\`\`\`

### Project Creation
\`\`\`clarity
(contract-call? .project-coordination create-project
"DeFi Protocol Audit"
"Security audit for new DeFi protocol"
u10000
u1000)
\`\`\`

## Testing

The system includes comprehensive tests using Vitest:

\`\`\`bash
npm run test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Consultant verification workflows
- Knowledge sharing and token rewards
- Project coordination and management
- Client management and feedback
- Performance measurement and scoring

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
