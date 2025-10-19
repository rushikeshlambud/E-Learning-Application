package setPath;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.*;
import com.mysql.*;
import com.oreilly.servlet.MultipartRequest;


public class qImages {
	
	public static String setPath(String imagename,MultipartRequest m,String newpath,String temppath)
	{
		
	String quiz_id=m.getParameter("question_id");
	
	String setpath="0";
	String mvdPath=newpath+quiz_id;
	File mvd=new File(mvdPath);
	File  imagelocation=new File(mvdPath+"/"+imagename);
	if(!mvd.exists())
	{
     	mvd.mkdirs();	
     	if(imagelocation.exists())
     	{
     		imagelocation.delete();
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=quiz_id+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=quiz_id+"/"+imagename;
     		}	
     	}
	}
	else
	{
		if(imagelocation.exists())
     	{
     		imagelocation.delete();
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=quiz_id+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=quiz_id+"/"+imagename;
     		}	
     	}	
	}
	
	System.out.print(setpath);
	return setpath;
	
	
	}
}
