# Explore: explore_1309
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03928.view.lkml"
include: "/views/domain_30/view_03930.view.lkml"
include: "/views/domain_31/view_03931.view.lkml"
include: "/views/domain_32/view_03932.view.lkml"

explore: explore_1309 {
  label: "Explore Explore 1309"
  description: "Comprehensive analytics explore joining base view_03928 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03928
  
  always_filter: {
    filters: [view_03928.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03928.created_at_date: "7 days"]
    unless: [view_03928.id, view_03928.status]
  }

  join: view_03930 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03928.user_id} = ${view_03930.id} ;;
    required_joins: []
  }

  join: view_03931 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03928.account_id} = ${view_03931.account_id} ;;
    required_joins: [view_03930]
  }

  join: view_03932 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03928.category} = ${view_03932.category} ;;
  }

  access_filter: {
    field: view_03928.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03928.is_deleted} = false ;;
}
