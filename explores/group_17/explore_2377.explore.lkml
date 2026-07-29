# Explore: explore_2377
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07132.view.lkml"
include: "/views/domain_34/view_07134.view.lkml"
include: "/views/domain_35/view_07135.view.lkml"
include: "/views/domain_36/view_07136.view.lkml"

explore: explore_2377 {
  label: "Explore Explore 2377"
  description: "Comprehensive analytics explore joining base view_07132 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07132
  
  always_filter: {
    filters: [view_07132.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07132.created_at_date: "7 days"]
    unless: [view_07132.id, view_07132.status]
  }

  join: view_07134 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07132.user_id} = ${view_07134.id} ;;
    required_joins: []
  }

  join: view_07135 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07132.account_id} = ${view_07135.account_id} ;;
    required_joins: [view_07134]
  }

  join: view_07136 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07132.category} = ${view_07136.category} ;;
  }

  access_filter: {
    field: view_07132.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07132.is_deleted} = false ;;
}
