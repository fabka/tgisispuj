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
    
    /*
    
    0 = Nombre TG
    1 = Autores
    2 = Director
    3 = Año
    4 = Periodo
    5 = Website
    6 = Grupo de investigación
    7 = Código
    8 = Modalidad
    9 = Mención de honor
    
    */
    
    public static String organizeVariables( String[] str ){
        
        //Organizando Menciones de honor
        if( str[9].equals("Si") )
            str[9] = "<span class=\"glyphicon glyphicon-ok\"></span> "+str[9];
        else if( str[9].equals("No") )
            str[9] = "<span class=\"glyphicon glyphicon-remove\"></span> "+str[9];
        
        //Organizando websites
        if( !str[5].equals("-") )
            str[5] = "" +
"            <a href=\"http://"+ str[5] +"\">\n" +
"              <button type=\"button\" class=\"btn btn-default btn-lg btn-dd\">\n" +
"                <span class=\"glyphicon glyphicon-globe\"></span>\n" +
"              </button>\n" +
"            </a>";
                
        //General
        for( int i=0; i<str.length; i++ )
            if( str[i].equals("-") )
                str[i] = "<span class=\"glyphicon glyphicon-minus\" aria-hidden=\"true\"></span>";
        
        String s = ""+
"      <div class=\"col-xs-12 item\">\n" +
"        <div class=\"col-xs-12 main\">\n" +
"          <div class=\"col-xs-12 col-md-5\">\n" +
"            <p class=\"text-center\">"+str[0]+"</p>\n" + //Nombre TG
"          </div>\n" +
"          <div class=\"col-xs-12 col-md-3\">\n" +
"            <p class=\"text-center\">"+str[1]+"</p>\n" + //Autores
"          </div>\n" +
"          <div class=\"col-xs-4 col-md-2\">\n" +
"            <p class=\"text-center\">"+str[2]+"</p>\n" + //Director 
"          </div>\n" +
"          <div class=\"col-xs-4 col-md-1\">\n" +
"            <td class=\"year\"><p class=\"text-center\">"+str[3]+"-"+str[4]+"</p>\n" + //año-periodo
"          </div>\n" +
"          <div class=\"col-xs-4 col-md-1\">\n" +
""+str[5]+"\n" + //Website
"          </div>\n" +
"        </div>\n" +
"        <div class=\"col-xs-12 secondary\">\n" +
"          <div class=\"col-xs-4\">\n" +
"            <p class=\"text-center\">"+str[6]+"</p>\n" + //grupo de investigación
"          </div>\n" +
"          <div class=\"col-xs-3\">\n" +
"            <p class=\"text-center\">"+str[7]+"</p>\n" + //codigo
"          </div>\n" +
"          <div class=\"col-xs-3\">\n" +
"            <p class=\"text-center\">"+str[8]+"</p>\n" + //Modalidad
"          </div>\n" +
"          <div class=\"col-xs-2\">\n" +
"            <p class=\"text-center\">"+str[9]+"</p>\n" +
"          </div>\n" +
"        </div>\n" +
"      </div>";
        
        //System.out.println(s);
        return s;
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
