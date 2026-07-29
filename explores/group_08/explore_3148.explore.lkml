# Explore: explore_3148
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09445.view.lkml"
include: "/views/domain_47/view_09447.view.lkml"
include: "/views/domain_48/view_09448.view.lkml"
include: "/views/domain_49/view_09449.view.lkml"

explore: explore_3148 {
  label: "Explore Explore 3148"
  description: "Comprehensive analytics explore joining base view_09445 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09445
  
  always_filter: {
    filters: [view_09445.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09445.created_at_date: "7 days"]
    unless: [view_09445.id, view_09445.status]
  }

  join: view_09447 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09445.user_id} = ${view_09447.id} ;;
    required_joins: []
  }

  join: view_09448 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09445.account_id} = ${view_09448.account_id} ;;
    required_joins: [view_09447]
  }

  join: view_09449 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09445.category} = ${view_09449.category} ;;
  }

  access_filter: {
    field: view_09445.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09445.is_deleted} = false ;;
}
