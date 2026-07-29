# Explore: explore_3313
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09940.view.lkml"
include: "/views/domain_42/view_09942.view.lkml"
include: "/views/domain_43/view_09943.view.lkml"
include: "/views/domain_44/view_09944.view.lkml"

explore: explore_3313 {
  label: "Explore Explore 3313"
  description: "Comprehensive analytics explore joining base view_09940 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09940
  
  always_filter: {
    filters: [view_09940.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09940.created_at_date: "7 days"]
    unless: [view_09940.id, view_09940.status]
  }

  join: view_09942 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09940.user_id} = ${view_09942.id} ;;
    required_joins: []
  }

  join: view_09943 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09940.account_id} = ${view_09943.account_id} ;;
    required_joins: [view_09942]
  }

  join: view_09944 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09940.category} = ${view_09944.category} ;;
  }

  access_filter: {
    field: view_09940.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09940.is_deleted} = false ;;
}
