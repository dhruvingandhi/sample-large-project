# Explore: explore_2036
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06109.view.lkml"
include: "/views/domain_11/view_06111.view.lkml"
include: "/views/domain_12/view_06112.view.lkml"
include: "/views/domain_13/view_06113.view.lkml"

explore: explore_2036 {
  label: "Explore Explore 2036"
  description: "Comprehensive analytics explore joining base view_06109 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06109
  
  always_filter: {
    filters: [view_06109.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06109.created_at_date: "7 days"]
    unless: [view_06109.id, view_06109.status]
  }

  join: view_06111 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06109.user_id} = ${view_06111.id} ;;
    required_joins: []
  }

  join: view_06112 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06109.account_id} = ${view_06112.account_id} ;;
    required_joins: [view_06111]
  }

  join: view_06113 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06109.category} = ${view_06113.category} ;;
  }

  access_filter: {
    field: view_06109.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06109.is_deleted} = false ;;
}
