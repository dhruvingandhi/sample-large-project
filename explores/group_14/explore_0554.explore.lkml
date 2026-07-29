# Explore: explore_0554
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01663.view.lkml"
include: "/views/domain_15/view_01665.view.lkml"
include: "/views/domain_16/view_01666.view.lkml"
include: "/views/domain_17/view_01667.view.lkml"

explore: explore_0554 {
  label: "Explore Explore 0554"
  description: "Comprehensive analytics explore joining base view_01663 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01663
  
  always_filter: {
    filters: [view_01663.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01663.created_at_date: "7 days"]
    unless: [view_01663.id, view_01663.status]
  }

  join: view_01665 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01663.user_id} = ${view_01665.id} ;;
    required_joins: []
  }

  join: view_01666 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01663.account_id} = ${view_01666.account_id} ;;
    required_joins: [view_01665]
  }

  join: view_01667 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01663.category} = ${view_01667.category} ;;
  }

  access_filter: {
    field: view_01663.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01663.is_deleted} = false ;;
}
