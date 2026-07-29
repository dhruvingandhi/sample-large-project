# Explore: explore_0077
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00232.view.lkml"
include: "/views/domain_34/view_00234.view.lkml"
include: "/views/domain_35/view_00235.view.lkml"
include: "/views/domain_36/view_00236.view.lkml"

explore: explore_0077 {
  label: "Explore Explore 0077"
  description: "Comprehensive analytics explore joining base view_00232 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00232
  
  always_filter: {
    filters: [view_00232.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00232.created_at_date: "7 days"]
    unless: [view_00232.id, view_00232.status]
  }

  join: view_00234 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00232.user_id} = ${view_00234.id} ;;
    required_joins: []
  }

  join: view_00235 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00232.account_id} = ${view_00235.account_id} ;;
    required_joins: [view_00234]
  }

  join: view_00236 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00232.category} = ${view_00236.category} ;;
  }

  access_filter: {
    field: view_00232.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00232.is_deleted} = false ;;
}
