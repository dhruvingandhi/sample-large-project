# Explore: explore_0617
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01852.view.lkml"
include: "/views/domain_04/view_01854.view.lkml"
include: "/views/domain_05/view_01855.view.lkml"
include: "/views/domain_06/view_01856.view.lkml"

explore: explore_0617 {
  label: "Explore Explore 0617"
  description: "Comprehensive analytics explore joining base view_01852 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01852
  
  always_filter: {
    filters: [view_01852.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01852.created_at_date: "7 days"]
    unless: [view_01852.id, view_01852.status]
  }

  join: view_01854 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01852.user_id} = ${view_01854.id} ;;
    required_joins: []
  }

  join: view_01855 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01852.account_id} = ${view_01855.account_id} ;;
    required_joins: [view_01854]
  }

  join: view_01856 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01852.category} = ${view_01856.category} ;;
  }

  access_filter: {
    field: view_01852.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01852.is_deleted} = false ;;
}
