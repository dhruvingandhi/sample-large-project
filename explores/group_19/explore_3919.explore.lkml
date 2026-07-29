# Explore: explore_3919
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11758.view.lkml"
include: "/views/domain_10/view_11760.view.lkml"
include: "/views/domain_11/view_11761.view.lkml"
include: "/views/domain_12/view_11762.view.lkml"

explore: explore_3919 {
  label: "Explore Explore 3919"
  description: "Comprehensive analytics explore joining base view_11758 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11758
  
  always_filter: {
    filters: [view_11758.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11758.created_at_date: "7 days"]
    unless: [view_11758.id, view_11758.status]
  }

  join: view_11760 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11758.user_id} = ${view_11760.id} ;;
    required_joins: []
  }

  join: view_11761 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11758.account_id} = ${view_11761.account_id} ;;
    required_joins: [view_11760]
  }

  join: view_11762 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11758.category} = ${view_11762.category} ;;
  }

  access_filter: {
    field: view_11758.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11758.is_deleted} = false ;;
}
