# Explore: explore_1655
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04966.view.lkml"
include: "/views/domain_18/view_04968.view.lkml"
include: "/views/domain_19/view_04969.view.lkml"
include: "/views/domain_20/view_04970.view.lkml"

explore: explore_1655 {
  label: "Explore Explore 1655"
  description: "Comprehensive analytics explore joining base view_04966 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04966
  
  always_filter: {
    filters: [view_04966.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04966.created_at_date: "7 days"]
    unless: [view_04966.id, view_04966.status]
  }

  join: view_04968 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04966.user_id} = ${view_04968.id} ;;
    required_joins: []
  }

  join: view_04969 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04966.account_id} = ${view_04969.account_id} ;;
    required_joins: [view_04968]
  }

  join: view_04970 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04966.category} = ${view_04970.category} ;;
  }

  access_filter: {
    field: view_04966.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04966.is_deleted} = false ;;
}
