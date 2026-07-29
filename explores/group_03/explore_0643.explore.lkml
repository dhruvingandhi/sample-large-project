# Explore: explore_0643
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01930.view.lkml"
include: "/views/domain_32/view_01932.view.lkml"
include: "/views/domain_33/view_01933.view.lkml"
include: "/views/domain_34/view_01934.view.lkml"

explore: explore_0643 {
  label: "Explore Explore 0643"
  description: "Comprehensive analytics explore joining base view_01930 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01930
  
  always_filter: {
    filters: [view_01930.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01930.created_at_date: "7 days"]
    unless: [view_01930.id, view_01930.status]
  }

  join: view_01932 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01930.user_id} = ${view_01932.id} ;;
    required_joins: []
  }

  join: view_01933 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01930.account_id} = ${view_01933.account_id} ;;
    required_joins: [view_01932]
  }

  join: view_01934 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01930.category} = ${view_01934.category} ;;
  }

  access_filter: {
    field: view_01930.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01930.is_deleted} = false ;;
}
