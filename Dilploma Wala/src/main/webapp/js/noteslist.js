$( document ).ready(function(){
	 
    $('#Notes-list').dataTable( {
    	
    	 /*"ajax": {
        	
        	 "contentType": "application/json",
        	 
            "url":"../RegisterController1?method=getAllRecord",
            "type": "get",
            "data":{"clientName":$("#clientname").val(),"clientId":$("#clientid").val(),"fromdate":$("#fromdate").val(),"todate":$("#todate").val()}
        },*/
        
        'bProcessing': false,
        'bServerSide': false,
        'sAjaxSource': '../NotesController',
        'bJQueryUI': true,
        
        'aoColumns': [
        	{ 'mData': 'count' },
            { 'mData': 'title' },
            { 'mData': 'standard' },
            { 'mData': 'filepath'},
            { 'mData': 'sr_no' }
            
           
        ],
        "columnDefs": [
            {"targets": 0},
            {"targets": 1},
            {"targets": 2},
            {"targets": 3,"render":function(data,type,row){
            	return row.filepath+"<button class='btn btn-primary fa fa-eye right' title='view'>";
            }},
            {"targets": 4,"render":function(data,type,row){
            	return "<button type='button' class='btn btn-success fa fa-edit' title='Update'></button>"+
            	"<button type='button' class='btn btn-danger fa fa-trash' title='Delete'></button>";
            }}
                      ],
 "responsive": true

    } ); 
}) ;