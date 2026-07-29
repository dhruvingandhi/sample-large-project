# Explore: explore_0444
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01333.view.lkml"
include: "/views/domain_35/view_01335.view.lkml"
include: "/views/domain_36/view_01336.view.lkml"
include: "/views/domain_37/view_01337.view.lkml"

explore: explore_0444 {
  label: "Explore Explore 0444"
  description: "Comprehensive analytics explore joining base view_01333 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01333
  
  always_filter: {
    filters: [view_01333.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01333.created_at_date: "7 days"]
    unless: [view_01333.id, view_01333.status]
  }

  join: view_01335 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01333.user_id} = ${view_01335.id} ;;
    required_joins: []
  }

  join: view_01336 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01333.account_id} = ${view_01336.account_id} ;;
    required_joins: [view_01335]
  }

  join: view_01337 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01333.category} = ${view_01337.category} ;;
  }

  access_filter: {
    field: view_01333.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01333.is_deleted} = false ;;
}
