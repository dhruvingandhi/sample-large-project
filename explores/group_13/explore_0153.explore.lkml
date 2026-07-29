# Explore: explore_0153
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00460.view.lkml"
include: "/views/domain_12/view_00462.view.lkml"
include: "/views/domain_13/view_00463.view.lkml"
include: "/views/domain_14/view_00464.view.lkml"

explore: explore_0153 {
  label: "Explore Explore 0153"
  description: "Comprehensive analytics explore joining base view_00460 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00460
  
  always_filter: {
    filters: [view_00460.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00460.created_at_date: "7 days"]
    unless: [view_00460.id, view_00460.status]
  }

  join: view_00462 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00460.user_id} = ${view_00462.id} ;;
    required_joins: []
  }

  join: view_00463 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00460.account_id} = ${view_00463.account_id} ;;
    required_joins: [view_00462]
  }

  join: view_00464 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00460.category} = ${view_00464.category} ;;
  }

  access_filter: {
    field: view_00460.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00460.is_deleted} = false ;;
}
