# Explore: explore_1187
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03562.view.lkml"
include: "/views/domain_14/view_03564.view.lkml"
include: "/views/domain_15/view_03565.view.lkml"
include: "/views/domain_16/view_03566.view.lkml"

explore: explore_1187 {
  label: "Explore Explore 1187"
  description: "Comprehensive analytics explore joining base view_03562 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03562
  
  always_filter: {
    filters: [view_03562.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03562.created_at_date: "7 days"]
    unless: [view_03562.id, view_03562.status]
  }

  join: view_03564 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03562.user_id} = ${view_03564.id} ;;
    required_joins: []
  }

  join: view_03565 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03562.account_id} = ${view_03565.account_id} ;;
    required_joins: [view_03564]
  }

  join: view_03566 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03562.category} = ${view_03566.category} ;;
  }

  access_filter: {
    field: view_03562.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03562.is_deleted} = false ;;
}
