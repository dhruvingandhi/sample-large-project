# Explore: explore_0919
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02758.view.lkml"
include: "/views/domain_10/view_02760.view.lkml"
include: "/views/domain_11/view_02761.view.lkml"
include: "/views/domain_12/view_02762.view.lkml"

explore: explore_0919 {
  label: "Explore Explore 0919"
  description: "Comprehensive analytics explore joining base view_02758 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02758
  
  always_filter: {
    filters: [view_02758.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02758.created_at_date: "7 days"]
    unless: [view_02758.id, view_02758.status]
  }

  join: view_02760 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02758.user_id} = ${view_02760.id} ;;
    required_joins: []
  }

  join: view_02761 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02758.account_id} = ${view_02761.account_id} ;;
    required_joins: [view_02760]
  }

  join: view_02762 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02758.category} = ${view_02762.category} ;;
  }

  access_filter: {
    field: view_02758.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02758.is_deleted} = false ;;
}
