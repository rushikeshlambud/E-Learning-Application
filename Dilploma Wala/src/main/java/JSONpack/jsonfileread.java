package JSONpack;

import java.io.IOException;
import java.util.Base64;
import org.json.JSONException;
import org.json.JSONObject;

public class jsonfileread {
  public static String fetchData(String data) {
    JSONObject obj = new JSONObject();
    Base64.Decoder decoder = Base64.getDecoder();
    String dStr = new String(decoder.decode(data));
    try {
      obj.put("data", dStr);
    } catch (JSONException e) {
      e.printStackTrace();
    } 
    try {
      Exception exception2, exception1 = null;
    } catch (Exception e) {
      e.printStackTrace();
    } 
    System.out.print(obj);
    return null;
  }
}
