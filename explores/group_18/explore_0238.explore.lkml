# Update for 2000 file diff target
# Explore: explore_0238
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00715.view.lkml"
include: "/views/domain_17/view_00717.view.lkml"
include: "/views/domain_18/view_00718.view.lkml"
include: "/views/domain_19/view_00719.view.lkml"

explore: explore_0238 {
  label: "Explore Explore 0238"
  description: "Comprehensive analytics explore joining base view_00715 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00715
  
  always_filter: {
    filters: [view_00715.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00715.created_at_date: "7 days"]
    unless: [view_00715.id, view_00715.status]
  }

  join: view_00717 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00715.user_id} = ${view_00717.id} ;;
    required_joins: []
  }

  join: view_00718 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00715.account_id} = ${view_00718.account_id} ;;
    required_joins: [view_00717]
  }

  join: view_00719 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00715.category} = ${view_00719.category} ;;
  }

  access_filter: {
    field: view_00715.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00715.is_deleted} = false ;;
}
