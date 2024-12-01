package com.invoice.pdf;

import java.io.ByteArrayOutputStream;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.xhtmlrenderer.layout.SharedContext;
import org.xhtmlrenderer.pdf.ITextRenderer;

public class HTMLtoPDF {
    public static  byte[] toPDF(String input) throws Exception {       
        	String htmlContent = input;
        	Document doc = Jsoup.parse(htmlContent,"UTF-8");
        	doc.outputSettings().syntax(Document.OutputSettings.Syntax.xml);
        	ByteArrayOutputStream os = new ByteArrayOutputStream();
        		ITextRenderer renderer = new ITextRenderer();				
				SharedContext cntxt = new SharedContext(); 
				cntxt.setPrint(true);
				cntxt.setInteractive(false);
            	renderer.setDocumentFromString(doc.html());
            	renderer.layout();
            	renderer.createPDF(os);
            	System.out.println("PDF Generated");
            	System.out.println("Binary Data: "+ os.toByteArray());
            	return os.toByteArray();
         
    }
}
