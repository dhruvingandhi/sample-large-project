# Explore: explore_3979
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11938.view.lkml"
include: "/views/domain_40/view_11940.view.lkml"
include: "/views/domain_41/view_11941.view.lkml"
include: "/views/domain_42/view_11942.view.lkml"

explore: explore_3979 {
  label: "Explore Explore 3979"
  description: "Comprehensive analytics explore joining base view_11938 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11938
  
  always_filter: {
    filters: [view_11938.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11938.created_at_date: "7 days"]
    unless: [view_11938.id, view_11938.status]
  }

  join: view_11940 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11938.user_id} = ${view_11940.id} ;;
    required_joins: []
  }

  join: view_11941 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11938.account_id} = ${view_11941.account_id} ;;
    required_joins: [view_11940]
  }

  join: view_11942 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11938.category} = ${view_11942.category} ;;
  }

  access_filter: {
    field: view_11938.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11938.is_deleted} = false ;;
}
