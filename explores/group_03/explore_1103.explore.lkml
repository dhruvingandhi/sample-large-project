# Explore: explore_1103
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03310.view.lkml"
include: "/views/domain_12/view_03312.view.lkml"
include: "/views/domain_13/view_03313.view.lkml"
include: "/views/domain_14/view_03314.view.lkml"

explore: explore_1103 {
  label: "Explore Explore 1103"
  description: "Comprehensive analytics explore joining base view_03310 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03310
  
  always_filter: {
    filters: [view_03310.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03310.created_at_date: "7 days"]
    unless: [view_03310.id, view_03310.status]
  }

  join: view_03312 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03310.user_id} = ${view_03312.id} ;;
    required_joins: []
  }

  join: view_03313 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03310.account_id} = ${view_03313.account_id} ;;
    required_joins: [view_03312]
  }

  join: view_03314 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03310.category} = ${view_03314.category} ;;
  }

  access_filter: {
    field: view_03310.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03310.is_deleted} = false ;;
}
