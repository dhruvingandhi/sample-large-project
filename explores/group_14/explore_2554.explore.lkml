# Explore: explore_2554
# Auto-generated LookML Explore File

include: "/views/domain_13/view_07663.view.lkml"
include: "/views/domain_15/view_07665.view.lkml"
include: "/views/domain_16/view_07666.view.lkml"
include: "/views/domain_17/view_07667.view.lkml"

explore: explore_2554 {
  label: "Explore Explore 2554"
  description: "Comprehensive analytics explore joining base view_07663 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07663
  
  always_filter: {
    filters: [view_07663.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07663.created_at_date: "7 days"]
    unless: [view_07663.id, view_07663.status]
  }

  join: view_07665 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07663.user_id} = ${view_07665.id} ;;
    required_joins: []
  }

  join: view_07666 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07663.account_id} = ${view_07666.account_id} ;;
    required_joins: [view_07665]
  }

  join: view_07667 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07663.category} = ${view_07667.category} ;;
  }

  access_filter: {
    field: view_07663.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07663.is_deleted} = false ;;
}
