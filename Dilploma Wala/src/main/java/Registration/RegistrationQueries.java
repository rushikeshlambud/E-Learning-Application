package Registration;


public interface RegistrationQueries {
	
//Query for add student Details.
public static String addStudents=" insert into student_details(First_Name, Father_Name, Surname, Class, Stud_Mob, Stud_Email, Stud_Address, Parent_Mod, gender, Mother_name, Dob, fees)values(?,?,?,?,?,?,?,?,?,?,?,?)";


//Query for assigning batch details.

public static String assignBatch="insert into student_batch_details (Batch_id, stud_id)values(?,?)";



	
}
