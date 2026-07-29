# Explore: explore_1759
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05278.view.lkml"
include: "/views/domain_30/view_05280.view.lkml"
include: "/views/domain_31/view_05281.view.lkml"
include: "/views/domain_32/view_05282.view.lkml"

explore: explore_1759 {
  label: "Explore Explore 1759"
  description: "Comprehensive analytics explore joining base view_05278 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05278
  
  always_filter: {
    filters: [view_05278.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05278.created_at_date: "7 days"]
    unless: [view_05278.id, view_05278.status]
  }

  join: view_05280 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05278.user_id} = ${view_05280.id} ;;
    required_joins: []
  }

  join: view_05281 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05278.account_id} = ${view_05281.account_id} ;;
    required_joins: [view_05280]
  }

  join: view_05282 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05278.category} = ${view_05282.category} ;;
  }

  access_filter: {
    field: view_05278.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05278.is_deleted} = false ;;
}
