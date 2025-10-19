package Notes;

import java.io.File;

import com.oreilly.servlet.MultipartRequest;


public class Notes {

	public static String setPath(String imagename,MultipartRequest m,String newpath,String temppath)
	{
		
	String std=m.getParameter("std");
	String subject=m.getParameter("sub");
	String batch=m.getParameter("batch");
	String title=m.getParameter("Title");
	String setpath="0";
	String mvdPath=newpath+std+"/"+subject+"/"+batch+"/"+title;
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
     			setpath=std+"/"+subject+"/"+batch+"/"+title+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=std+"/"+subject+"/"+batch+"/"+title+"/"+imagename;
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
     			setpath=std+"/"+subject+"/"+batch+"/"+title+"/"+imagename;
     		}
     		
     	} 
     	else {
     		String mvimage=temppath+imagename;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=std+"/"+subject+"/"+batch+"/"+title+"/"+imagename;
     		}	
     	}	
	}
	
	System.out.print(setpath);
	return setpath;
	
	
	}
}
