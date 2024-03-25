&ANALYZE-SUSPEND _VERSION-NUMBER WDT_v2r1 Web-Object
/* Maps: samples/web/internet/detail.htm */
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
/*              This .W file was created with WebSpeed.                 */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

Define variable tmpCustID as character.
DEF VAR vUpdate AS CHAR.
DEF VAR vCustNum AS CHAR.
DEF VAR CreatingCustomer AS LOGICAL.
&ANALYZE-RESUME
&ANALYZE-SUSPEND _PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Web-Object

&Scoped-define WEB-FILE detail.htm

/* Default preprocessor names. */
&Scoped-define FRAME-NAME Web-Frame
&Scoped-define QUERY-NAME Web-Query

/* Definitions for QUERY Web-Query                                      */
&Scoped-define SELF-NAME Web-Query
&Scoped-define OPEN-QUERY-Web-Query OPEN QUERY Web-Query FOR EACH Customer       WHERE Customer.custnum = integer(tmpCustID) NO-LOCK.
&Scoped-define TABLES-IN-QUERY-Web-Query Customer
&Scoped-define FIRST-TABLE-IN-QUERY-Web-Query Customer


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Customer.Address Customer.City Customer.Name ~
Customer.Phone Customer.PostalCode Customer.State 
&Scoped-define ENABLED-TABLES Customer
&Scoped-define FIRST-ENABLED-TABLE Customer
&Scoped-Define ENABLED-OBJECTS CheckOut CustNum SubmitField UpdateOK 
&Scoped-Define DISPLAYED-FIELDS Customer.Address Customer.City ~
Customer.custnum Customer.Name Customer.Phone Customer.PostalCode ~
Customer.State 
&Scoped-Define DISPLAYED-OBJECTS CheckOut CustNum SubmitField UpdateOK 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */
&ANALYZE-RESUME



&ANALYZE-SUSPEND _FORM-BUFFER


/* Definitions of the field level widgets                               */
DEFINE VARIABLE CheckOut AS CHARACTER FORMAT "x(256)":U 
     VIEW-AS FILL-IN
     SIZE 17 BY 1 NO-UNDO.

DEFINE VARIABLE CustNum AS CHARACTER FORMAT "x(256)":U 
     VIEW-AS FILL-IN
     SIZE 17 BY 1 NO-UNDO.

DEFINE VARIABLE SubmitField AS CHARACTER FORMAT "x(256)":U 
     VIEW-AS FILL-IN
     SIZE 17 BY 1 NO-UNDO.

DEFINE VARIABLE UpdateOK AS CHARACTER FORMAT "x(256)":U 
     VIEW-AS FILL-IN
     SIZE 17 BY 1 NO-UNDO.

/* Query definitions                                                    */
DEFINE QUERY Web-Query FOR 
      Customer SCROLLING.

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME Web-Frame
     Customer.Address
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     CheckOut SKIP
     Customer.City
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     Customer.CustNum
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     CustNum SKIP
     Customer.Name
          VIEW-AS FILL-IN
          SIZE 20 BY 1 SKIP
     Customer.Phone
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     Customer.postalcode HELP
          "Please enter the appropriate Postal Code."
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     Customer.State HELP
          "Enter standard state abbreviation"
          VIEW-AS FILL-IN
          SIZE 9 BY 1 SKIP
     SubmitField SKIP
     UpdateOK SKIP
    WITH NO-LABELS.

 

&ANALYZE-RESUME



/* *****************  Runtime Attributes and Settings  **************** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR FILL-IN Customer.CustNum IN FRAME Web-Frame
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
ASSIGN vUpdate = "  ".

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
    ("CheckOut":U,"CheckOut":U,CheckOut:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustAddress":U,"Customer.Address":U,Customer.Address:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustCity":U,"Customer.City":U,Customer.City:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustName":U,"Customer.Name":U,Customer.Name:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustNum":U,"CustNum":U,CustNum:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustomerNum":U,"Customer.custnum":U,Customer.custnum:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustPhone":U,"Customer.Phone":U,Customer.Phone:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustState":U,"Customer.State":U,Customer.State:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("CustZipCode":U,"Customer.postalcode":U,Customer.postalcode:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("SubmitField":U,"SubmitField":U,SubmitField:HANDLE IN FRAME {&FRAME-NAME}).
  RUN htm-associate IN THIS-PROCEDURE
    ("UpdateOK":U,"UpdateOK":U,UpdateOK:HANDLE IN FRAME {&FRAME-NAME}).
END PROCEDURE.

&ANALYZE-RESUME
&ANALYZE-SUSPEND _CODE-BLOCK _PROCEDURE local-find-records 
PROCEDURE local-find-records :
/*------------------------------------------------------------------------------
  Purpose:     Override standard ADM method
  Notes:       
------------------------------------------------------------------------------*/

  /* Code placed here will execute PRIOR to standard behavior. */

  /* Dispatch standard ADM method.                             */  
   
  IF REQUEST_METHOD = "POST" then
  Do:
    RUN dispatch IN THIS-PROCEDURE ( INPUT 'find-records':U ) . 
    Get current web-query exclusive-lock.
  End.
  Else
    RUN dispatch IN THIS-PROCEDURE ( INPUT 'find-records':U ) . 
  
   /* Code placed here will execute AFTER standard behavior.    */

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
     
  IF get-field("CustChk") ne "":U THEN DO:
    tmpCustID = get-field("Customer.custnum").
    IF tmpCustID = "" THEN DO:
      CREATE Customer.
      tmpCustID = STRING(Customer.custnum).
      CreatingCustomer = TRUE.
    END.
    ELSE 
      FIND Customer WHERE Customer.custnum = INTEGER(tmpCustID) NO-LOCK NO-ERROR.
    IF AVAILABLE Customer THEN DO:
      RUN SetCookie IN web-utilities-hdl
        (INPUT "SportProM",
         INPUT tmpCustID,
         INPUT today + 10,
         INPUT ?,
         INPUT "",
         INPUT "",
         INPUT "").
      REQUEST_METHOD = "GET".
    END.
    ELSE DO:
      RUN output-header.     
      {&OUT}
        '<script language="JavaScript">~n'
        'window.alert("Customer not found.")~n'
        'window.open("custchk.html","_self","")~n'
        '</script>~n'.
      RETURN.
    END.
  END.

  RUN output-header.     

  IF REQUEST_METHOD = "POST" THEN DO:

    tmpCustID = get-field("CustNum").

    /* STEP 1 -
     * Copy HTML input field values to the Progress screen buffer. */
    RUN dispatch IN THIS-PROCEDURE ('input-fields':U).
    
    /* STEP 2 -
     * If there are DATABASE fields, find the relevant record that needs to
     * be assigned. Define the QUERY "web-query" to do this for you. */
    RUN dispatch IN THIS-PROCEDURE ('find-records':U).

    /* STEP 3 -
     * Assign all the fields that need to be assigned. This is assumed
     * to be the list of fields and objects that are enabled.*/
    RUN dispatch IN THIS-PROCEDURE ('assign-fields':U).
    
    /* STEP 4 -
     * Decide what HTML to return to the user. This will either be 
     * an OK message, or you may decide to return the original form. */
    
    ASSIGN 
      vUpdate = "Update Complete"
      vCustNum = STRING(Customer.custnum).
    RUN dispatch IN THIS-PROCEDURE ('display-fields':U).    
    /* STEP 4b -
     * Enable objects that should be enabled. */
    RUN dispatch IN THIS-PROCEDURE ('enable-fields':U).
    /* STEP 4c -
     * OUTPUT the Progress screen buffer to the WEB stream. */
    RUN dispatch IN THIS-PROCEDURE ('output-fields':U).
  END. /* Form has been submitted. */
 
  /* REQUEST-METHOD = GET */ 

  ELSE DO:

    /* STEP 1-
     * If there are DATABASE fields, find the relevant record that needs to
     * be assigned. Define the QUERY "web-query" to do this for you. */
    RUN dispatch IN THIS-PROCEDURE ('find-records':U).
    
    /* Return the form again. Set data values, display them, and output them
     * to the WEB stream.  
     *
     * STEP 2a -
     * Set any values that need to be set, then display them. */
    RUN dispatch IN THIS-PROCEDURE ('display-fields':U).    

    /* STEP 2b -
     * Enable objects that should be enabled. */
    RUN dispatch IN THIS-PROCEDURE ('enable-fields':U).
 
    vCustNum = STRING(Customer.custnum).
 
    /* STEP 2c -
     * OUTPUT the Progress screen buffer to the WEB stream. */
    RUN dispatch IN THIS-PROCEDURE ('output-fields':U).

  END.
  

END PROCEDURE.
&ANALYZE-RESUME
/* ********************  Control Event Procedures  ********************* */

&SCOPED-DEFINE SELF-NAME CheckOut
&ANALYZE-SUSPEND _CODE-BLOCK _CONTROL CheckOut web.output 
PROCEDURE CheckOut.output :
/*------------------------------------------------------------------------------
  Purpose:     Output the value of the field to the WEB stream
               in place of the HTML field definition.
  Parameters:  p-field-defn
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-field-defn AS CHARACTER NO-UNDO.
 
  IF NOT CreatingCustomer AND Customer.Name ne "" THEN DO: 
    DO WITH FRAME {&FRAME-NAME}:
      {&OUT}
          '<a href="cart.w?Purchase=Yes"><img src="' RootURL '/samples/internet/checkout.gif" border="0">'
      {&END}
    END.
  END.
  
END PROCEDURE.
&ANALYZE-RESUME

&SCOPED-DEFINE SELF-NAME CustNum
&ANALYZE-SUSPEND _CODE-BLOCK _CONTROL CustNum web.output 
PROCEDURE CustNum.output :
/*------------------------------------------------------------------------------
  Purpose:     Output the value of the field to the WEB stream
               in place of the HTML field definition.
  Parameters:  p-field-defn
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-field-defn AS CHARACTER NO-UNDO.
  
  DO WITH FRAME {&FRAME-NAME}:
    {&OUT}
        '<input type="hidden" name="CustNum" value="' + vCustNum '">~n'
    {&END}
  END.
  
END PROCEDURE.
&ANALYZE-RESUME

&SCOPED-DEFINE SELF-NAME UpdateOK
&ANALYZE-SUSPEND _CODE-BLOCK _CONTROL UpdateOK web.output 
PROCEDURE UpdateOK.output :
/*------------------------------------------------------------------------------
  Purpose:     Output the value of the field to the WEB stream
               in place of the HTML field definition.
  Parameters:  p-field-defn
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-field-defn AS CHARACTER NO-UNDO.
  
  DO WITH FRAME {&FRAME-NAME}:
    {&OUT}
        vUpdate
    {&END}
  END.
  
END PROCEDURE.
&ANALYZE-RESUME


/* Setting information for Queries                                      */

&ANALYZE-SUSPEND _QUERY-BLOCK QUERY Web-Query
/* Query rebuild information for QUERY Web-Query
     _START_FREEFORM
EACH Customer
      WHERE Customer.custnum = integer(tmpCustID) NO-LOCK
     _END_FREEFORM
*/  /* QUERY Web-Query */
&ANALYZE-RESUME

 

