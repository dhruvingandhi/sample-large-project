# Explore: explore_2145
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06436.view.lkml"
include: "/views/domain_38/view_06438.view.lkml"
include: "/views/domain_39/view_06439.view.lkml"
include: "/views/domain_40/view_06440.view.lkml"

explore: explore_2145 {
  label: "Explore Explore 2145"
  description: "Comprehensive analytics explore joining base view_06436 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06436
  
  always_filter: {
    filters: [view_06436.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06436.created_at_date: "7 days"]
    unless: [view_06436.id, view_06436.status]
  }

  join: view_06438 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06436.user_id} = ${view_06438.id} ;;
    required_joins: []
  }

  join: view_06439 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06436.account_id} = ${view_06439.account_id} ;;
    required_joins: [view_06438]
  }

  join: view_06440 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06436.category} = ${view_06440.category} ;;
  }

  access_filter: {
    field: view_06436.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06436.is_deleted} = false ;;
}
