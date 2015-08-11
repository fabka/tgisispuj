/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tgisispuj;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Claudia
 */
public class Tgisispuj {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        List<String> ls = Tgisispuj.read("tgisispuj.csv");
        List<String[]> lss = Tgisispuj.splitStrings(ls);
        Tgisispuj.write("tgisispuj.html", lss);
        
    }
    
    public static List<String> read( String fileName){
        List ls = new ArrayList<>();
        try {
		File fileDir = new File(fileName);
		BufferedReader in = new BufferedReader(
		   new InputStreamReader(
                      new FileInputStream(fileDir), "windows-1252"));
		        
		String str;
		      
		while ((str = in.readLine()) != null) {
                    ls.add(str);
		    //System.out.println(str);
		}
		        
                in.close();
	    } 
	    catch (UnsupportedEncodingException e) 
	    {
			System.out.println("1 " + e.getMessage());
	    } 
	    catch (IOException e) 
	    {
			System.out.println("2 " + e.getMessage());
	    }
	    catch (Exception e)
	    {
			System.out.println("3 " + e.getMessage());
	    }        
        return ls;
    }
    
    public static List<String[]> splitStrings( List<String> ls ){
        List<String[]> lss = new ArrayList<>();
        for( String s: ls ){
            String[] temp = s.split(";");
            lss.add(s.split(";"));
        }
        return lss;
    }
    
    public static String organizeVariables( String[] str ){
        
        //Organizando Menciones de honor
        if( str[6].equals("Si") )
            str[6] = "<span class=\"glyphicon glyphicon-ok\"></span>";
        else if( str[6].equals("No") )
            str[6] = "<span class=\"glyphicon glyphicon-remove\"></span>";
        
        //Organizando websites
        if( !str[9].equals("-") )
            str[9] = "" +
"                  <a href=\"http://"+ str[9] +"\">\n" +
"                    <button type=\"button\" class=\"btn btn-default btn-lg\">\n" +
"                      <span class=\"glyphicon glyphicon-globe\"></span>\n" +
"                    </button>\n" +
"                  </a>";
                
        //General
        for( int i=0; i<str.length; i++ )
            if( str[i].equals("-") )
                str[i] = "                  <span class=\"glyphicon glyphicon-minus\" aria-hidden=\"true\"></span>";
        
        return ""+
"             <tr>\n" +
"               <td><p class=\"text-center\">"+ str[0] +"</p></td>\n" +                         //Código
"               <td><p class=\"text-center\">"+ str[1] +"</p></td>\n" +                         //Nombre
"               <td class=\"modality\"><p class=\"text-center\">"+ str[2] +"</p></td>\n" +      //Modalidad
"               <td><p class=\"text-center\">"+ str[3] +"</p></td>\n" +                         //Autor
"               <td><p class=\"text-center\">"+ str[4] +"</p></td>\n" +                         //Director
"               <td class=\"research-group\"><p class=\"text-center\">"+ str[5] +"</p></td>\n" +                  //Grupo de investigacion
"               <td class=\"honor-mention\"><p class=\"text-center\">"+ str[6] +"</p></td>\n" + //Mención de honor    
"               <td class=\"year\"><p class=\"text-center\">"+ str[7] +"</p></td>\n" +          //Año
"               <td class=\"period\"><p class=\"text-center\">"+ str[8] +"</p></td>\n" +        //Periodo
"               <td>\n"+
"                 <p class=\"text-center\">\n"+
                    str[9] +"\n"+
"                 </p>\n"+
"               </td>\n" +                             //Website
"             </tr>";
    }
    
    public static void write( String fileName, List<String[]> lss ){
        try {
            File fileDir = new File(fileName);

            Writer out = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(fileDir), "UTF8"));

            for( String[] s: lss ){
                out.append(Tgisispuj.organizeVariables(s)).append("\r");
            }
            out.flush();
            out.close();
	        
        } 
        catch (UnsupportedEncodingException e) 
        {
             System.out.println(e.getMessage());
        } 
        catch (IOException e) 
        {
             System.out.println(e.getMessage());
         }
        catch (Exception e)
        {
             System.out.println(e.getMessage());
        }
    }
    
}
