pragma solidity ^0.8.0;

contract DAO {
    address public owner;
    uint256 public proposalCount;
    uint256 public minVotes;
    uint256 public minQuorum;
    uint256 public votingDuration;
    mapping(uint256 => Proposal) public proposals;
    mapping(address => bool) public members;

    struct Proposal {
        uint256 id;
        address creator;
        string description;
        uint256 votes;
        bool executed;
        mapping(address => bool) voters;
    }

    event ProposalCreated(uint256 id, address creator, string description);
    event Voted(uint256 id, address voter);
    event ProposalExecuted(uint256 id);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyMembers() {
        require(members[msg.sender], "Only members can call this function");
        _;
    }

    constructor(uint256 _minVotes, uint256 _minQuorum, uint256 _votingDuration) {
        owner = msg.sender;
        minVotes = _minVotes;
        minQuorum = _minQuorum;
        votingDuration = _votingDuration;
    }

    function addMember(address _member) external onlyOwner {
        members[_member] = true;
    }

    function createProposal(string memory _description) external onlyMembers {
        require(bytes(_description).length > 0, "Proposal description cannot be empty");
        uint256 proposalId = proposalCount++;
        proposals[proposalId] = Proposal({
            id: proposalId,
            creator: msg.sender,
            description: _description,
            votes: 0,
            executed: false
        });
        emit ProposalCreated(proposalId, msg.sender, _description);
    }

    function vote(uint256 _proposalId) external onlyMembers {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Proposal has already been executed");
        require(!proposal.voters[msg.sender], "You have already voted for this proposal");

        proposal.votes++;
        proposal.voters[msg.sender] = true;
        emit Voted(_proposalId, msg.sender);

        if (proposal.votes >= minVotes) {
            executeProposal(_proposalId);
        }
    }

    function executeProposal(uint256 _proposalId) internal {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Proposal has already been executed");
        require(proposal.votes >= minVotes && proposal.votes >= minQuorum, "Proposal does not meet quorum");

        proposal.executed = true;
        emit ProposalExecuted(_proposalId);

        // Implement the logic to execute the proposal here
        // For example: proposal.creator.transfer(address(this).balance);
    }
}
