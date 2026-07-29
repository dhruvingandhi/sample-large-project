# Explore: explore_0152
# Auto-generated LookML Explore File

include: "/views/domain_07/view_00457.view.lkml"
include: "/views/domain_09/view_00459.view.lkml"
include: "/views/domain_10/view_00460.view.lkml"
include: "/views/domain_11/view_00461.view.lkml"

explore: explore_0152 {
  label: "Explore Explore 0152"
  description: "Comprehensive analytics explore joining base view_00457 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00457
  
  always_filter: {
    filters: [view_00457.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00457.created_at_date: "7 days"]
    unless: [view_00457.id, view_00457.status]
  }

  join: view_00459 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00457.user_id} = ${view_00459.id} ;;
    required_joins: []
  }

  join: view_00460 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00457.account_id} = ${view_00460.account_id} ;;
    required_joins: [view_00459]
  }

  join: view_00461 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00457.category} = ${view_00461.category} ;;
  }

  access_filter: {
    field: view_00457.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00457.is_deleted} = false ;;
}
