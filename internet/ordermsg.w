&ANALYZE-SUSPEND _VERSION-NUMBER WDT_v2r1 Web-Object
/* Maps: samples/web/internet/ordermsg.htm */
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _CUSTOM Definitions 
/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation ("PSC"),       *
* 14 Oak Park, Bedford, MA 01730, and other contributors as listed   *
* below.  All Rights Reserved.                                       *
*                                                                    *
* The Initial Developer of the Original Code is PSC.  The Original   *
* Code is Progress IDE code released to open source December 1, 2000.*
*                                                                    *
* The contents of this file are subject to the Possenet Public       *
* License Version 1.0 (the "License"); you may not use this file     *
* except in compliance with the License.  A copy of the License is   *
* available as of the date of this notice at                         *
* http://www.possenet.org/license.html                               *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*           This .W file was created with WebSpeed Workshop.           */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */
Define input parameter pOrderNum as character.

/* Local Variable Definitions ---                                       */

Define variable tmpcustid as character.
Define variable vTotal as decimal.
Define variable vOrderNum as integer.

Define variable vLineTotal as decimal.
Define variable vSubTotal as decimal.
Define variable vShipping as decimal.
Define variable vTax as decimal.
Define variable vOrderTotal as decimal.
Define variable vDiscount as decimal.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Web-Object

&Scoped-define WEB-FILE ordermsg.htm

/* Default preprocessor names. */
&Scoped-define FRAME-NAME Web-Frame
&Scoped-define QUERY-NAME Web-Query

/* Definitions for QUERY Web-Query                                      */
&Scoped-define SELF-NAME Web-Query

/* Standard List Definitions                                            */
&Scoped-Define DISPLAYED-FIELDS Customer.Address Customer.Address2 ~
Customer.Name Customer.Phone Customer.Terms 
&Scoped-Define DISPLAYED-OBJECTS CSZ CustID DataRows Discount Instructions ~
OrderDate OrderNum OrderTotal PO PromiseDate Retail SalesTax Shipping ~
ShippingMethod SubTotal Total 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */
&ANALYZE-RESUME



&ANALYZE-SUSPEND _FORM-BUFFER


/* Definitions of the field level widgets                               */
DEFINE VARIABLE CSZ AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 17 BY 1 NO-UNDO.

DEFINE VARIABLE CustID AS INTEGER FORMAT ">>>>9":U INITIAL 0 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE DataRows AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Discount AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Instructions AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 31 BY 3 NO-UNDO.

DEFINE VARIABLE OrderDate AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE OrderNum AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE OrderTotal AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE PO AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE PromiseDate AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Retail AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE SalesTax AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Shipping AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE ShippingMethod AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 23 BY 3 NO-UNDO.

DEFINE VARIABLE SubTotal AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Total AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME Web-Frame
     Customer.Address
          VIEW-AS FILL-IN
          SIZE 17 BY 1 SKIP
     Customer.Address2
          VIEW-AS FILL-IN
          SIZE 17 BY 1 SKIP
     CSZ SKIP
     CustID SKIP
     DataRows SKIP
     Discount SKIP
     Instructions SKIP
     Customer.Name
          VIEW-AS FILL-IN
          SIZE 17 BY 1 SKIP
     OrderDate SKIP
     OrderNum SKIP
     OrderTotal SKIP
     Customer.Phone
          VIEW-AS FILL-IN
          SIZE 17 BY 1 SKIP
     PO SKIP
     PromiseDate SKIP
     Retail SKIP
     SalesTax SKIP
     Shipping SKIP
     ShippingMethod SKIP
     SubTotal SKIP
     Customer.Terms
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     Total SKIP
    WITH NO-LABELS.

 

&ANALYZE-RESUME



/* *****************  Runtime Attributes and Settings  **************** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR FILL-IN Customer.Address IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Customer.Address2 IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN CSZ IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN CustID IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN DataRows IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Discount IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Instructions IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Customer.Name IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN OrderDate IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN OrderNum IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN OrderTotal IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Customer.Phone IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN PO IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN PromiseDate IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Retail IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN SalesTax IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Shipping IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN ShippingMethod IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN SubTotal IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Customer.Terms IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Total IN FRAME Web-Frame
   NO-ENABLE                                                            */

&ANALYZE-RESUME


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

&ANALYZE-SUSPEND _INCLUDED-LIBRARIES
/* ************************* Included-Libraries *********************** */

{src/web/method/html-map.i}
&ANALYZE-RESUME _END-INCLUDED-LIBRARIES

&ANALYZE-SUSPEND _CODE-BLOCK _CUSTOM "Main Code Block" 


/* *****************************  Main Code Block  ************************ */

/* 
 * Standard Main Code Block. This dispatches two events:
 *   'initialize'
 *   'process-web-request'
 * The bulk of the web processing is in the procedure 'process-web-request'
 * elsewhere in this WebObject.
 */
{src/web/template/hmapmain.i}
&ANALYZE-RESUME
/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE htm-offsets _WEB-HTM-OFFSETS
PROCEDURE htm-offsets :
/*------------------------------------------------------------------------------
  Purpose:     Runs procedure to associate each HTML field with its
               corresponding widget name and handle.
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/
  RUN web/support/rdoffr.p ("{&WEB-FILE}":U).
  RUN htm-associate IN THIS-PROCEDURE
    ("Address":U,"Customer.Address":U,Customer.Address:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Address2":U,"Customer.Address2":U,Customer.Address2:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CSZ":U,"CSZ":U,CSZ:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustID":U,"CustID":U,CustID:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustomerName":U,"Customer.Name":U,Customer.Name:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("DataRows":U,"DataRows":U,DataRows:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Discount":U,"Discount":U,Discount:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Instructions":U,"Instructions":U,Instructions:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("OrderDate":U,"OrderDate":U,OrderDate:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("OrderNum":U,"OrderNum":U,OrderNum:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("OrderTotal":U,"OrderTotal":U,OrderTotal:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Phone":U,"Customer.Phone":U,Customer.Phone:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("PO":U,"PO":U,PO:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("PromiseDate":U,"PromiseDate":U,PromiseDate:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Retail":U,"Retail":U,Retail:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("SalesTax":U,"SalesTax":U,SalesTax:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Shipping":U,"Shipping":U,Shipping:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("ShippingMethod":U,"ShippingMethod":U,ShippingMethod:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("SubTotal":U,"SubTotal":U,SubTotal:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Terms":U,"Customer.Terms":U,Customer.Terms:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Total":U,"Total":U,Total:HANDLE IN FRAME {&FRAME-NAME}).
END PROCEDURE.

&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE local-find-records 
PROCEDURE local-find-records :
/*------------------------------------------------------------------------------
  Purpose:     Override standard ADM method
  Notes:       

------------------------------------------------------------------------------*/
  Assign
    OrderDate = string(today)
    OrderNum  = pOrderNum.
   
  Find customer where customer.custnum = integer(tmpcustid) no-lock no-error.
  CustID       = customer.custnum.
  CSZ          = customer.city + ", " + customer.state + " " + customer.postalcode.
 
  FIND Order WHERE Order.ordernum = INTEGER(pOrderNum) NO-LOCK NO-ERROR.
 
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE output-header 
PROCEDURE output-header :
/*------------------------------------------------------------------------------
  Purpose:     Output the MIME header, and any "cookie" information needed 
               by this procedure.  
  Parameters:  <none>
  Notes:       In the event that this WebObject is State-Aware, this is also
               a good place to set the "Web-State" and "Web-Timeout" 
               attributes.              
------------------------------------------------------------------------------*/
  DEFINE VARIABLE rslt AS LOGICAL NO-UNDO.
  
  /* 
   * To make this a state-aware WebObject, pass in the procedure handle and 
   * timeout period (in minutes).  If you supply a timeout period greater than 
   * 0, the WebObject becomes state-aware and the following happens:
   *
   *   - 4GL variables web-state and web-timeout are set
   *   - a cookie is created for the broker to id the client on the return trip
   *   - a cookie is created to id the correct procedure on the return trip
   *
   * If you supply a timeout period less than 1, the following happens:
   *
   *   - 4GL variables web-state and web-timeout are set to an empty string
   *   - a cookie is killed for the broker to id the client on the return trip
   *   - a cookie is killed to id the correct procedure on the return trip
   *
   * Example: Timeout period of 5 minutes for this WebObject.
   *
   *   RUN set-web-state IN web-utilities-hdl (THIS-PROCEDURE, 5).
   *
  */
    
  /* 
   * Output additional cookie information here before running outputContentType.
   *      For more information about the Netscape Cookie Specification, see
   *      http://home.netscape.com/newsref/std/cookie_spec.html  
   *   
   *      Name         - name of the cookie
   *      Value        - value of the cookie
   *      Expires date - Date to expire (optional). See TODAY function.
   *      Expires time - Time to expire (optional). See TIME function.
   *      Path         - Override default URL path (optional)
   *      Domain       - Override default domain (optional)
   *      Secure       - "secure" or unknown (optional)
   * 
   *      The following example sets custnum=23 and expires tomorrow at (about) the 
   *      same time but only for secure (https) connections.
   *      
   *      RUN SetCookie IN web-utilities-hdl 
   *        ("custnum":U, "23":U, today + 1, time, ?, ?, "secure":U).
   */ 
   
  RUN outputContentType IN web-utilities-hdl ("text/html":U).
  
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE process-web-request 
PROCEDURE process-web-request :
/*------------------------------------------------------------------------------
  Purpose:     Process the web request.
  Notes:       
------------------------------------------------------------------------------*/
  
  /* Get the cookie holding the login id for the member */
  RUN GetCookie IN web-utilities-hdl
    (INPUT "SportProM",
     OUTPUT tmpCustID).    

  RUN output-header.
    
  /* Find the customer record and the default ship-to/bill-tos */    
  RUN dispatch IN THIS-PROCEDURE ('find-records':U).
    
  RUN dispatch IN THIS-PROCEDURE ('display-fields':U).    

  RUN dispatch IN THIS-PROCEDURE ('enable-fields':U).

  RUN dispatch IN THIS-PROCEDURE ('output-fields':U).

END PROCEDURE.
&ANALYZE-RESUME
/* ********************  Control Event Procedures  ********************* */

&SCOPED-DEFINE SELF-NAME DataRows
&ANALYZE-SUSPEND _CODE-BLOCK _CONTROL DataRows web.output 
PROCEDURE DataRows.output :
/*------------------------------------------------------------------------------
  Purpose:     Output the value of the field to the WEB stream
               in place of the HTML field definition.
  Parameters:  p-field-defn
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-field-defn AS CHARACTER NO-UNDO.
  vSubTotal = 0.
    
  DO WITH FRAME {&FRAME-NAME}:
    FOR EACH orderline OF Order NO-LOCK,
        FIRST Item OF orderline NO-LOCK:
      Assign
        vLineTotal = orderline.Qty * orderline.Price
        vSubTotal  = vSubTotal + vLineTotal.
      
      {&OUT}
      "<TD ALIGN='center'>"
      string(orderline.Qty)
      "</TD>"
      "<TD ALIGN='center'>"
      orderline.itemnum
      "</TD><TD>"
      Item.itemname
      "</TD><TD ALIGN='right'>"
      string(orderline.Price,">>>,>>9.99")
      "</TD><TD ALIGN='right'>"
      string(vLineTotal,">>>,>>9.99")
      "</TD><TD ALIGN='Center'>".
      
      
    If item.OnHand = 0 then
        {&OUT} "<IMG SRC='" RootURL "/samples/internet/check.gif'>".
      Else
        {&OUT} "<IMG SRC='" RootURL "/samples/internet/nocheck.gif'>".      
      
      {&OUT}        
      "</TD></TR>".
    End. /* For each */
    
    Assign
      vShipping               = vSubTotal * .10
      vTax                    = vSubTotal * .07
      vOrderTotal             = vSubTotal + vShipping + vTax
      SubTotal:screen-value   = string(vSubTotal,"$>>>,>>9.99")
      Shipping:screen-value   = string(vShipping,"$>>>,>>9.99")
      SalesTax:screen-value   = string(vTax,"$>>>,>>9.99")
      OrderTotal:screen-value = string(vOrderTotal,"$>>>,>>9.99")
      Retail:screen-value     = string(vOrderTotal,"$>>>,>>9.99")
      vDiscount               = vOrderTotal * (customer.discount / 100)
      Discount:screen-value   = string(vDiscount,"$>>>,>>9.99")
      Total:screen-value      = string(vOrderTotal - vDiscount,"$>>>,>>9.99")
      PromiseDate:screen-value    = STRING(Order.promisedate,"99/99/9999")
      ShippingMethod:screen-value = Order.Carrier
      PO:screen-value             = Order.PO
      Instructions:screen-value   = Order.Instructions.
      
  END.   /* Do with frame */    
END PROCEDURE.
&ANALYZE-RESUME


/* Setting information for Queries                                      */

&ANALYZE-SUSPEND _QUERY-BLOCK QUERY Web-Query
/* Query rebuild information for QUERY Web-Query
     _START_FREEFORM
     _END_FREEFORM
*/  /* QUERY Web-Query */
&ANALYZE-RESUME

 

