# Explore: explore_3391
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10174.view.lkml"
include: "/views/domain_26/view_10176.view.lkml"
include: "/views/domain_27/view_10177.view.lkml"
include: "/views/domain_28/view_10178.view.lkml"

explore: explore_3391 {
  label: "Explore Explore 3391"
  description: "Comprehensive analytics explore joining base view_10174 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10174
  
  always_filter: {
    filters: [view_10174.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10174.created_at_date: "7 days"]
    unless: [view_10174.id, view_10174.status]
  }

  join: view_10176 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10174.user_id} = ${view_10176.id} ;;
    required_joins: []
  }

  join: view_10177 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10174.account_id} = ${view_10177.account_id} ;;
    required_joins: [view_10176]
  }

  join: view_10178 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10174.category} = ${view_10178.category} ;;
  }

  access_filter: {
    field: view_10174.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10174.is_deleted} = false ;;
}
