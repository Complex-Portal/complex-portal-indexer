<!--
  - Author: Sugath Mudali (smudali@ebi.ac.uk)
  - Version: $Id$
  - Copyright (c) 2002-2003 The European Bioinformatics Institute, and others.
  - All rights reserved. Please see the file LICENSE in the root directory of
  - this distribution.
  -->

<%--
  - Displays an error message stored in the struts framework.
  --%>

<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean"  prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<h1><font color="red">Validation Error</font></h1>
You must correct the following error(s) before proceeding:
<logic:messagesPresent>
    <ul>
         <html:messages id="error">
            <%-- If the filter is false, it prevent bean:write to convert HTML to text --%>
            <li><bean:write name="error" filter="false" /></li>
         </html:messages>
    </ul>
</logic:messagesPresent>
</hr>