# Explore: explore_2168
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06505.view.lkml"
include: "/views/domain_07/view_06507.view.lkml"
include: "/views/domain_08/view_06508.view.lkml"
include: "/views/domain_09/view_06509.view.lkml"

explore: explore_2168 {
  label: "Explore Explore 2168"
  description: "Comprehensive analytics explore joining base view_06505 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06505
  
  always_filter: {
    filters: [view_06505.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06505.created_at_date: "7 days"]
    unless: [view_06505.id, view_06505.status]
  }

  join: view_06507 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06505.user_id} = ${view_06507.id} ;;
    required_joins: []
  }

  join: view_06508 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06505.account_id} = ${view_06508.account_id} ;;
    required_joins: [view_06507]
  }

  join: view_06509 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06505.category} = ${view_06509.category} ;;
  }

  access_filter: {
    field: view_06505.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06505.is_deleted} = false ;;
}
