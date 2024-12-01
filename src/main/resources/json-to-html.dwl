%dw 2.0
output application/xml
var subTotal = sum (payload.ItemDetails.Amount)
var taxAmount = subTotal * payload."GST %"/100 
var totalAmount = subTotal + taxAmount
var logo = "https://image.similarpng.com/very-thumbnail/2020/08/Fresh-Drink-logo-on-transparent-background-PNG.png"
var currentDate = now() as Date as String {"format": "dd-MM-yyyy"}
---
{
	html:
	{
		header:
		{
			
		},
		body:
		{
			div @(style: "position: relative;"): {
                img @(src: logo ,style: "position: absolute; top: 15%; right: 0%; height: 90px; width: 170px;", alt:"Logo"): ""
            },
            div : {
                p @(style:"text-align: center; font-size:10px;"): payload.SellerDetails.SellerName ,
                p @(style:"text-align: center; font-size:10px;"): payload.SellerDetails.SellerAddress,
                p @(style:"text-align: center; font-size:10px;"): payload.SellerDetails.SellertLocation,
                p @(style:"text-align: center; font-size:10px;"): payload.SellerDetails.SellerPincode,
                p @(style:"text-align: center; font-size:10px;"): "GSTN: " ++ payload.SellerDetails.SellerGSTN
            },
            hr @(style: "height: 1px background: black"): "",
            table: {
                tr @(style:"font-size:10px;"):
                {
                    td @(style:"font-weight:bold; width: 600px"): "Bill to:",
                    td @(style: "width: 100px; text-align:right;"): "Invoice No. ",
                    td @(style: "width: 100px; text-align:right;"): payload.InvoiceNo
                },
                tr @(style:"font-size:10px;"):
                {
                    td @(style: "width: 600px"): payload.BuyerDetails.BuyerName,
                    td @(style: "width: 100px; text-align:right;"):"Date ",
                    td @(style: "width: 100px; text-align:right;"): currentDate
                },
                tr @(style:"font-size:10px;"):
                {
                    td: payload.BuyerDetails.BuyerAddress,
                    td :"",
                    td : ""
                },
                tr @(style:"font-size:10px;"):
                {
                    td: payload.BuyerDetails.BuyerLocation,
                    td :"",
                    td : ""
                },
                tr @(style:"font-size:10px;"):
                {
                    td: payload.BuyerDetails.BuyerPincode,
                    td : "",
                    td : ""
                },
                tr @(style:"font-size:10px;"):
                {
                    td: "GSTN: " ++ payload.BuyerDetails.BuyerGSTN,
                    td :"",
                    td : ""
                }
            },
            p @(style: "font-weight:bold; font-size:15px"): "Invoice Summary",
            hr @(style: "height: 3px; background: black"): "",
            table @(style: "width: 100%; border: 1px solid black;  border-collapse: collapse;"): {
		        tr @(align:"center", style: "font-size:10px; width:10% border: 1px solid black;  border-collapse: collapse;"): {
		            th @(style: "border: 1px solid black;  border-collapse: collapse;") : "SL. No",
		            th @(style: "border: 1px solid black;  border-collapse: collapse;") : "Item",
		            th @(style: "border: 1px solid black;  border-collapse: collapse;") : "Quantity",
		            th @(style: "border: 1px solid black;  border-collapse: collapse;") : "Unit Price",
		            th @(style: "border: 1px solid black;  border-collapse: collapse;") : "Amount"
		     },
		    (payload.ItemDetails map (item, index) -> {
		            tr @(align:"center", style: "font-size:10px; width:10% border: 1px solid black;  border-collapse: collapse;"): {
		                td @(style: "border: 1px solid black; font-size:10px;  border-collapse: collapse;"): item."SL. No",
		                td @(style: "border: 1px solid black; font-size:10px;  border-collapse: collapse;"): item."ItemName",
		                td @(style: "border: 1px solid black; font-size:10px;  border-collapse: collapse;"): item."Quantity",
		                td @(style: "border: 1px solid black; font-size:10px;  border-collapse: collapse;"): item."UnitPrice",
		                td @(style: "border: 1px solid black; font-size:10px;  border-collapse: collapse;"): item."Amount",
		            }
		        })
		     },
		     p @(style: "text-align:right; font-size:10px; padding-right: 25px"): "Subtotal: " ++ subTotal as String,
		     p @(style: "text-align:right; font-size:10px; padding-right: 25px"): "GST: " ++ payload."GST %" as String ++ "%",
		     p @(style: "text-align:right; font-size:10px; padding-right: 25px"): "Total: " ++ totalAmount as String,
		     br : "",
		     p @(style: "font-weight:bold; font-size:10px"): "For Pristine Enterprises",
		     p @(style: "font-size:10px"): "Authorized Signatory",
		     
	}
 }
}