# Explore: explore_2849
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08548.view.lkml"
include: "/views/domain_50/view_08550.view.lkml"
include: "/views/domain_01/view_08551.view.lkml"
include: "/views/domain_02/view_08552.view.lkml"

explore: explore_2849 {
  label: "Explore Explore 2849"
  description: "Comprehensive analytics explore joining base view_08548 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08548
  
  always_filter: {
    filters: [view_08548.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08548.created_at_date: "7 days"]
    unless: [view_08548.id, view_08548.status]
  }

  join: view_08550 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08548.user_id} = ${view_08550.id} ;;
    required_joins: []
  }

  join: view_08551 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08548.account_id} = ${view_08551.account_id} ;;
    required_joins: [view_08550]
  }

  join: view_08552 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08548.category} = ${view_08552.category} ;;
  }

  access_filter: {
    field: view_08548.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08548.is_deleted} = false ;;
}
