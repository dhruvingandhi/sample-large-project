# Update for 500 file diff target
# Explore: explore_0682
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02047.view.lkml"
include: "/views/domain_49/view_02049.view.lkml"
include: "/views/domain_50/view_02050.view.lkml"
include: "/views/domain_01/view_02051.view.lkml"

explore: explore_0682 {
  label: "Explore Explore 0682"
  description: "Comprehensive analytics explore joining base view_02047 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02047
  
  always_filter: {
    filters: [view_02047.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02047.created_at_date: "7 days"]
    unless: [view_02047.id, view_02047.status]
  }

  join: view_02049 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02047.user_id} = ${view_02049.id} ;;
    required_joins: []
  }

  join: view_02050 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02047.account_id} = ${view_02050.account_id} ;;
    required_joins: [view_02049]
  }

  join: view_02051 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02047.category} = ${view_02051.category} ;;
  }

  access_filter: {
    field: view_02047.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02047.is_deleted} = false ;;
}
