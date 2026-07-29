# Explore: explore_1626
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04879.view.lkml"
include: "/views/domain_31/view_04881.view.lkml"
include: "/views/domain_32/view_04882.view.lkml"
include: "/views/domain_33/view_04883.view.lkml"

explore: explore_1626 {
  label: "Explore Explore 1626"
  description: "Comprehensive analytics explore joining base view_04879 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04879
  
  always_filter: {
    filters: [view_04879.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04879.created_at_date: "7 days"]
    unless: [view_04879.id, view_04879.status]
  }

  join: view_04881 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04879.user_id} = ${view_04881.id} ;;
    required_joins: []
  }

  join: view_04882 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04879.account_id} = ${view_04882.account_id} ;;
    required_joins: [view_04881]
  }

  join: view_04883 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04879.category} = ${view_04883.category} ;;
  }

  access_filter: {
    field: view_04879.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04879.is_deleted} = false ;;
}
