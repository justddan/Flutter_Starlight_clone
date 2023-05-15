class WithdrawalReason {
  final String title;
  final int reasonId;

  WithdrawalReason({
    required this.title,
    required this.reasonId,
  });
}

List<WithdrawalReason> reasons = [
  WithdrawalReason(
    title: "Select your answer",
    reasonId: 0,
  ),
  WithdrawalReason(
    title: "I've been using it for too long.",
    reasonId: 1,
  ),
  WithdrawalReason(
    title: "I want to create a new account.",
    reasonId: 2,
  ),
  WithdrawalReason(
    title: "I met a rude user.",
    reasonId: 3,
  ),
  WithdrawalReason(
    title: "Others",
    reasonId: 4,
  ),
];
