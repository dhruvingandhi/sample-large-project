# Explore: explore_1587
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04762.view.lkml"
include: "/views/domain_14/view_04764.view.lkml"
include: "/views/domain_15/view_04765.view.lkml"
include: "/views/domain_16/view_04766.view.lkml"

explore: explore_1587 {
  label: "Explore Explore 1587"
  description: "Comprehensive analytics explore joining base view_04762 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04762
  
  always_filter: {
    filters: [view_04762.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04762.created_at_date: "7 days"]
    unless: [view_04762.id, view_04762.status]
  }

  join: view_04764 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04762.user_id} = ${view_04764.id} ;;
    required_joins: []
  }

  join: view_04765 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04762.account_id} = ${view_04765.account_id} ;;
    required_joins: [view_04764]
  }

  join: view_04766 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04762.category} = ${view_04766.category} ;;
  }

  access_filter: {
    field: view_04762.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04762.is_deleted} = false ;;
}
