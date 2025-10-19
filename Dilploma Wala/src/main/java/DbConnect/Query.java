package DbConnect;

public interface Query {
// Query for adding Uploaded Video information .
final String insert_video_details="insert into videos(v_name, v_embed_id, v_standard, v_platform, uploading_date, uploading_time, subject_id, batch_id, video_time)values(?,?,?,?,CURDATE(),CURTIME(),?,?,?)";

//Query for showing Uploaded video information.

final String video_details="select * from videos";

//Query for showing Uploaded video information.
final String update_video_details="update videos set  v_name=?, v_embed_id=?, v_standard=?, v_platform=? where v_id=?";


//Query for deleting  Uploaded video information.

final String delete_video_details="delete from videos where v_id=?";


}
