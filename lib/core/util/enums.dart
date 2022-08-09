enum Gender {
  male,
  female,
}

enum AccessibilityStaysType {
  active,
  notApproved,
  notRegistered,
  notVerified,
  blocked,
  isRejected,
}

enum StudentLocation {
  mazzeh,
  hamak,
  barzeh,
}


enum OrderStatus {
  pending,
  approved,
  notApproved,
  prepared,
  failedAssigning,
  picked,
  delivered,
  notDelivered,
  canceled,
}

String orderStatusToMessage(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return "معلق";
    case OrderStatus.delivered:
      return "تم توصيله";
    case OrderStatus.picked:
      return "في الطريق إليك";
    case OrderStatus.notApproved:
      return "تم رفضه";
    case OrderStatus.failedAssigning:
      return "فشل إسناده";
    case OrderStatus.canceled:
      return "ملغى";
    case OrderStatus.approved:
      return "مقبول";
    case OrderStatus.prepared:
      return "قيد التحضير";
    case OrderStatus.notDelivered:
      return "فشل توصيله";
    default:
      return '';
  }
}


