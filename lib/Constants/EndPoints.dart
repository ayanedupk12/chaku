



class EndPoints{
  static const apiKey = 'http://16.16.105.115:1330/api/v1';
  // static const apiKey = 'https://vit-pay.vercel.app/api/v1';
  static const logInEndpoint = "$apiKey/admin/admin-login";
  static const dashboardEndPoint = "$apiKey/admin/dashboard";
  static const getPendingLoansEndPoint = "$apiKey/admin/pending-loan";
  static const activeLoanEndPoint = "$apiKey/admin/active-loan";
  static const rejectedLoanEndPoint = "$apiKey/admin/rejected-loan";
  static const approveRejectLoanEndPoint = "$apiKey/admin/approve-reject/";
  static const getInterestEndPint = "$apiKey/user/get-interest";
  static const updateInterestEndPint = "$apiKey/admin/add-interest-fee";
  static const searchLoanEndPint = "$apiKey/admin/search-details?loanId=";
  static const payInstallmentEndPint = "$apiKey/admin/pay-installment/";
  static const sendEmailEndPint = "$apiKey/admin/send-email";
  static const viewAdminUserEndPint = "$apiKey/admin/view-admin-user";
  static const activeInactiveEndPint = "$apiKey/admin/active-inactive/";
  static const addUserEndPint = "$apiKey/admin/add-user";
  static const deleteUserEndPint = "$apiKey/admin/delete-user/";
  static const changeRoleEndPint = "$apiKey/admin/change-role/";
  static const searchByCompanyEndPint = "$apiKey/admin/search-by-company?presentEmployer=";
  static const searchByDateRepaymentEndPint = "$apiKey/admin/search-by-repayment?presentEmployer=";
  // static const loansSearchByDateAndCompanyEndPint = "$apiKey/admin/search-by-repayment?presentEmployer=combodia&fromDate=2023-08-02&toDate=2023-08-14";
  static const searchByDateFeeEndPint = "$apiKey/admin/search-by-date?presentEmployer=";
  static const analyticsEndPint = "$apiKey/admin/total-approved-rejected";
  static const getProfileEndPint = "$apiKey/user/profile";

}