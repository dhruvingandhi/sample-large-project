# Explore: explore_1283
# Auto-generated LookML Explore File

include: "/views/domain_50/view_03850.view.lkml"
include: "/views/domain_02/view_03852.view.lkml"
include: "/views/domain_03/view_03853.view.lkml"
include: "/views/domain_04/view_03854.view.lkml"

explore: explore_1283 {
  label: "Explore Explore 1283"
  description: "Comprehensive analytics explore joining base view_03850 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03850
  
  always_filter: {
    filters: [view_03850.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03850.created_at_date: "7 days"]
    unless: [view_03850.id, view_03850.status]
  }

  join: view_03852 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03850.user_id} = ${view_03852.id} ;;
    required_joins: []
  }

  join: view_03853 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03850.account_id} = ${view_03853.account_id} ;;
    required_joins: [view_03852]
  }

  join: view_03854 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03850.category} = ${view_03854.category} ;;
  }

  access_filter: {
    field: view_03850.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03850.is_deleted} = false ;;
}
