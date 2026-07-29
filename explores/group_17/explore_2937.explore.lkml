# Explore: explore_2937
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08812.view.lkml"
include: "/views/domain_14/view_08814.view.lkml"
include: "/views/domain_15/view_08815.view.lkml"
include: "/views/domain_16/view_08816.view.lkml"

explore: explore_2937 {
  label: "Explore Explore 2937"
  description: "Comprehensive analytics explore joining base view_08812 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08812
  
  always_filter: {
    filters: [view_08812.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08812.created_at_date: "7 days"]
    unless: [view_08812.id, view_08812.status]
  }

  join: view_08814 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08812.user_id} = ${view_08814.id} ;;
    required_joins: []
  }

  join: view_08815 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08812.account_id} = ${view_08815.account_id} ;;
    required_joins: [view_08814]
  }

  join: view_08816 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08812.category} = ${view_08816.category} ;;
  }

  access_filter: {
    field: view_08812.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08812.is_deleted} = false ;;
}
