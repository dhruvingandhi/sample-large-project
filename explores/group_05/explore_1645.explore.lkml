# Explore: explore_1645
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04936.view.lkml"
include: "/views/domain_38/view_04938.view.lkml"
include: "/views/domain_39/view_04939.view.lkml"
include: "/views/domain_40/view_04940.view.lkml"

explore: explore_1645 {
  label: "Explore Explore 1645"
  description: "Comprehensive analytics explore joining base view_04936 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04936
  
  always_filter: {
    filters: [view_04936.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04936.created_at_date: "7 days"]
    unless: [view_04936.id, view_04936.status]
  }

  join: view_04938 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04936.user_id} = ${view_04938.id} ;;
    required_joins: []
  }

  join: view_04939 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04936.account_id} = ${view_04939.account_id} ;;
    required_joins: [view_04938]
  }

  join: view_04940 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04936.category} = ${view_04940.category} ;;
  }

  access_filter: {
    field: view_04936.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04936.is_deleted} = false ;;
}
