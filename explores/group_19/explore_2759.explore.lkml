# Explore: explore_2759
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08278.view.lkml"
include: "/views/domain_30/view_08280.view.lkml"
include: "/views/domain_31/view_08281.view.lkml"
include: "/views/domain_32/view_08282.view.lkml"

explore: explore_2759 {
  label: "Explore Explore 2759"
  description: "Comprehensive analytics explore joining base view_08278 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08278
  
  always_filter: {
    filters: [view_08278.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08278.created_at_date: "7 days"]
    unless: [view_08278.id, view_08278.status]
  }

  join: view_08280 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08278.user_id} = ${view_08280.id} ;;
    required_joins: []
  }

  join: view_08281 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08278.account_id} = ${view_08281.account_id} ;;
    required_joins: [view_08280]
  }

  join: view_08282 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08278.category} = ${view_08282.category} ;;
  }

  access_filter: {
    field: view_08278.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08278.is_deleted} = false ;;
}
