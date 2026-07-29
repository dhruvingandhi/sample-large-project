# Explore: explore_1849
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05548.view.lkml"
include: "/views/domain_50/view_05550.view.lkml"
include: "/views/domain_01/view_05551.view.lkml"
include: "/views/domain_02/view_05552.view.lkml"

explore: explore_1849 {
  label: "Explore Explore 1849"
  description: "Comprehensive analytics explore joining base view_05548 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05548
  
  always_filter: {
    filters: [view_05548.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05548.created_at_date: "7 days"]
    unless: [view_05548.id, view_05548.status]
  }

  join: view_05550 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05548.user_id} = ${view_05550.id} ;;
    required_joins: []
  }

  join: view_05551 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05548.account_id} = ${view_05551.account_id} ;;
    required_joins: [view_05550]
  }

  join: view_05552 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05548.category} = ${view_05552.category} ;;
  }

  access_filter: {
    field: view_05548.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05548.is_deleted} = false ;;
}
