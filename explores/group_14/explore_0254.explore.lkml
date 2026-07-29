# Explore: explore_0254
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00763.view.lkml"
include: "/views/domain_15/view_00765.view.lkml"
include: "/views/domain_16/view_00766.view.lkml"
include: "/views/domain_17/view_00767.view.lkml"

explore: explore_0254 {
  label: "Explore Explore 0254"
  description: "Comprehensive analytics explore joining base view_00763 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00763
  
  always_filter: {
    filters: [view_00763.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00763.created_at_date: "7 days"]
    unless: [view_00763.id, view_00763.status]
  }

  join: view_00765 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00763.user_id} = ${view_00765.id} ;;
    required_joins: []
  }

  join: view_00766 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00763.account_id} = ${view_00766.account_id} ;;
    required_joins: [view_00765]
  }

  join: view_00767 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00763.category} = ${view_00767.category} ;;
  }

  access_filter: {
    field: view_00763.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00763.is_deleted} = false ;;
}
