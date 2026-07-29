# Explore: explore_1151
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03454.view.lkml"
include: "/views/domain_06/view_03456.view.lkml"
include: "/views/domain_07/view_03457.view.lkml"
include: "/views/domain_08/view_03458.view.lkml"

explore: explore_1151 {
  label: "Explore Explore 1151"
  description: "Comprehensive analytics explore joining base view_03454 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03454
  
  always_filter: {
    filters: [view_03454.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03454.created_at_date: "7 days"]
    unless: [view_03454.id, view_03454.status]
  }

  join: view_03456 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03454.user_id} = ${view_03456.id} ;;
    required_joins: []
  }

  join: view_03457 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03454.account_id} = ${view_03457.account_id} ;;
    required_joins: [view_03456]
  }

  join: view_03458 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03454.category} = ${view_03458.category} ;;
  }

  access_filter: {
    field: view_03454.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03454.is_deleted} = false ;;
}
