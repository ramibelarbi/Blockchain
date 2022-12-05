//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
contract Patient {
    address[] internal patientlist;
    mapping(address => patient) internal patients;
    // mapping(uint256 =>attendant) attendantlist;

    event PatientAdded(
        address id_,
        string _fname,
        string _lname,
        uint256 _cin,
        uint256 _phone,
        string _email
    );

    struct patient {
        address id;
        string fname;
        string lname;
        uint256 cin;
        uint256 phone;
        string email;
    }
    patient p;


    //  struct attendant{
    //      uint256 patient_id;
    //  string attendant_name;
    //  string attendant_relation;
    //  uint256 attendant_phn_no;
    //  }
    //  attendant a;

    //  address owner;

    //   constructor()  public {
    //       owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35; //Address of Hospital
    //   }

    //   // modifier to give access only to hospital
    //   modifier isOwner() {

    //      require(msg.sender == owner, "Access is not allowed");

    //      _;

    //  }

    //  function store_patient_details(string memory _fname,string memory _lname,uint256  _cin, uint256 _phone ,string memory _email,string memory _address) public {

    //   * @param _id id
    //  * @param _fname fname
    //  * @param _lname lname
    //  * @param _cin cin
    //  * @param _phone phone
    //  * @param _email email
    //  * @param _address adress
    //  p.fname=_fname;
    //  p.lname=_lname;
    //  p.cin=_cin;
    //  p.phone=_phone;
    //  p.email=_email;
    //  p.adress=_address;

    //     patientlist.push(p.cin);

    //      }

    /**
         * @dev Store patient details
            //   * @param _id id
            //  * @param _fname fname
           //  * @param _lname lname
          //  * @param _cin cin
           //  * @param _phone phone
            //  * @param _email email

         */
    function store_patient_details(
        address _id,
        string memory _fname,
        string memory _lname,
        uint256 _cin,
        uint256 _phone,
        string memory _email
    ) public {
        p.id = _id;
        p.fname = _fname;
        p.lname = _lname;
        p.cin = _cin;
        p.phone = _phone;
        p.email = _email;
        patients[p.id] = p;
        patientlist.push(p.id);
        emit PatientAdded(
            p.id,
            p.fname,
            p.lname,
            p.cin,
            p.phone,
            p.email
        );
    }

    //  /**
    //  * @dev Store attendant details
    //  * @param patient_id patient id
    //  * @param _attendant_name name of attendant
    //  * @param _attendant_relation relation to patient
    //  * @param _attendant_phn_no phone no
    //  * */
    //  function store_attendant_details(uint256 patient_id,string memory _attendant_name,string memory _attendant_relation, uint256 _attendant_phn_no)public isOwner {

    //      a.patient_id = patient_id;
    //     a.attendant_name=_attendant_name;
    //      a.attendant_relation=_attendant_relation;
    //      a.attendant_phn_no=_attendant_phn_no;

    //      attendantlist[patient_id] = a;
    //  }

    /**
    //  * @dev Retreive patient details
    //  * @param id patient cin
    //  * @return patient object
     * */
    function retreive_patient_details(address id)
        public
        view
        returns (patient memory)
    {
        return patients[id];
    }

    //  /**
    //  * @dev Retreive attendant details
    //  * @param patient_id patient id
    //  * */
    //  function retreive_attendant_details(uint256 patient_id) public view returns (string memory,string memory,uint256){

    //       attendant memory a = attendantlist[patient_id];

    //   return (a.attendant_name,a.attendant_relation,a.attendant_phn_no);

    //  }
}