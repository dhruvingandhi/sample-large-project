# Explore: explore_3504
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10513.view.lkml"
include: "/views/domain_15/view_10515.view.lkml"
include: "/views/domain_16/view_10516.view.lkml"
include: "/views/domain_17/view_10517.view.lkml"

explore: explore_3504 {
  label: "Explore Explore 3504"
  description: "Comprehensive analytics explore joining base view_10513 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10513
  
  always_filter: {
    filters: [view_10513.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10513.created_at_date: "7 days"]
    unless: [view_10513.id, view_10513.status]
  }

  join: view_10515 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10513.user_id} = ${view_10515.id} ;;
    required_joins: []
  }

  join: view_10516 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10513.account_id} = ${view_10516.account_id} ;;
    required_joins: [view_10515]
  }

  join: view_10517 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10513.category} = ${view_10517.category} ;;
  }

  access_filter: {
    field: view_10513.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10513.is_deleted} = false ;;
}
