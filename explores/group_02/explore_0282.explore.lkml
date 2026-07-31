# Update for 500 file diff target
# Explore: explore_0282
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00847.view.lkml"
include: "/views/domain_49/view_00849.view.lkml"
include: "/views/domain_50/view_00850.view.lkml"
include: "/views/domain_01/view_00851.view.lkml"

explore: explore_0282 {
  label: "Explore Explore 0282"
  description: "Comprehensive analytics explore joining base view_00847 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00847
  
  always_filter: {
    filters: [view_00847.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00847.created_at_date: "7 days"]
    unless: [view_00847.id, view_00847.status]
  }

  join: view_00849 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00847.user_id} = ${view_00849.id} ;;
    required_joins: []
  }

  join: view_00850 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00847.account_id} = ${view_00850.account_id} ;;
    required_joins: [view_00849]
  }

  join: view_00851 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00847.category} = ${view_00851.category} ;;
  }

  access_filter: {
    field: view_00847.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00847.is_deleted} = false ;;
}
