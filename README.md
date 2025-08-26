# TutorMatching Platform

## Project Description

A decentralized tutoring marketplace built on the Stacks blockchain that connects students with qualified tutors through smart contracts. The platform features automated escrow payments, reputation tracking, and transparent session management, eliminating the need for traditional intermediaries in educational services.

## Project Vision

Our vision is to revolutionize the tutoring industry by creating a trustless, transparent, and efficient marketplace where:

- **Students** can find qualified tutors with verified reputation scores and transparent pricing
- **Tutors** can build their professional reputation on-chain and receive guaranteed payments
- **Educational access** is democratized through blockchain technology, reducing barriers and costs
- **Trust** is built through immutable reputation systems and automated smart contract payments

The platform aims to create a global, decentralized education ecosystem where quality tutoring is accessible, affordable, and backed by blockchain security.

## Future Scope

### Phase 1 (Current Implementation)
- ✅ Basic tutor registration and session booking
- ✅ Automated escrow and payment system
- ✅ Reputation tracking and rating system

### Phase 2 (Planned Features)
- **Advanced Matching Algorithm**: AI-powered tutor-student matching based on subject expertise, learning style, and scheduling
- **Multi-Subject Support**: Category-based tutor profiles with subject-specific ratings
- **Dispute Resolution**: Decentralized arbitration system for session conflicts
- **Certification Integration**: On-chain verification of tutor qualifications and certifications

### Phase 3 (Long-term Vision)
- **Cross-Chain Compatibility**: Support for multiple blockchain networks
- **NFT Achievements**: Gamified learning with achievement badges and certificates
- **DAO Governance**: Community-driven platform governance and fee structure
- **Video Integration**: Built-in video calling and session recording features
- **Token Economics**: Platform token for enhanced features, staking, and governance rights

### Phase 4 (Ecosystem Expansion)
- **Institution Partnerships**: Integration with schools and universities
- **Scholarship Programs**: Blockchain-based scholarship distribution system
- **Global Marketplace**: Multi-language support and regional payment methods
- **Learning Analytics**: Advanced data insights for students and tutors

## Contract Functions

### Main Functions

1. **`register-tutor-and-book-session`**
   - Registers tutor profiles with rate and reputation tracking
   - Allows students to book sessions with automatic escrow payment
   - Creates secure session records with unique identifiers

2. **`complete-session-and-pay`**
   - Enables students to mark sessions as complete and rate tutors
   - Automatically releases escrowed payments to tutors
   - Updates tutor reputation scores based on session ratings

### Read-Only Functions
- `get-tutor-profile`: Retrieve tutor information and reputation
- `get-session-details`: View session information and status
- `get-session-payment-status`: Check payment completion status
- `get-total-sessions`: View platform usage statistics

## Contract Address Details

**Mainnet Contract Address:** `[To be added after deployment]`

**Testnet Contract Address:** `[To be added after testing]`

**Deployment Information:**
- Network: Stacks Blockchain
- Contract Name: tutor-matching-platform
- Version: 1.0.0
- Deployment Block: [To be updated]

## Getting Started

### For Students
1. Find a tutor by checking their profile and reputation score
2. Call `register-tutor-and-book-session` with the tutor's address and session amount
3. Attend your tutoring session
4. Complete the session and rate your tutor using `complete-session-and-pay`

### For Tutors
1. Set your hourly rate and have students book sessions with you
2. Provide quality tutoring services
3. Receive automatic payments upon session completion
4. Build your on-chain reputation through positive student ratings

## Technical Requirements

- **Stacks Blockchain** compatibility
- **STX tokens** for session payments and gas fees
- **Stacks Wallet** for transaction signing
- **Clarity Smart Contract** runtime environment

---

*Built with ❤️ for the decentralized education future*