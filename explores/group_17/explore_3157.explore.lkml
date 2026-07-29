# Explore: explore_3157
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09472.view.lkml"
include: "/views/domain_24/view_09474.view.lkml"
include: "/views/domain_25/view_09475.view.lkml"
include: "/views/domain_26/view_09476.view.lkml"

explore: explore_3157 {
  label: "Explore Explore 3157"
  description: "Comprehensive analytics explore joining base view_09472 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09472
  
  always_filter: {
    filters: [view_09472.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09472.created_at_date: "7 days"]
    unless: [view_09472.id, view_09472.status]
  }

  join: view_09474 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09472.user_id} = ${view_09474.id} ;;
    required_joins: []
  }

  join: view_09475 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09472.account_id} = ${view_09475.account_id} ;;
    required_joins: [view_09474]
  }

  join: view_09476 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09472.category} = ${view_09476.category} ;;
  }

  access_filter: {
    field: view_09472.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09472.is_deleted} = false ;;
}
