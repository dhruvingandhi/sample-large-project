# Explore: explore_3117
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09352.view.lkml"
include: "/views/domain_04/view_09354.view.lkml"
include: "/views/domain_05/view_09355.view.lkml"
include: "/views/domain_06/view_09356.view.lkml"

explore: explore_3117 {
  label: "Explore Explore 3117"
  description: "Comprehensive analytics explore joining base view_09352 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09352
  
  always_filter: {
    filters: [view_09352.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09352.created_at_date: "7 days"]
    unless: [view_09352.id, view_09352.status]
  }

  join: view_09354 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09352.user_id} = ${view_09354.id} ;;
    required_joins: []
  }

  join: view_09355 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09352.account_id} = ${view_09355.account_id} ;;
    required_joins: [view_09354]
  }

  join: view_09356 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09352.category} = ${view_09356.category} ;;
  }

  access_filter: {
    field: view_09352.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09352.is_deleted} = false ;;
}
