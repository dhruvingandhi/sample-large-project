# Explore: explore_0989
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02968.view.lkml"
include: "/views/domain_20/view_02970.view.lkml"
include: "/views/domain_21/view_02971.view.lkml"
include: "/views/domain_22/view_02972.view.lkml"

explore: explore_0989 {
  label: "Explore Explore 0989"
  description: "Comprehensive analytics explore joining base view_02968 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02968
  
  always_filter: {
    filters: [view_02968.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02968.created_at_date: "7 days"]
    unless: [view_02968.id, view_02968.status]
  }

  join: view_02970 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02968.user_id} = ${view_02970.id} ;;
    required_joins: []
  }

  join: view_02971 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02968.account_id} = ${view_02971.account_id} ;;
    required_joins: [view_02970]
  }

  join: view_02972 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02968.category} = ${view_02972.category} ;;
  }

  access_filter: {
    field: view_02968.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02968.is_deleted} = false ;;
}
