package com.invoice.pdf;
import java.io.ByteArrayOutputStream;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
public class HTMLtoPDFJava17 {
	public static byte[] toPDF(String input) throws Exception {
	// Parse HTML content using Jsoup        
	String htmlContent = input;
	Document doc = Jsoup.parse(htmlContent, "UTF-8");
	doc.outputSettings().syntax(Document.OutputSettings.Syntax.xml);
    // Convert HTML to PDF       
	try (ByteArrayOutputStream os = new ByteArrayOutputStream()) 
		{
			PdfRendererBuilder builder = new PdfRendererBuilder();
			builder.useFastMode(); // Optional: Speeds up rendering            
			builder.withHtmlContent(doc.html(), null);
			builder.toStream(os);
			builder.run();
			return os.toByteArray();
		}
	}
}