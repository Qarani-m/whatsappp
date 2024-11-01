class ChatFlow {
  final String message;
  final List<String> options;
  final Map<String, String> nextFlows;

  ChatFlow({
    required this.message,
    required this.options,
    required this.nextFlows,
  });
}

// Chat flow mapping
class ChatFlowManager {
  static final Map<String, ChatFlow> flows = {
    'initial': ChatFlow(
      message: "Hello Martin,\n\nI'm Eva, your Equity virtual assistant. I'm here to help you with everyday banking, and more.",
      options: [
        "Request for support",
        "Transact",
        "Borrow",
        "My account",
        "Frequently asked questions",
      ],
      nextFlows: {
        '1': 'support',
        '2': 'transact',
        '3': 'borrow',
        '4': 'account',
        '5': 'faq',
      },
    ),
    'support': ChatFlow(
      message: "What can I help you with today?",
      options: [
        "Raise an issue/incident",
        "View issue/incident status",
        "Give us feedback",
        "Back to main menu",
      ],
      nextFlows: {
        '1': 'raise_issue',
        '2': 'view_status',
        '3': 'feedback',
        '4': 'initial',
      },
    ),
    // Add more flows as needed
  };
}
