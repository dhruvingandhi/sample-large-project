# Explore: explore_0473
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01420.view.lkml"
include: "/views/domain_22/view_01422.view.lkml"
include: "/views/domain_23/view_01423.view.lkml"
include: "/views/domain_24/view_01424.view.lkml"

explore: explore_0473 {
  label: "Explore Explore 0473"
  description: "Comprehensive analytics explore joining base view_01420 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01420
  
  always_filter: {
    filters: [view_01420.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01420.created_at_date: "7 days"]
    unless: [view_01420.id, view_01420.status]
  }

  join: view_01422 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01420.user_id} = ${view_01422.id} ;;
    required_joins: []
  }

  join: view_01423 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01420.account_id} = ${view_01423.account_id} ;;
    required_joins: [view_01422]
  }

  join: view_01424 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01420.category} = ${view_01424.category} ;;
  }

  access_filter: {
    field: view_01420.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01420.is_deleted} = false ;;
}
