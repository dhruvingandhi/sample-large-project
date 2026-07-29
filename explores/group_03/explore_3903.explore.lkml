# Explore: explore_3903
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11710.view.lkml"
include: "/views/domain_12/view_11712.view.lkml"
include: "/views/domain_13/view_11713.view.lkml"
include: "/views/domain_14/view_11714.view.lkml"

explore: explore_3903 {
  label: "Explore Explore 3903"
  description: "Comprehensive analytics explore joining base view_11710 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11710
  
  always_filter: {
    filters: [view_11710.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11710.created_at_date: "7 days"]
    unless: [view_11710.id, view_11710.status]
  }

  join: view_11712 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11710.user_id} = ${view_11712.id} ;;
    required_joins: []
  }

  join: view_11713 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11710.account_id} = ${view_11713.account_id} ;;
    required_joins: [view_11712]
  }

  join: view_11714 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11710.category} = ${view_11714.category} ;;
  }

  access_filter: {
    field: view_11710.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11710.is_deleted} = false ;;
}
