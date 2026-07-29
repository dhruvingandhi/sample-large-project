# Explore: explore_1152
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03457.view.lkml"
include: "/views/domain_09/view_03459.view.lkml"
include: "/views/domain_10/view_03460.view.lkml"
include: "/views/domain_11/view_03461.view.lkml"

explore: explore_1152 {
  label: "Explore Explore 1152"
  description: "Comprehensive analytics explore joining base view_03457 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03457
  
  always_filter: {
    filters: [view_03457.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03457.created_at_date: "7 days"]
    unless: [view_03457.id, view_03457.status]
  }

  join: view_03459 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03457.user_id} = ${view_03459.id} ;;
    required_joins: []
  }

  join: view_03460 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03457.account_id} = ${view_03460.account_id} ;;
    required_joins: [view_03459]
  }

  join: view_03461 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03457.category} = ${view_03461.category} ;;
  }

  access_filter: {
    field: view_03457.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03457.is_deleted} = false ;;
}
