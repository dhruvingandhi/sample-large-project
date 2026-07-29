# Explore: explore_2657
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07972.view.lkml"
include: "/views/domain_24/view_07974.view.lkml"
include: "/views/domain_25/view_07975.view.lkml"
include: "/views/domain_26/view_07976.view.lkml"

explore: explore_2657 {
  label: "Explore Explore 2657"
  description: "Comprehensive analytics explore joining base view_07972 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07972
  
  always_filter: {
    filters: [view_07972.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07972.created_at_date: "7 days"]
    unless: [view_07972.id, view_07972.status]
  }

  join: view_07974 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07972.user_id} = ${view_07974.id} ;;
    required_joins: []
  }

  join: view_07975 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07972.account_id} = ${view_07975.account_id} ;;
    required_joins: [view_07974]
  }

  join: view_07976 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07972.category} = ${view_07976.category} ;;
  }

  access_filter: {
    field: view_07972.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07972.is_deleted} = false ;;
}
