# Update for 2000 file diff target
# Explore: explore_2818
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08455.view.lkml"
include: "/views/domain_07/view_08457.view.lkml"
include: "/views/domain_08/view_08458.view.lkml"
include: "/views/domain_09/view_08459.view.lkml"

explore: explore_2818 {
  label: "Explore Explore 2818"
  description: "Comprehensive analytics explore joining base view_08455 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08455
  
  always_filter: {
    filters: [view_08455.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08455.created_at_date: "7 days"]
    unless: [view_08455.id, view_08455.status]
  }

  join: view_08457 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08455.user_id} = ${view_08457.id} ;;
    required_joins: []
  }

  join: view_08458 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08455.account_id} = ${view_08458.account_id} ;;
    required_joins: [view_08457]
  }

  join: view_08459 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08455.category} = ${view_08459.category} ;;
  }

  access_filter: {
    field: view_08455.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08455.is_deleted} = false ;;
}
