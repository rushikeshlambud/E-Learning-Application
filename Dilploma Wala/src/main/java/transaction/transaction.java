package transaction;

import java.io.File;

import com.oreilly.servlet.MultipartRequest;

public class transaction {
	
	public static String setPath(String imagename,MultipartRequest m,String newpath,String temppath)
	{
		
	String std=m.getParameter("stdnumber");
	String subject=m.getParameter("transactid");
	String setpath="0";
	String mvdPath=newpath+std+"/"+subject;
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
     			setpath=std+"/"+subject+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=std+"/"+subject+"/"+imagename;
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
     			setpath=std+"/"+subject+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=std+"/"+subject+"/"+imagename;
     		}	
     	}	
	}
	
	System.out.print(setpath);
	return setpath;
	
	
	}

}
