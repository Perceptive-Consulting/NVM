 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
 <script src="<%=request.getContextPath()%>/resource/perpetual/pmc/property/adpl2Form.js"></script>
 
<style>
	.img1{
		cursor: pointer;
	}
	#imageGalary > li {
		width: 125px!important;
	}
	.cmnt-class{
		font-weight: normal;
	}
</style>
<div class="container-ar">
  <section class="contant-area">  
  <div class="button"><button id="propertyBackId" style="display: none;">Back</button></div>  
    <ul id="accordion">
	<li id="pageOne">HMO Licence And Certification <span>View</span></li>
    <ul><div class="rg-p innew" >
    <div class="clearfix"></div>
    <br />
      <tr><td colspan="3"><h2>HMO License </h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%"><span>
				Is the property Licensable HMO ?
				NB: A licensable HMO is a property that is three or more stories high and has five or more people living in it, in more than one household and sharing amenities such as bathrooms, toilets and cooking facilities</span>
            <div class="clear"></div>
             License Number : <p><span class="" id="HMOLicenceNumberID"></span></p>
              <div class="clear"></div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="hmoLicence" class="">Not Set</td>
          </tr>
          <tr><td colspan="3" class="no-bg"></td></tr>
          <tr><td colspan="3"><h2>Certification </h2></td></tr>
          <tr>
            <td width="80%"><span>
			A satisfactory periodic inspection report for fixed electrical installation in the property from a recognised inspection body.</span>
              <div class="clear"></div>
               <p id="electricalInstallationComments"></p>
              <div class="rcm" id="electricalInstallationFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="electricalInstallationFileName"></span>
             		 <a class="FileView" id="electricalInstallationFileView" href="" title="Electrical Installation Certification" style="display: none;">View</a>
             	 	 <a id="electricalInstallationFileDownload" href="${contextPath}/download/certificates.htm?param=electricalInstallation" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="electricalInstallation">Not Set</td>
          </tr>
           <tr>
            <td width="80%"><span>
			A satisfactory Electrical Test Certificate, obtained in the last five years for the fire alarm system (HMO / Bedsit only) from a recognised inspection body (i.e. NICEIC, ECA etc.)</span>
              <div class="clear"></div>
               <p id="electricalTestComments"></p>
               <div class="rcm" id="electricalTestFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="electricalTestFileName"></span>
             		 <a class="FileView" id="electricalTestFileView" href="" title="Electrical Test Certification" style="display: none;">View</a>
             	 	 <a id="electricalTestFileDownload" href="${contextPath}/download/certificates.htm?param=electricalTest" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="electricalTest">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>
			A satisfactory gas safety certificate- a new one will be required every year. And will be paid for by the landlord.
			</span>
              <div class="clear"></div>
              <p id="gasCertificateComments"></p>
               <div class="rcm" id="gasCertificateFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="gasCertificateFileName"></span>
             		 <a class="FileView" id="gasCertificateFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="gasCertificateFileDownload" href="${contextPath}/download/certificates.htm?param=gasCertificate" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="gasCertificate" >Not Set</td>
          </tr>
          <tr>
            <td width="80%">
            <span>
				A satisfactory Energy Performance Certificate (EPC band A - High D all other bands will need to be updated by 2018 or your property may be deemed as been uninhabitable thus been in breach of contract) for more information see website for details.
			</span>
              <div class="clear"></div>
              <p id="energyPerformanceComments"></p>
             <div class="rcm" id="energyPerformanceFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="energyPerformanceFileName"></span>
             		 <a class="FileView" id="energyPerformanceFileView" href="" title="Energy Performance Certification" style="display: none;">View</a>
             	 	 <a id="energyPerformanceFileDownload" href="${contextPath}/download/certificates.htm?param=energyPerformance" target="_blank" >Download</a> 
              </div>
             </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="energyPerformance">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>
			A satisfactory service contract for the central heating system (optional)
			</span>
              <div class="clear"></div>
               <p id="centralHeatingSystemComments"></p>
              <div class="rcm" id="centralHeatingSystemFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="centralHeatingSystemFileName"></span>
             		 <a class="FileView" id="centralHeatingSystemFileView" href="" title="Central Heating Certification" style="display: none;">View</a>
             	 	 <a id="centralHeatingSystemFileDownload" href="${contextPath}/download/certificates.htm?param=centralHeatingSystem" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="centralHeatingSystem" >Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>
				A satisfactory Insurance Certificate / policy document for your building insurance (needed) </span>
              <div class="clear"></div>
               <p id="buildingInsuranceComments"></p>
              <div class="rcm" id="buildingInsuranceFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="buildingInsuranceFileName"></span>
             		 <a class="FileView" id="buildingInsuranceFileView" href="" title="Building Insaurance Certification" style="display: none;">View</a>
             	 	 <a id="buildingInsuranceFileDownload" href="${contextPath}/download/certificates.htm?param=buildingInsurance" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="buildingInsurance">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>
				Asbestos survey and any removal works </span>
              <div class="clear"></div>
               <p id="asbestosSurveyComments"></p>
              <div class="rcm" id="asbestosSurveyFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="asbestosSurveyFileName"></span>
             		 <a class="FileView" id="asbestosSurveyFileView" href="" title="Asbestos Survey" style="display: none;">View</a>
             	 	 <a id="asbestosSurveyFileDownload" href="${contextPath}/download/certificates.htm?param=asbestosSurvey" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="asbestosSurvey">Not Set</td>
          </tr>
           <tr>
            <td width="80%"><span>
				Periodic inspection of the water system, for example Legionella and any remedial works required to maintain a safe water supply </span>
              <div class="clear"></div>
               <p id="periodicInspectionOfWaterSupplyComments"></p>
              <div class="rcm" id="periodicInspectionOfWaterSupplyFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="periodicInspectionOfWaterSupplyFileName"></span>
             		 <a class="FileView" id="periodicInspectionOfWaterSupplyFileView" href="" title="Periodic Inspection Of Water Supply" style="display: none;">View</a>
             	 	 <a id="periodicInspectionOfWaterSupplyFileDownload" href="${contextPath}/download/certificates.htm?param=periodicInspectionOfWaterSupply" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="periodicInspectionOfWaterSupply">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				We need 3  sets of keys as NACRO will retain a set and so will Ashantidutch Property Letting and a key will be passed to the tenant. At the end of the scheme all  keys will be returned. </span>
              <div class="clear"></div>
               <p id="keySetComments"></p>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="keySet">Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span>
			        Please upload a copy of your land title registry document. The cost to property owners in 2014 was £3.00 you should have a copy or your solicitor should have a copy as part of the purchase process.
                    <a style="background: none!important; color: blue!important;" target="_blank" href="https://eservices.landregistry.gov.uk/www/wps/portal/!ut/p/b1/04_SjzS0tDQwMTIxMjLXj9CPykssy0xPLMnMz0vMAfGjzOKNjSxMDA1NjDwsjM3MDTxN3dyNDUNMjQ1MjPWDU_P0c6McFQH3SLFU/">https://eservices.landregistry.gov.uk/www/wps/portal/!ut/p/b1/04_SjzS0tDQwMTIxMjLXj9CPykssy0xPLMnMz0vMAfGjzOKNjSxMDA1NjDwsjM3MDTxN3dyNDUNMjQ1MjPWDU_P0c6McFQH3SLFU/</a> </label>
			</span>
              <div class="clear"></div>
              <p id="landTitleRegisteryDocumentComments"></p>
               <div class="rcm" id="landTitleRegisteryDocumentFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="landTitleRegisteryDocumentFileName"></span>
             		 <a class="FileView" id="landTitleRegisteryDocumentFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="landTitleRegisteryDocumentFileDownload" href="${contextPath}/download/certificates.htm?param=landTitleRegisteryDocument" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="landTitleRegisteryDocument" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Inventory for the property.			       
			</span>
              <div class="clear"></div>
              <p id="inventoryForPropertyComments"></p>
               <div class="rcm" id="inventoryForPropertyFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="inventoryForPropertyFileName"></span>
             		 <a class="FileView" id="inventoryForPropertyFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="inventoryForPropertyFileDownload" href="${contextPath}/download/certificates.htm?param=inventoryForProperty" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="inventoryForProperty" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Landlords insurance for content.		       
			</span>
              <div class="clear"></div>
              <p id="landlordInsauranceForContentComments"></p>
               <div class="rcm" id="landlordInsauranceForContentFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="landlordInsauranceForContentFileName"></span>
             		 <a class="FileView" id="landlordInsauranceForContentFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="landlordInsauranceForContentFileDownload" href="${contextPath}/download/certificates.htm?param=landlordInsauranceForContent" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="landlordInsauranceForContent" >Not Set</td>
          </tr>
          <tr>
            <td >
                 	<div style="font-size: 25px!important; font-weight: bold; ">Do You have warranties or manuals for the following :</div>
             </td>
          </tr>
          
          <tr><td colspan="3"><h2>User Manuals for the following : </h2></td></tr>
          <tr>
				<td>
					<div style="font-size: 25px !important; font-weight: bold;">Do
						You have warranties or manuals for the following :</div>
				</td>
			</tr>
          <tr>
            <td width="80%"><span>
				A Warrantee for the windows and doors.		       
			</span>
              <div class="clear"></div>
              <p id="windowAndDoorWarranteeComments"></p>
               <div class="rcm" id="windowAndDoorWarranteeFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="windowAndDoorWarranteeFileName"></span>
             		 <a class="FileView" id="windowAndDoorWarranteeFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="windowAndDoorWarranteeFileDownload" href="${contextPath}/download/certificates.htm?param=windowAndDoorWarrantee" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="windowAndDoorWarrantee" >Not Set</td>
      		</tr>
			<tr>
            <td width="80%"><span>
				The Damp poof course certificate.		       
			</span>
              <div class="clear"></div>
              <p id="dampPoofcourseComments"></p>
               <div class="rcm" id="dampPoofcourseFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="dampPoofcourseFileName"></span>
             		 <a class="FileView" id="dampPoofcourseFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="dampPoofcourseFileDownload" href="${contextPath}/download/certificates.htm?param=dampPoofcourse" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="dampPoofcourse" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Fitted Hob and oven to the Kitchen.	       
			</span>
              <div class="clear"></div>
              <p id="fittedHobAndOvenComments"></p>
               <div class="rcm" id="fittedHobAndOvenFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="fittedHobAndOvenFileName"></span>
             		 <a class="FileView" id="fittedHobAndOvenFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="fittedHobAndOvenFileDownload" href="${contextPath}/download/certificates.htm?param=fittedHobAndOven" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="fittedHobAndOven" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Electric shower        
			</span>
              <div class="clear"></div>
              <p id="electricShowerComments"></p>
               <div class="rcm" id="electricShowerFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="electricShowerFileName"></span>
             		 <a class="FileView" id="electricShowerFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="electricShowerFileDownload" href="${contextPath}/download/certificates.htm?param=electricShower" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="electricShower" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Electric Fires      
			</span>
              <div class="clear"></div>
              <p id="electricFiresComments"></p>
               <div class="rcm" id="electricFiresFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="electricFiresFileName"></span>
             		 <a class="FileView" id="electricFiresFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="electricFiresFileDownload" href="${contextPath}/download/certificates.htm?param=electricFires" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="electricFires" >Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>
				The central heating ? 
			</span>
              <div class="clear"></div>
              <p id="manualForCentralHeatingComments"></p>
               <div class="rcm" id="manualForCentralHeatingFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="manualForCentralHeatingFileName"></span>
             		 <a class="FileView" id="manualForCentralHeatingFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="manualForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=manualForCentralHeating" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="manualForCentralHeating" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Wall fixed timer for the central heating ? 
			</span>
              <div class="clear"></div>
              <p id="timerForCentralHeatingComments"></p>
               <div class="rcm" id="timerForCentralHeatingFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="timerForCentralHeatingFileName"></span>
             		 <a class="FileView" id="timerForCentralHeatingFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="timerForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=timerForCentralHeating" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="timerForCentralHeating" >Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
				Service manual for the boiler.
			</span>
              <div class="clear"></div>
              <p id="manualForBoilerComments"></p>
                <div class="rcm" id="manualForBoilerFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="manualForBoilerFileName"></span>
             		 <a class="FileView" id="manualForBoilerFileView" href="" title="Boiler Manual" style="display: none;">View</a>
             	 	 <a id="manualForBoilerFileDownload" href="${contextPath}/download/certificates.htm?param=manualForBoiler" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="manualForBoiler" >Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span>
				Service manual for fitted hob or oven.
			</span>
              <div class="clear"></div>
              <p id="manualForFittedOvenComments"></p>
               <div class="rcm" id="manualForFittedOvenFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="manualForFittedOvenFileName"></span>
             		 <a class="FileView" id="manualForFittedOvenFileView" href="" title="Gas Certificate" style="display: none;">View</a>
             	 	 <a id="manualForFittedOvenFileDownload" href="${contextPath}/download/certificates.htm?param=manualForFittedOven" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="manualForFittedOven" >Not Set</td>
          </tr>
          <tr><td colspan="3" class="no-bg">&nbsp;</td></tr>
          
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    <li id="pageTwo">Criteria A : Hydrothermal condition <span>View</span></li>
    <ul><div class="rg-p innew">
    <p><strong>Criteria A.</strong> Free from ALL 'Category 1 Hazards' as set out In the Governments Housing Health and Safety Rating System (HHSRS)</p>
            <p>Local authorities are under a duty to take action in the case of category 1 hazards.
             If necessary (or if the owner/manager or tenant requests) the local authority may carry out any necessary
             remedial work themselves and reclaim the costs.
              They also have powers to take action in the case of all category 2 hazards (i.e. those which carry lower risks)</p>
    <div class="clearfix"></div>
    <br />
      <tr><td colspan="3"><h2>Is the Property </h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        
          <tr>
            <td width="80%"><span>Structurally Stable</span>
              <div class="clear"></div>
              Comments : <p id="structurallyStableComments">Structurally stable comments</p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="structurallyStable">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Free from Serious Disrepair?</span>
              <div class="clear"></div>
              Comments : <p id="freeFromSeriousDisRepairComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="freeFromSeriousDisRepair">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Free from dampness or mould growth?</span>
              <div class="clear"></div>
             Comments : <p id="freeFromDampnessComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="freeFromDampness">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Loft insulation of minimum thickness 270mm</span>
              <div class="clear"></div>
              Comments : <p id="insulation270mmComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="insulation270mm">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>When the insulation was laid/installed ?</span>
              <div class="clear"></div>
              <td width="1%"><strong>:</strong></td>
            <td width="19%" id="installationDateComments">Not Set</td>
          </tr>
          
          <tr><td colspan="3" class="no-bg">&nbsp;</td></tr>
          
          <tr><td colspan="3"><h2>Does the property have </h2></td></tr>
          
          <tr>
            <td width="80%"><span>Adequate heating?</span>
              <div class="clear"></div>
              Please indicate GCH, other :  <p id="adequateHeatingComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateHeating">Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span>How old the boiler is ?</span>
              <div class="clear"></div>
            <td width="1%"><strong>:</strong></td>
            <td width="19%"><mytag id="boilerAgeComments"></mytag>&nbsp; Years</td> 
          </tr>
          
          <tr><td colspan="3"><h2>Is the property free From</h2></td></tr>
          
          <tr>
            <td width="80%"><span>Pollutants such as Asbestos, MMF fibres Carbon monoxide (and fuel combustion Products), Biocides, Volatile organic compounds found in paints, radiation & lead?</span>
              <div class="clear"></div>
			Comments :  <p id="pollutantsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="pollutants">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>
	                     The main source of harmful radiation in dwellings is from radon gas. Radon is colourless and odourless, and it is not possible to detect it, either in the air or the water, without testing and measurement. But it is airborne radon that poses a more significant threat. Click here to see if your property is in a high concentration area. Radon areas in England and Wales.
						 Radon map link <a target="_blank" href="http://www.ukradon.org/information/ukmaps/englandwalesh">http://www.ukradon.org/information/ukmaps/englandwalesh</a></p>
						 If after looking at the above Radon map and you identify that your property needs a risk report you can order one from this link for £3.90, this price was correct at the date of publication 3rd October 2014.
            </span>
              <div class="clear"></div>
            <td width="1%"><strong></strong></td>
          </tr>
          
          <tr>
            <td width="80%"><span>Does your property need a Radon risk Report?</span>
              <div class="clear"></div>
			Comments :  <p id="needRadonRiskReportComments"></p>
			<div class="rcm" id="needRadonRiskReportFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="needRadonRiskReportFileName"></span>
             		 <a class="FileView" id="needRadonRiskReportFileView" href="" title="Boiler Manual" style="display: none;">View</a>
             	 	 <a id="needRadonRiskReportFileDownload" href="${contextPath}/download/certificates.htm?param=needRadonRiskReport" target="_blank" >Download</a> 
              </div>
			
			</td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="needRadonRiskReport">Not Set</td>
          </tr>
          <tr><td colspan="3"><h2>Property Standards </h2></td></tr>
          <tr>
            <td width="80%"><span>Does the property meet all standards as laid as laid down under section A of the property standards guidance note?</span>
              <div class="clear"></div>
              Comments : <p id="propertyMeetStandardsComments"></p>
              <div id="propertyMeetStandardsDiv" style="display:none;"><a id="propertyMeetStandardsView" href="javascript:viewFile('propertyMeetStandards');">View</a><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a id="propertyMeetStandardsDownload" href="download.htm?param=propertyMeetStandards">Download</a></div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="propertyMeetStandards">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Do you intend to upgrade the property to meet our specification and Decent Home Standard?</span>
              <div class="clear"></div>
            Comments : <p id="upgradePropertyComments"></p>
			<div id="upgradePropertyDiv" style="display: none;"><a id="upgradePropertyView" href="javascript:viewFile('upgradeProperty');">View</a><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a id="upgradePropertyDownload" href="download.htm?param=upgradeProperty">Download</a></div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="upgradeProperty">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>When will this work be completed by?</span>
              <div class="clear"></div>
              <p id=""></p>
              <div id="inputFieldDiv" style="display: none;">
              <a id="inputFieldView" href="javascript:viewFile('inputField');">View</a><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a id="inputFieldDownload" href="download.htm?param=inputField">Download</a></div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="workCompletedBy"></td>
          </tr>
          <tr><td colspan="3" class="no-bg">&nbsp;</td></tr>
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    <li id="pageThree">Criteria B : Physiological requirements <span>View</span></li>
    <ul><div class="rg-p innew">
    <div class="clearfix"></div>
        <p>Criteria B - Reasonable State of Repair (Two or more negative answers will mean that the property fails to meet the standard. However we can advise)</p>
    <br />
    <tr><td colspan="3"><h2>Does the property have: </h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          
          <tr>
            <td width="80%"><span>If applicable, adequate size and layout of common entrance areas for blocks of flats (e.g. must not have narrow access ways or steep stairs)</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="adequateSizeandLayoutComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateSizeandLayout">Not Set</td>
          </tr>
          <tr>
          
            <td width="80%"><span>Is the property safe against unauthorized entry so as to delay and deter intruders and make the occupants feel safer.</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="safeAgainstUnauthorizedEntryComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="safeAgainstUnauthorizedEntry">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Is there caretaker/entry phone system to block of flats</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="careTakerComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="careTaker">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Is there a burglar alarm systems</span>
            <div class="clear"></div>
              <div class="clear"></div>
              Comments : <p id="burglarAlarmSystemComments"></p>
              <div class="rcm" id="burglarAlarmSystemFileDisplay" style="display: none;"> 
            	    <strong>Name : </strong><span id="burglarAlarmSystemFileName"></span>
             		 <a class="FileView" id="burglarAlarmSystemFileView" href="" title="Burglar Alarm System" style="display: none;">View</a>
             	 	 <a id="burglarAlarmSystemFileDownload" href="${contextPath}/download/certificates.htm?param=burglarAlarmSystem" target="_blank" >Download</a> 
              </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="burglarAlarmSystem">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>If lockable windows have been fitted do all of the windows have keys?</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="allWindowsHaveKeysComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="allWindowsHaveKeys">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Adequate lighting (natural and artificial) </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="adequateLighteningComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateLightening">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Is there adequate Security lighting and is it in working condition</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="adequateSecurityLighteningComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateSecurityLightening">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Is the property protected from intrusive artificial external lighting at night </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="externalLighteningAtNightComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="externalLighteningAtNight">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Has there been complaints by your tenant or the neighbours in regard to excessive noise levels, Traffic/other external noise also considered  </span>
              <div class="clear"></div>
              Comments : <p id="complaintsAgainstNoiseComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="complaintsAgainstNoise">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>>Safe barriers against fires, flames and hot objects, (fire doors etc.) with means of escape  </span>
              <div class="clear"></div>
              Comments : <p id="safeBarriersAgainstFireComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="safeBarriersAgainstFire">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Is there adequate noise insulation as overlap of domestic noise between one dwelling and another (e.g. toilet flushing/television/conversation etc.) </span>
              <div class="clear"></div>
              Comments : <p id="adequateNoiceInsulationComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateNoiceInsulation">Not Set</td>
          </tr>
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    
    <li id="pageFour">Criteria C : Protection against Infection  <span>View</span></li>
    <ul><div class="rg-p innew">
    <div class="clearfix"></div>
    	<p><h1 style="font-size: 20px!important;">Hygiene, sanitation and water supply</h1></p>
       <p><strong>Criteria C. </strong>It must have reasonably modern facilities and services</p>
    <br />
    <tr><td colspan="3"><h2>Does the property have </h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%"><span>The Kitchen floor should be reasonably smooth and impervious for easy cleaning thus maintaining a hygienic condition, joints between sink/drainer/worktop and adjacent wall should be sealed and water tight</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="kitchenComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="kitchen">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>A kitchen with adequate space and layout (e.g. large enough to fit sink, cupboards, cooker, worktops</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="adequateKitchenSpaceComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateKitchenSpace">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>At least four appropriate power sockets associated with the worktop(s) as well as two for general use.  </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="appropriatePowerSocketsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="appropriatePowerSockets">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Satisfactory facilities for preparation and cooking of food with a sink and hot and cold water.</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="facilitiesForPreparationOfFoodComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="facilitiesForPreparationOfFood">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Adequate provision and facilities for storage/preparation/cooking of food.</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="storageOfFoodComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="storageOfFood">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Adequate and appropriate lighting especially over the facilities; and Suitable ventilation of whole of kitchen area, especially the cooking area. </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="suitableVentilationOfKitchenComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="suitableVentilationOfKitchen">Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span>Suitably located bath or shower and wash-hand-basin all with hot and cold water with suitable active ventilation. </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="suitableLocatedWashBasinComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="suitableLocatedWashBasin">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Effective drainage for foul-waste/surface-water </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="drainageOfFoulWaterComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="drainageOfFoulWater">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>An appropriately located bathroom and WC (e.g. it isnâ€™t accessed via a bedroom, located outside, or has no sink and is entered from kitchen). </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="appropriatelyLocatedBathroomComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="appropriatelyLocatedBathroom">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Water For drinking/cooking/washing/cleaning/sanitation. </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="drinkingWaterComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="drinkingWater">Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span>Adequate facilities for refuse storage</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="refuseStorageComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="refuseStorage">Not Set</td>
          </tr>
          
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    
    
     <li id="pageFive">Criteria D : Protection against accidents <span>View</span></li>
    <ul><div class="rg-p innew">
    <div class="clearfix"></div>
        <p><h1 style="font-size: 20px!important;">Falls, Collisions, Cuts and Strains</h1></p>
        <p><strong>Criteria D.</strong> It must provide a reasonable degree of thermal comfort</p>
    <br />
    <tr><td colspan="3"><h2>Does the property comply by ensuring that:</h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%"><span>The risk of falls has been reduced when getting out of the bath/shower/similar facility, to mitigate falls on the same level, or from one level or room to another.</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="programmableCentralHeatingComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="programmableCentralHeating">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>There is adequate natural lighting to the top and foot of the stairs  </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
             Comments <p id="adequateNaturalLighteningComments"></p>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="adequateNaturalLightening">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>That trip steps/thresholds/ramps are secured where the change in level is less than 300mm. </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="securedStepsAndRampsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="securedStepsAndRamps">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>That doors do not open directly onto stairs or the head of the stairs causing obstruction or increasing the likelihood of a fall.</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="doorsDirectionComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="doorsDirection">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Do you have more than 1 flight of stairs in the property</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              Comments : <p id="moreThanOneFlightOfStairsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="moreThanOneFlightOfStairs">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span style="font: bold;">
         					   <p>Do all stairs comply with current building regulations i.e</p> 
								<p class="text">Tread dimensions to be between 280mm and 360mm;</p>
								<p class="text">Rise dimensions to be between 100mm-180mm;</p>
								<p class="text">Pitch (angle of stairs) to be less than 42Â°;</p>
								<p class="text">Stairs should be checked for above average steepness or shallowness;</p>
								<p class="text">Consistency/uniformity in dimensions of rise and going within a flight (except for obvious change in direction of stair e.g. use of winders)</p>
								<p class="text">Nosing should not project more than 18mm beyond any riser;</p>
								<p class="text">Treads and nosing should provide appropriate friction (carpet etc., if possible)</p>
 							</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
             
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="buildingRegulation">Not Set</td>
          </tr>
          
           <tr>
            <td width="80%"><span> Upto Which date will this work get done ?</span>
              <div class="clear"></div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="buildingRegulationDate">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>What space is accessed via the non compliant flight of stairs?</span>
              <div class="clear"></div>
              Comments : <p id="spaceAccessedViaFlightOfStairsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
          <!--   <td width="19%" id="spaceAccessedViaFlightOfStairsFile">Not Set</td> -->
          </tr>
          
          <tr>
            <td width="80%"><span>Electrical wiring installation meets the latest requirements of Institution of Electrical Engineers/British Standard (BS 7671) </span>
              <div class="clear"></div>
              Comments : <p id="electricalWiringStandardsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="electricalWiringStandards">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span>Have threats of trapping body parts been removed or reduced ?</span>
              <div class="clear"></div>
              Comments : <p id="trappingBodyPartsComments"></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="trappingBodyParts">Not Set</td>
          </tr>
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    
    <li id="pageSix">Property Marketing Information  <span>View</span></li>
    <ul><div class="rg-p innew">
    <div class="clearfix"></div>
        <p></p>
    <br />
    <tr><td colspan="3"><h2>Property Marketing Information </h2></td></tr>
      <div class="v-list">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%"><span>The property will be available to let from (date)?  </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="availability">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span> What is the rent for this property(per month) </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="rentAmount">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Type of property </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="propertyType">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span> Number of bedrooms </span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="bedroomCount">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Number of bathrooms- to include bath And/ or shower, WC and basin</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="bathroomCount">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span>Is the property furnished?</span>
            <div class="clear"></div>
              
              <div class="clear"></div>
              <p></p></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="furnished">Not Set</td>
          </tr>
          <tr>
          	<td>Please upload pictures, Adding images of your property especially of the kitchen, bathroom, will help us to get back to you sooner, however these shots maybe in the inventory.</td>
          </tr>
          <tr>
          	<td id="imageDisplaytd" class="" style="display: block;">
              <div class="clearfix"></div>
              <div class="im-gal" >
               <ul id="imageGalary" style="display: block;">
               </ul>  
				<a id="prev2" class="prev-gal" href="#">&laquo;</a>
				<a id="next2" class="next-gal" href="#">&raquo;</a>
				<div id="pager2" class="pager-gal"></div>
             </div>
              </td>
          </tr>
          <tr><td colspan="3" class="no-bg"></td></tr>
          <tr><td colspan="3"><h2>Does the property include: </h2></td></tr>
          <tr>
            <td width="80%"><span> Flooring</span>
              <div class="clear"></div>
              <div class="cmnt-class">
             	  Comments : <p id="flooringComments"></p>
             </div>
             </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="flooring">Not Set</td>
          </tr>
          <tr>
            <td width="80%"><span> Curtains/Blinds </span>
              <div class="clear"></div>
               <div class="cmnt-class">
             	  Comments : <p id="curtainsComments"></p>
             </div>
              </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="curtains">Not Set</td>
          </tr>
          
          <tr><td colspan="3" class="no-bg"></td></tr>
          <tr><td colspan="3"><h2> Does the property have own or share communal garden </h2></td></tr>
          <tr>
            <td width="80%"><span> At the front</span>
              <div class="clear"></div>
             <div class="cmnt-class">
             	  Comments : <p id="frontGardenComments"></p>
             </div>
             </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="frontGarden">Not Set</td>
          </tr>
          
          <tr>
            <td width="80%"><span> At the rear</span>
              <div class="clear"></div>
             <div class="cmnt-class">
             	  Comments : <p id="rearGardenComments"></p>
             </div>
             </td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="rearGarden">Not Set</td>
          </tr>
          
          <tr><td colspan="3" class="no-bg"></td></tr>
          <tr><td colspan="3"><h2> Access </h2></td></tr>
          <tr>
            <td width="80%"><span> Are there steps that must be used to enter the property which do not have wheelchair access?</span>
              <div class="clear"></div>
              <div class="cmnt-class">
             	  Comments : <p id="wheelChairAccessComments"></p>
             </div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="wheelChairAccess">Not Set</td>
          </tr>
           <tr>
            <td width="80%"><span>Are there steps within the property other than a staircase between floors in a house, e.g. rooms on the ground floor at different levels? </span>
              <div class="clear"></div>
              <div class="cmnt-class">
             	  Comments : <p id="extraStairsComments"></p>
             </div></td>
            <td width="1%"><strong>:</strong></td>
            <td width="19%" id="extraStairs">Not Set</td>
          </tr>
        </table>
      </div>
      <div class="clearfix"></div>
    </div></ul>
    </ul>
    
  </section> 
</div>