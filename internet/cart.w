&ANALYZE-SUSPEND _VERSION-NUMBER WDT_v2r12 Web-Object
/* Maps: samples/web/internet/cart.htm */
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

/* Local Variable Definitions ---                                       */

Define new shared temp-table ttItems
   FIELD ttLineNum   LIKE OrderLine.Linenum
   FIELD ttItemNum   LIKE item.itemnum
   FIELD ttItemName  LIKE item.itemname
   FIELD ttItemPrice LIKE item.price
   FIELD ttItemQty   AS   integer
   FIELD ttBackorder as logical.

 
Define variable vAddSelected as character.
Define variable vViewSelected as character.
Define variable vUpdateSelected as character.
Define variable vEmptySelected as character.
Define variable vOrderSelected as character.
Define variable vCompleteOrder as character.

Define variable TmpCustID as character.

Define variable vLineTotal as decimal.
Define variable vSubTotal as decimal.
Define variable vShipping as decimal.
Define variable vTax as decimal.
Define variable vTotal as decimal.

Define variable vOrderHdl as handle.
Define variable vCustHdl as handle.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&SCOPED-DEFINE PROCEDURE-TYPE Web-Object

&SCOPED-DEFINE WEB-FILE cart.htm

/* Default preprocessor names */
&SCOPED-DEFINE FRAME-NAME Web-Frame
&SCOPED-DEFINE QUERY-NAME Web-Query

/* Definitions for QUERY Web-Query                                      */
&SCOPED-DEFINE SELF-NAME Web-Query

/* Standard List Definitions                                            */
&SCOPED-DEFINE ENABLED-OBJECTS DataRows Message2 
&SCOPED-DEFINE DISPLAYED-OBJECTS DataRows Errors Message2 SalesTax Shipping ~
SubTotal Total 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */
&ANALYZE-RESUME



&ANALYZE-SUSPEND _FORM-BUFFER


/* Definitions of the field level widgets                               */
DEFINE VARIABLE DataRows AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Errors AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 19 BY 1 NO-UNDO.

DEFINE VARIABLE Message2 AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 11 BY 1 NO-UNDO.

DEFINE VARIABLE SalesTax AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Shipping AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE SubTotal AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE Total AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS FILL-IN
     SIZE 9 BY 1 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME Web-Frame
     DataRows SKIP
     Errors SKIP
     Message2 SKIP
     SalesTax SKIP
     Shipping SKIP
     SubTotal SKIP
     Total SKIP
    WITH NO-LABELS.

 

&ANALYZE-RESUME



/* *****************  Runtime Attributes and Settings  **************** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR FILL-IN Errors IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN SalesTax IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Shipping IN FRAME Web-Frame
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN SubTotal IN FRAME Web-Frame
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
 * elsewhere in this Web-Object.
 */
{src/web/template/hmapmain.i}

{src/samples/web/internet/function.i}
&ANALYZE-RESUME
/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE AddItem 
PROCEDURE AddItem :
/*------------------------------------------------------------------------------
  Purpose:     Add the Selected Item to the temp-table.
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  Define variable vItemNum as character.
  Define variable vLastLine as integer.
  vItemNum = get-field("vItemNum").
  If vItemNum = "" then
  Do:
    {&OUT} "No Item Selected.".
    Return error.    
  End.  
    
  Find item where item.itemnum = integer(vItemNum) no-lock.
  Find last ttItems no-error.
  If not available ttItems then
    vLastLine = 1.
  Else
    vLastLine = ttItems.ttLineNum + 1.

  Find ttItems where ttItems.ttItemNum = item.itemnum no-error.
  /* The user has added this one before */
  If not available ttItems then
  Do:
  Create ttItems.
  Assign
    ttLineNum   = vLastLine
    ttItemNum   = item.itemnum
    ttItemName  = item.itemname
    ttItemPrice = item.price
    ttItemQty   = 1.
  If Item.Onhand <= 0 then
    ttBackorder = yes.
  End.
  Else /* available */
  /* Simply increase the ordered qty for that item */
  Assign
      ttItemQty = ttItemQty + 1.    
  /*     
  Assign
    item.allocated = item.allocated + 1.
  */
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE EmptyCart 
PROCEDURE EmptyCart :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  Assign
    vLineTotal  = 0
    vSubTotal   = 0
    vShipping   = 0
    vTax        = 0
    vTotal      = 0.

  For each ttItems:
   Delete ttItems.
  end.
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE GetTotal 
PROCEDURE GetTotal :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  Define output parameter pTotal as character.
  
  pTotal = string(vtotal).
END PROCEDURE.
&ANALYZE-RESUME
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
    ("DataRows":U,"DataRows":U,DataRows:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Errors":U,"Errors":U,Errors:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Message":U,"Message2":U,Message2:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("SalesTax":U,"SalesTax":U,SalesTax:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Shipping":U,"Shipping":U,Shipping:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("SubTotal":U,"SubTotal":U,SubTotal:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("Total":U,"Total":U,Total:HANDLE IN FRAME {&FRAME-NAME}).
END PROCEDURE.

&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE output-header 
PROCEDURE output-header :
/*------------------------------------------------------------------------------
  Purpose:     Output the MIME header, and any "cookie" information needed 
               by this procedure.  
  Parameters:  <none>
  Notes:       In the event that this Web-Object is State-Aware, this is also
               a good place to set the "Web-State" and "Web-Timeout" 
               attributes.              
------------------------------------------------------------------------------*/
  DEFINE VARIABLE rslt AS LOGICAL NO-UNDO.
  
  /* 
   * To make this a state-aware Web-Object, pass in the procedure handle and 
   * timeout period (in minutes).  If you supply a timeout period greater than 
   * 0, the Web-Object becomes state-aware and the following happens:
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
   * Example: Timeout period of 5 minutes for this Web-Object.
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
   *      The following example sets cust-num=23 and expires tomorrow at (about) the 
   *      same time but only for secure (https) connections.
   *      
   *      RUN SetCookie IN web-utilities-hdl 
   *        ("cust-num":U, "23":U, today + 1, time, ?, ?, "secure":U).
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

  Errors:sensitive in frame web-frame = no.  
  Errors = "".
  
  If request_method = "POST" then
  Do:        
    /* CompleteOrder (Posted by Order.w)*/
    vCompleteOrder = QUERY_STRING.
   
    If vCompleteOrder = "CompleteOrder" then
    Do:      
      RUN set-web-state IN web-utilities-hdl
       (INPUT this-procedure,
        INPUT 0).   
      Run output-header.    
      Run process-web-request in vOrderHdl. 
      Return.
    End.
  End. /* POST by order.w for CompleteOrder*/ 
  
  /* Empty */
  vEmptySelected = get-field("Empty").
  If vEmptySelected <> "" then
  Do:
    RUN set-web-state IN web-utilities-hdl
      (INPUT this-procedure,
       INPUT 0).         
    Run output-header.    
    Run EmptyCart.
    Run ViewItems.
    Return. 
  End.  /* Empty: Clean Up totals, delete records, Clear state-aware, Get Out of Here! */
  
  RUN set-web-state IN web-utilities-hdl
    (INPUT this-procedure,
     INPUT 5).   
                    
  Run output-header.    

  /* Post: Add, Update, View */
  If request_method = "POST" then
  Do:        
    /* Add */
    vAddSelected = get-field("Add").
    If vAddSelected <> "" then
        Run AddItem.     

    /* Update */
    vUpdateSelected = get-field("Update").
    If vUpdateSelected <> "" then
    Do:
      Run UpdateItems.
    End.

    IF get-field("Purchase") ne "" AND get-field("CustSelected") ne "" THEN DO:
      Find first ttItems no-error.
      If available ttItems then /* Don't let them order an empty cart */
      Do:
        IF get-cookie("SportProM") eq "" THEN DO:
          If not valid-handle(vCustHdl) then
            Run samples/web/internet/custchk.w persistent set vCustHdl.
          Else
          Run process-web-request in vCustHdl.
        END. 
        ELSE DO:
          REQUEST_METHOD = "GET".
          If not valid-handle(vOrderHdl) then
            Run samples/web/internet/order.w persistent set vOrderHdl (input this-procedure).
          Else
            Run process-web-request in vOrderHdl.
        END.
      End.
      Else
      Do:  
        Errors = "You have nothing in your cart.".      
        Run ViewItems.
      End.
    END.    
    ELSE 
      /* View */
      Run ViewItems.

  End. 
  /* Get: Order/Purchase, View */
  Else 
  Do:
    vViewSelected = get-field("View").
    If vViewSelected <> "" then
    Do:       
      Run ViewItems.
      Return.
    End.
    
    vOrderSelected = get-field("Purchase").
    If vOrderSelected <> "" then  
    Do:
      Find first ttItems no-error.
      If available ttItems then /* Don't let them order an empty cart */
      Do:
        IF get-cookie("SportProM") eq "" THEN DO:
          If not valid-handle(vCustHdl) then
            Run samples/web/internet/custchk.w persistent set vCustHdl.
          Else
            Run process-web-request in vCustHdl.
        END. 
        ELSE DO:
          REQUEST_METHOD = "GET".
          If not valid-handle(vOrderHdl) then
            Run samples/web/internet/order.w persistent set vOrderHdl (input this-procedure).
          Else
            Run process-web-request in vOrderHdl.
        END.
      End.
      Else
      Do:  
        Errors = "You have nothing in your cart.".      
        Run ViewItems.
      End.
    End.
    
  End.  /* Else - Get Processing */
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE UpdateItems 
PROCEDURE UpdateItems :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  Define variable tmpQty as character.
  For each ttItems:
    tmpQty = get-field("Qty_" + string(ttItems.ttItemNum)).
    Run IsNumeric(tmpQty).
    If return-value = "Error" then
    Do:      
      Errors = "You did not enter all numeric quantities.".
      Return.
    End.
    /* 0 means delete */
    If integer(tmpQty) > 0 then
    Do:
      Find item where item.itemnum = ttItems.ttItemnum no-lock. 
      Assign
        /* item.allocated = item.allocated + (integer(tmpQty) - ttItems.ttItemQty) */
        ttItems.ttItemQty = integer(tmpQty).
      
    End.
    Else
      Delete ttItems.
  End.
END PROCEDURE.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE ViewItems 
PROCEDURE ViewItems :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    RUN dispatch IN THIS-PROCEDURE ('display-fields':U).    
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
    For each ttItems by ttItems.ttLineNum:
      Assign
        vLineTotal = ttItems.ttItemQty * ttItems.ttItemPrice
        vSubTotal  = vSubTotal + vLineTotal.
      
      {&OUT}
      "<TD>"
      "<INPUT TYPE='text' NAME='"
      "Qty_" ttItems.ttItemNum
      "' VALUE='"
      string(ttItems.ttItemQty)
      "' SIZE=3  "
      "onChange='return selectItemNotValid(document.Cart_form.Qty_" ttItems.ttItemNum ")'"
      "></TD>"
      "<TD ALIGN='center'>"
      ttItems.ttItemNum
      "</TD><TD>"
      ttItems.ttItemName
      "</TD><TD ALIGN='right'>"
      string(ttItems.ttItemPrice,">>>,>>9.99")
      "</TD><TD ALIGN='right'>"
      string(vLineTotal,">>>,>>9.99")
      "</TD><TD ALIGN='Center'>".
      
      
      If ttItems.ttBackorder then
        {&OUT} "<IMG SRC='" RootURL "/samples/internet/check.gif'>".
      Else
        {&OUT} "<IMG SRC='" RootURL "/samples/internet/nocheck.gif'>".      
      
      {&OUT}        
      "</TD></TR>".
    End. /* For each */
    
    Assign
      vShipping = vSubTotal * .10
      vTax      = vSubTotal * .07
      vTotal    = vSubTotal + vShipping + vTax
      SubTotal:screen-value = string(vSubTotal,"$>>>,>>9.99")
      Shipping:screen-value = string(vShipping,"$>>>,>>9.99")
      SalesTax:screen-value = string(vTax,"$>>>,>>9.99")
      Total:screen-value    = string(vTotal,"$>>>,>>9.99").
      
      
  END.   /* Do with frame */    
END PROCEDURE.
&ANALYZE-RESUME

&SCOPED-DEFINE SELF-NAME Message2
&ANALYZE-SUSPEND _CODE-BLOCK _CONTROL Message2 web.output 
PROCEDURE Message2.output :
/*------------------------------------------------------------------------------
  Purpose:     Output the value of the field to the WEB stream
               in place of the HTML field definition.
  Parameters:  p-field-defn
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-field-defn AS CHARACTER NO-UNDO.
  
  DO WITH FRAME {&FRAME-NAME}:
   {&OUT} p-field-defn.
  END.
  
END PROCEDURE.
&ANALYZE-RESUME


/* Setting information for Queries                                      */

&ANALYZE-SUSPEND _QUERY-BLOCK QUERY Web-Query
/* Query rebuild information for QUERY Web-Query
     _START_FREEFORM
     _END_FREEFORM
*/  /* QUERY Web-Query */
&ANALYZE-RESUME
 
