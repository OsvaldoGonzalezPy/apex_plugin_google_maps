prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>100001
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'TEST'
);
end;
/
 
prompt APPLICATION 100 - APEX Lab
--
-- Application Export:
--   Application:     100
--   Name:            APEX LAb
--   Date and Time:   10:43 Friday November 24, 2023
--   Exported By:     OSVALDOGONZALEZ
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 270922179615924351
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     300168001583092
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/og_google_maps_search
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(270922179615924351)
,p_plugin_type=>'REGION TYPE'
,p_name=>'OG_GOOGLE_MAPS_SEARCH'
,p_display_name=>'Buscador Google Maps'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function cargarMapa(',
'    P_REGION IN APEX_PLUGIN.T_REGION, ',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN, ',
'    P_IS_PRINTER_FRIENDLY IN BOOLEAN)',
'    return APEX_PLUGIN.T_REGION_RENDER_RESULT',
'as',
'begin',
'    htp.p(''<div style="width: 100%" id="ogmap">',
'	    <iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" ',
'            src="https://maps.google.com/maps?q=''||:BUSCADOR_MAPA||''&t=m&z=15&ie=UTF8&iwloc=B&output=embed">',
'	    </iframe>',
'    </div>'');',
'    return null;',
'end;'))
,p_api_version=>2
,p_render_function=>'cargarMapa'
,p_standard_attributes=>'AJAX_ITEMS_TO_SUBMIT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.5'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
