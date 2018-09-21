<?xml version="1.0"?>
<globals>
 <global id="mainSourceSetPackage" value="${packageName?replace('.debug|.staging|.systest', '', 'r')}" />

 <global id="resOut" value="${resDir}" />
 <global id="srcOut" value="${srcDir}/${packageName?replace('.debug|.staging|.systest', '', 'i')?replace('.', '/', 'i')}" />
</globals>
