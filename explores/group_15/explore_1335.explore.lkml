# Explore: explore_1335
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04006.view.lkml"
include: "/views/domain_08/view_04008.view.lkml"
include: "/views/domain_09/view_04009.view.lkml"
include: "/views/domain_10/view_04010.view.lkml"

explore: explore_1335 {
  label: "Explore Explore 1335"
  description: "Comprehensive analytics explore joining base view_04006 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04006
  
  always_filter: {
    filters: [view_04006.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04006.created_at_date: "7 days"]
    unless: [view_04006.id, view_04006.status]
  }

  join: view_04008 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04006.user_id} = ${view_04008.id} ;;
    required_joins: []
  }

  join: view_04009 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04006.account_id} = ${view_04009.account_id} ;;
    required_joins: [view_04008]
  }

  join: view_04010 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04006.category} = ${view_04010.category} ;;
  }

  access_filter: {
    field: view_04006.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04006.is_deleted} = false ;;
}
