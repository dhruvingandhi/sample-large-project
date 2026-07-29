# Explore: explore_2587
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07762.view.lkml"
include: "/views/domain_14/view_07764.view.lkml"
include: "/views/domain_15/view_07765.view.lkml"
include: "/views/domain_16/view_07766.view.lkml"

explore: explore_2587 {
  label: "Explore Explore 2587"
  description: "Comprehensive analytics explore joining base view_07762 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07762
  
  always_filter: {
    filters: [view_07762.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07762.created_at_date: "7 days"]
    unless: [view_07762.id, view_07762.status]
  }

  join: view_07764 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07762.user_id} = ${view_07764.id} ;;
    required_joins: []
  }

  join: view_07765 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07762.account_id} = ${view_07765.account_id} ;;
    required_joins: [view_07764]
  }

  join: view_07766 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07762.category} = ${view_07766.category} ;;
  }

  access_filter: {
    field: view_07762.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07762.is_deleted} = false ;;
}
