# Update for 2000 file diff target
# Explore: explore_1720
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05161.view.lkml"
include: "/views/domain_13/view_05163.view.lkml"
include: "/views/domain_14/view_05164.view.lkml"
include: "/views/domain_15/view_05165.view.lkml"

explore: explore_1720 {
  label: "Explore Explore 1720"
  description: "Comprehensive analytics explore joining base view_05161 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05161
  
  always_filter: {
    filters: [view_05161.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05161.created_at_date: "7 days"]
    unless: [view_05161.id, view_05161.status]
  }

  join: view_05163 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05161.user_id} = ${view_05163.id} ;;
    required_joins: []
  }

  join: view_05164 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05161.account_id} = ${view_05164.account_id} ;;
    required_joins: [view_05163]
  }

  join: view_05165 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05161.category} = ${view_05165.category} ;;
  }

  access_filter: {
    field: view_05161.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05161.is_deleted} = false ;;
}
