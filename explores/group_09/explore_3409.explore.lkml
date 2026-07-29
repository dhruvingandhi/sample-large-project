# Explore: explore_3409
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10228.view.lkml"
include: "/views/domain_30/view_10230.view.lkml"
include: "/views/domain_31/view_10231.view.lkml"
include: "/views/domain_32/view_10232.view.lkml"

explore: explore_3409 {
  label: "Explore Explore 3409"
  description: "Comprehensive analytics explore joining base view_10228 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10228
  
  always_filter: {
    filters: [view_10228.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10228.created_at_date: "7 days"]
    unless: [view_10228.id, view_10228.status]
  }

  join: view_10230 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10228.user_id} = ${view_10230.id} ;;
    required_joins: []
  }

  join: view_10231 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10228.account_id} = ${view_10231.account_id} ;;
    required_joins: [view_10230]
  }

  join: view_10232 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10228.category} = ${view_10232.category} ;;
  }

  access_filter: {
    field: view_10228.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10228.is_deleted} = false ;;
}
