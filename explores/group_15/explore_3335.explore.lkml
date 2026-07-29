# Explore: explore_3335
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10006.view.lkml"
include: "/views/domain_08/view_10008.view.lkml"
include: "/views/domain_09/view_10009.view.lkml"
include: "/views/domain_10/view_10010.view.lkml"

explore: explore_3335 {
  label: "Explore Explore 3335"
  description: "Comprehensive analytics explore joining base view_10006 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10006
  
  always_filter: {
    filters: [view_10006.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10006.created_at_date: "7 days"]
    unless: [view_10006.id, view_10006.status]
  }

  join: view_10008 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10006.user_id} = ${view_10008.id} ;;
    required_joins: []
  }

  join: view_10009 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10006.account_id} = ${view_10009.account_id} ;;
    required_joins: [view_10008]
  }

  join: view_10010 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10006.category} = ${view_10010.category} ;;
  }

  access_filter: {
    field: view_10006.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10006.is_deleted} = false ;;
}
