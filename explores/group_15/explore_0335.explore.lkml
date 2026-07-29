# Explore: explore_0335
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01006.view.lkml"
include: "/views/domain_08/view_01008.view.lkml"
include: "/views/domain_09/view_01009.view.lkml"
include: "/views/domain_10/view_01010.view.lkml"

explore: explore_0335 {
  label: "Explore Explore 0335"
  description: "Comprehensive analytics explore joining base view_01006 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01006
  
  always_filter: {
    filters: [view_01006.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01006.created_at_date: "7 days"]
    unless: [view_01006.id, view_01006.status]
  }

  join: view_01008 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01006.user_id} = ${view_01008.id} ;;
    required_joins: []
  }

  join: view_01009 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01006.account_id} = ${view_01009.account_id} ;;
    required_joins: [view_01008]
  }

  join: view_01010 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01006.category} = ${view_01010.category} ;;
  }

  access_filter: {
    field: view_01006.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01006.is_deleted} = false ;;
}
