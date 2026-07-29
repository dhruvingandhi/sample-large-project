# Explore: explore_3233
# Auto-generated LookML Explore File

include: "/views/domain_50/view_09700.view.lkml"
include: "/views/domain_02/view_09702.view.lkml"
include: "/views/domain_03/view_09703.view.lkml"
include: "/views/domain_04/view_09704.view.lkml"

explore: explore_3233 {
  label: "Explore Explore 3233"
  description: "Comprehensive analytics explore joining base view_09700 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09700
  
  always_filter: {
    filters: [view_09700.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09700.created_at_date: "7 days"]
    unless: [view_09700.id, view_09700.status]
  }

  join: view_09702 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09700.user_id} = ${view_09702.id} ;;
    required_joins: []
  }

  join: view_09703 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09700.account_id} = ${view_09703.account_id} ;;
    required_joins: [view_09702]
  }

  join: view_09704 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09700.category} = ${view_09704.category} ;;
  }

  access_filter: {
    field: view_09700.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09700.is_deleted} = false ;;
}
