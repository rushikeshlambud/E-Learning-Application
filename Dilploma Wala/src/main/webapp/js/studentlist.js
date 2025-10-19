$( document ).ready(function(){
	 
    $('#table_id').dataTable( {
    	
    	 /*"ajax": {
        	
        	 "contentType": "application/json",
        	 
            "url":"../RegisterController1?method=getAllRecord",
            "type": "get",
            "data":{"clientName":$("#clientname").val(),"clientId":$("#clientid").val(),"fromdate":$("#fromdate").val(),"todate":$("#todate").val()}
        },*/
        
        'bProcessing': false,
        'bServerSide': false,
        'sAjaxSource': '../RegisterController1?method=getAllRecord',
        'bJQueryUI': true,
        
        'aoColumns': [
        	  { 'mData': 'count' },
            { 'mData': 'studentName' },
            { 'mData': 'fatherName' },
            { 'mData': 'surnameName' },
            { 'mData': 'studentClass' },
            { 'mData': 'mobileNumber' },
            { 'mData': 'password' },
            { 'mData': 'email' },
            { 'mData': 'address' },
            { 'mData': 'parentMobileNumber' },
            { 'mData': 'gender' },
            { 'mData': 'motherName' },
            { 'mData': 'fess' },
           
            { 'mData': 'receiptNumber' },
            { 'mData': 'rid' },
        ],
        "columnDefs": [
            {"targets": 0},
            {"targets": 1,"className": 'text-center'},
            {"targets": 2,"className": 'text-center'},
            {"targets": 3,"className": 'text-center'},
            {"targets": 4,"className": 'text-center'},
            {"targets": 5,"className": 'text-center'},
            {"targets": 6,"className": 'text-center'},
            {"targets": 7,"className": 'text-center'},
            {"targets": 8,"className": 'text-center'},
            {"targets": 9,"className": 'text-center'},
            {"targets": 10,"className": 'text-center'},
            {"targets": 11,"className": 'text-center'},
            {"targets": 12,"className": 'text-center'},
            {
                
                "targets": 13,
                "render": function ( data, type, row ) {
                
                	if ( row.receiptNumber ==null ) {
                        return " ";
                    }else{
                    	return row.receiptNumber
                    }
                
                },
                "className": 'text-center'
                },      
          {
               
            "targets": 14,
            "render": function ( data, type, row ) {
            	 
            	 return'<button type="button" id="edit" class="btn btn-success" onclick="editRegiater(' + row.rid + ');">Edit </button> <button type="button" id="delete" class="btn btn-danger" onclick="deleteRegister(' + row.rid + ');">Delete </button>';   
                        },
            "className": 'text-center'
            }
           ],
 "responsive": true

    } ); 
}) ;