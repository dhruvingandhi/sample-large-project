# Explore: explore_1385
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04156.view.lkml"
include: "/views/domain_08/view_04158.view.lkml"
include: "/views/domain_09/view_04159.view.lkml"
include: "/views/domain_10/view_04160.view.lkml"

explore: explore_1385 {
  label: "Explore Explore 1385"
  description: "Comprehensive analytics explore joining base view_04156 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04156
  
  always_filter: {
    filters: [view_04156.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04156.created_at_date: "7 days"]
    unless: [view_04156.id, view_04156.status]
  }

  join: view_04158 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04156.user_id} = ${view_04158.id} ;;
    required_joins: []
  }

  join: view_04159 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04156.account_id} = ${view_04159.account_id} ;;
    required_joins: [view_04158]
  }

  join: view_04160 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04156.category} = ${view_04160.category} ;;
  }

  access_filter: {
    field: view_04156.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04156.is_deleted} = false ;;
}
