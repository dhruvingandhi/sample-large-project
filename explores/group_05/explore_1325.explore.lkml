# Explore: explore_1325
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03976.view.lkml"
include: "/views/domain_28/view_03978.view.lkml"
include: "/views/domain_29/view_03979.view.lkml"
include: "/views/domain_30/view_03980.view.lkml"

explore: explore_1325 {
  label: "Explore Explore 1325"
  description: "Comprehensive analytics explore joining base view_03976 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03976
  
  always_filter: {
    filters: [view_03976.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03976.created_at_date: "7 days"]
    unless: [view_03976.id, view_03976.status]
  }

  join: view_03978 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03976.user_id} = ${view_03978.id} ;;
    required_joins: []
  }

  join: view_03979 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03976.account_id} = ${view_03979.account_id} ;;
    required_joins: [view_03978]
  }

  join: view_03980 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03976.category} = ${view_03980.category} ;;
  }

  access_filter: {
    field: view_03976.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03976.is_deleted} = false ;;
}
