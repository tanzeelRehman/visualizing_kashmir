class AppUrl {
  static const baseUrl = 'http://192.168.4.137:8000/routes/api';
  static const weatherBaseUrl = 'https://api.openweathermap.org/data/2.5';
  //! Auth
  static const login = '/admin/login';
  //! Home
  static const getAllEmployees = '/user';
  static const getUnassignedEmployees = '/unassigned-employees';
  static const getAssignedEmployees = '/assigneduser';
  static const assignAssets = '/assignassets';
  static const getSingleAssignedAssets = '/getsingleassets/';
  static const deleteAssignedAssets = '/empassetdelete/';
}
