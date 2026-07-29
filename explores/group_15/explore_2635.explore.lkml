# Explore: explore_2635
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07906.view.lkml"
include: "/views/domain_08/view_07908.view.lkml"
include: "/views/domain_09/view_07909.view.lkml"
include: "/views/domain_10/view_07910.view.lkml"

explore: explore_2635 {
  label: "Explore Explore 2635"
  description: "Comprehensive analytics explore joining base view_07906 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07906
  
  always_filter: {
    filters: [view_07906.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07906.created_at_date: "7 days"]
    unless: [view_07906.id, view_07906.status]
  }

  join: view_07908 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07906.user_id} = ${view_07908.id} ;;
    required_joins: []
  }

  join: view_07909 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07906.account_id} = ${view_07909.account_id} ;;
    required_joins: [view_07908]
  }

  join: view_07910 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07906.category} = ${view_07910.category} ;;
  }

  access_filter: {
    field: view_07906.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07906.is_deleted} = false ;;
}
