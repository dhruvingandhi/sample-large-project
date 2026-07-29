# Explore: explore_2187
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06562.view.lkml"
include: "/views/domain_14/view_06564.view.lkml"
include: "/views/domain_15/view_06565.view.lkml"
include: "/views/domain_16/view_06566.view.lkml"

explore: explore_2187 {
  label: "Explore Explore 2187"
  description: "Comprehensive analytics explore joining base view_06562 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06562
  
  always_filter: {
    filters: [view_06562.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06562.created_at_date: "7 days"]
    unless: [view_06562.id, view_06562.status]
  }

  join: view_06564 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06562.user_id} = ${view_06564.id} ;;
    required_joins: []
  }

  join: view_06565 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06562.account_id} = ${view_06565.account_id} ;;
    required_joins: [view_06564]
  }

  join: view_06566 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06562.category} = ${view_06566.category} ;;
  }

  access_filter: {
    field: view_06562.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06562.is_deleted} = false ;;
}
