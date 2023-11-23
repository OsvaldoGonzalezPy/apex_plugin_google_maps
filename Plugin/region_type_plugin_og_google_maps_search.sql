prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>51803836654824927748
,p_default_application_id=>239526
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WSOG'
);
end;
/
 
prompt APPLICATION 239526 - APEX Lab
--
-- Application Export:
--   Application:     239526
--   Name:            APEX Lab
--   Date and Time:   14:56 Thursday November 23, 2023
--   Exported By:     OVALGONZALEZ@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 21888107920039365562
--   Manifest End
--   Version:         23.2.0
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/og_google_maps_search
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(21888107920039365562)
,p_plugin_type=>'REGION TYPE'
,p_name=>'OG_GOOGLE_MAPS_SEARCH'
,p_display_name=>'Buscador Google Maps'
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
'        src="https://maps.google.com/maps?q=''||:BUSCADOR_MAPA||''&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">',
'	    </iframe>',
'    </div>'');',
'    return null;',
'end;'))
,p_default_escape_mode=>'HTML'
,p_api_version=>2
,p_render_function=>'cargarMapa'
,p_standard_attributes=>'AJAX_ITEMS_TO_SUBMIT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
