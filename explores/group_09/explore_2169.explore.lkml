# Explore: explore_2169
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06508.view.lkml"
include: "/views/domain_10/view_06510.view.lkml"
include: "/views/domain_11/view_06511.view.lkml"
include: "/views/domain_12/view_06512.view.lkml"

explore: explore_2169 {
  label: "Explore Explore 2169"
  description: "Comprehensive analytics explore joining base view_06508 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06508
  
  always_filter: {
    filters: [view_06508.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06508.created_at_date: "7 days"]
    unless: [view_06508.id, view_06508.status]
  }

  join: view_06510 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06508.user_id} = ${view_06510.id} ;;
    required_joins: []
  }

  join: view_06511 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06508.account_id} = ${view_06511.account_id} ;;
    required_joins: [view_06510]
  }

  join: view_06512 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06508.category} = ${view_06512.category} ;;
  }

  access_filter: {
    field: view_06508.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06508.is_deleted} = false ;;
}
