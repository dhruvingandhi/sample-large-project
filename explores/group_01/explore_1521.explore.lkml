# Explore: explore_1521
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04564.view.lkml"
include: "/views/domain_16/view_04566.view.lkml"
include: "/views/domain_17/view_04567.view.lkml"
include: "/views/domain_18/view_04568.view.lkml"

explore: explore_1521 {
  label: "Explore Explore 1521"
  description: "Comprehensive analytics explore joining base view_04564 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04564
  
  always_filter: {
    filters: [view_04564.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04564.created_at_date: "7 days"]
    unless: [view_04564.id, view_04564.status]
  }

  join: view_04566 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04564.user_id} = ${view_04566.id} ;;
    required_joins: []
  }

  join: view_04567 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04564.account_id} = ${view_04567.account_id} ;;
    required_joins: [view_04566]
  }

  join: view_04568 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04564.category} = ${view_04568.category} ;;
  }

  access_filter: {
    field: view_04564.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04564.is_deleted} = false ;;
}
