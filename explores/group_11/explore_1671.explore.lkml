# Explore: explore_1671
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05014.view.lkml"
include: "/views/domain_16/view_05016.view.lkml"
include: "/views/domain_17/view_05017.view.lkml"
include: "/views/domain_18/view_05018.view.lkml"

explore: explore_1671 {
  label: "Explore Explore 1671"
  description: "Comprehensive analytics explore joining base view_05014 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05014
  
  always_filter: {
    filters: [view_05014.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05014.created_at_date: "7 days"]
    unless: [view_05014.id, view_05014.status]
  }

  join: view_05016 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05014.user_id} = ${view_05016.id} ;;
    required_joins: []
  }

  join: view_05017 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05014.account_id} = ${view_05017.account_id} ;;
    required_joins: [view_05016]
  }

  join: view_05018 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05014.category} = ${view_05018.category} ;;
  }

  access_filter: {
    field: view_05014.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05014.is_deleted} = false ;;
}
