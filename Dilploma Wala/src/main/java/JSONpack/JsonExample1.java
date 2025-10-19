package JSONpack;



import DbConnect.DbConnect;

import java.sql.*;
import java.util.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
//import org.json.simple.parser.ParseException;

public class JsonExample1 {
  public static String fetchData(String data, String user_id, String qquiz_id) throws Exception {
    Base64.Decoder decoder = Base64.getDecoder();
    String dStr = new String(decoder.decode(data));
    try {
      JSONArray jsonArray = new JSONArray(dStr);
      Connection con = (Connection)DbConnect.con();
      String sql = "insert into answerkey(quiz_id,user_id,question_id,answer)values(?,?,?,?)";
      for (int i = 0; i < jsonArray.length(); i++) {
        JSONObject jsonObject1 = jsonArray.getJSONObject(i);
        String value1 = jsonObject1.optString("question_Number");
        String value2 = jsonObject1.optString("answer");
        try {
          PreparedStatement ps = (PreparedStatement)con.prepareStatement(sql);
          ps.setString(1, qquiz_id);
          ps.setString(2, user_id);
          ps.setString(3, value1);
          ps.setString(4, value2);
          ps.executeUpdate();
        } catch (SQLException e) {
          e.printStackTrace();
        } 
      } 
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      } 
    } catch (JSONException e) {
      e.printStackTrace();
    } 
    return null;
  }
}