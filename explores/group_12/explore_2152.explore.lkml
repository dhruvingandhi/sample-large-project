# Explore: explore_2152
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06457.view.lkml"
include: "/views/domain_09/view_06459.view.lkml"
include: "/views/domain_10/view_06460.view.lkml"
include: "/views/domain_11/view_06461.view.lkml"

explore: explore_2152 {
  label: "Explore Explore 2152"
  description: "Comprehensive analytics explore joining base view_06457 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06457
  
  always_filter: {
    filters: [view_06457.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06457.created_at_date: "7 days"]
    unless: [view_06457.id, view_06457.status]
  }

  join: view_06459 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06457.user_id} = ${view_06459.id} ;;
    required_joins: []
  }

  join: view_06460 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06457.account_id} = ${view_06460.account_id} ;;
    required_joins: [view_06459]
  }

  join: view_06461 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06457.category} = ${view_06461.category} ;;
  }

  access_filter: {
    field: view_06457.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06457.is_deleted} = false ;;
}
