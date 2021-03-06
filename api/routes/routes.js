module.exports = function(app) {

  //patients
    var patientcontroller = require('../controllers/patientcontroller');

    app.route('/patients')
      .get(patientcontroller.get_all_records)
      .post(patientcontroller.sign_up)

    app.route('/patients/:patientID')
      .get(patientcontroller.get_specific_record)
      .put(patientcontroller.update_profile)
      .delete(patientcontroller.delete_specific_record)

    app.route('/patients/:patientID/history')
      .get(patientcontroller.get_seizure_history)
      .post(patientcontroller.add_seizure)

    app.route('/patients/:patientID/numberofseizures')
      .get(patientcontroller.get_number_of_seizures_shaza)

    app.route('/patients/:patientID/history/numberofseizuresbyday')
      .get(patientcontroller.get_number_of_seizures_by_day)

    app.route('/patients/:patientID/history/timestamps')
      .get(patientcontroller.get_timestamps_array)

    app.route('/patients/:patientID/history/timestamps/times')
      .get(patientcontroller.get_timestamps_array_times)

    app.route('/patients/:patientID/history/timestamps/numberofseizures')
      .get(patientcontroller.get_number_of_seizures)

    app.route('/patients/login')
      .post(patientcontroller.login)

    app.route('/contacts')
      .get(patientcontroller.get_emergency_contacts)
      .post(patientcontroller.add_emergency_contact)
    
    app.route('/contacts/:patientID')
      .get(patientcontroller.get_specific_contact)
      .put(patientcontroller.update_emergency_contact)
      .delete(patientcontroller.delete_emergency_contact)
    

    //temporary API, for testing
    app.route('/logindetails')
      .get(patientcontroller.get_login_details)

    app.route('/adddates/:patientID')
      .post(patientcontroller.add_dates)

    
    //doctors
    var doctorcontroller = require('../controllers/doctorcontroller');

    app.route('/doctors')
      .get(doctorcontroller.get_all_records)
      .post(doctorcontroller.sign_up)
    
    app.route('/doctors/patients/:doctorID')
      .get(doctorcontroller.get_doctor_patients)

    app.route('/doctors/:doctorID')
      .get(doctorcontroller.get_specific_record)

    app.route('/doctors/login')
      .post(doctorcontroller.login)

    app.route('/doctors/getID/:doctorEmail')
      .get(doctorcontroller.get_doctor_id)

    //serves the login page
    var express = require('express');
    app.use('/episense', express.static('public/login'))

    //serves the dashboard page
    app.use('/episense/dashboard', express.static('public/dashboard'))

    //serves the patient charts page
    app.use('/episense/charts', express.static('public/charts'))
};