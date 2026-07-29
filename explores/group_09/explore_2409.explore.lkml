# Explore: explore_2409
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07228.view.lkml"
include: "/views/domain_30/view_07230.view.lkml"
include: "/views/domain_31/view_07231.view.lkml"
include: "/views/domain_32/view_07232.view.lkml"

explore: explore_2409 {
  label: "Explore Explore 2409"
  description: "Comprehensive analytics explore joining base view_07228 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07228
  
  always_filter: {
    filters: [view_07228.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07228.created_at_date: "7 days"]
    unless: [view_07228.id, view_07228.status]
  }

  join: view_07230 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07228.user_id} = ${view_07230.id} ;;
    required_joins: []
  }

  join: view_07231 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07228.account_id} = ${view_07231.account_id} ;;
    required_joins: [view_07230]
  }

  join: view_07232 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07228.category} = ${view_07232.category} ;;
  }

  access_filter: {
    field: view_07228.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07228.is_deleted} = false ;;
}
