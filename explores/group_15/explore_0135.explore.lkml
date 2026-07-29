# Explore: explore_0135
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00406.view.lkml"
include: "/views/domain_08/view_00408.view.lkml"
include: "/views/domain_09/view_00409.view.lkml"
include: "/views/domain_10/view_00410.view.lkml"

explore: explore_0135 {
  label: "Explore Explore 0135"
  description: "Comprehensive analytics explore joining base view_00406 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00406
  
  always_filter: {
    filters: [view_00406.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00406.created_at_date: "7 days"]
    unless: [view_00406.id, view_00406.status]
  }

  join: view_00408 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00406.user_id} = ${view_00408.id} ;;
    required_joins: []
  }

  join: view_00409 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00406.account_id} = ${view_00409.account_id} ;;
    required_joins: [view_00408]
  }

  join: view_00410 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00406.category} = ${view_00410.category} ;;
  }

  access_filter: {
    field: view_00406.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00406.is_deleted} = false ;;
}
