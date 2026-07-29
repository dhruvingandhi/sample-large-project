# Explore: explore_1409
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04228.view.lkml"
include: "/views/domain_30/view_04230.view.lkml"
include: "/views/domain_31/view_04231.view.lkml"
include: "/views/domain_32/view_04232.view.lkml"

explore: explore_1409 {
  label: "Explore Explore 1409"
  description: "Comprehensive analytics explore joining base view_04228 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04228
  
  always_filter: {
    filters: [view_04228.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04228.created_at_date: "7 days"]
    unless: [view_04228.id, view_04228.status]
  }

  join: view_04230 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04228.user_id} = ${view_04230.id} ;;
    required_joins: []
  }

  join: view_04231 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04228.account_id} = ${view_04231.account_id} ;;
    required_joins: [view_04230]
  }

  join: view_04232 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04228.category} = ${view_04232.category} ;;
  }

  access_filter: {
    field: view_04228.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04228.is_deleted} = false ;;
}
