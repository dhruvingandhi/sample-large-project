# Explore: explore_1643
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04930.view.lkml"
include: "/views/domain_32/view_04932.view.lkml"
include: "/views/domain_33/view_04933.view.lkml"
include: "/views/domain_34/view_04934.view.lkml"

explore: explore_1643 {
  label: "Explore Explore 1643"
  description: "Comprehensive analytics explore joining base view_04930 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04930
  
  always_filter: {
    filters: [view_04930.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04930.created_at_date: "7 days"]
    unless: [view_04930.id, view_04930.status]
  }

  join: view_04932 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04930.user_id} = ${view_04932.id} ;;
    required_joins: []
  }

  join: view_04933 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04930.account_id} = ${view_04933.account_id} ;;
    required_joins: [view_04932]
  }

  join: view_04934 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04930.category} = ${view_04934.category} ;;
  }

  access_filter: {
    field: view_04930.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04930.is_deleted} = false ;;
}
