<?xml version="1.0"?>
<recipe>
    <instantiate from="src/app_package/domain.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/screens/${screenName?lower_case}/domain/domain.kt" />
    <instantiate from="src/app_package/logic.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/screens/${screenName?lower_case}/domain/logic.kt" />
    <instantiate from="src/app_package/EffectHandlers.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/screens/${screenName?lower_case}/effecthandlers/${screenName}EffectHandlers.kt" />
    <instantiate from="src/app_package/View.kt.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/screens/${screenName?lower_case}/view/${screenName}View.kt" />
    <instantiate from="src/app_package/Controller.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/screens/${screenName?lower_case}/${screenName}Controller.kt" />
    <instantiate from="res/layout/controller_layout.kt.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${controllerLayout}.xml" />

    <open file="${srcOut}/presentation/screens/${screenName?lower_case}/${screenName}Controller.kt"/>
</recipe>
