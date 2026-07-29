# Explore: explore_1658
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04975.view.lkml"
include: "/views/domain_27/view_04977.view.lkml"
include: "/views/domain_28/view_04978.view.lkml"
include: "/views/domain_29/view_04979.view.lkml"

explore: explore_1658 {
  label: "Explore Explore 1658"
  description: "Comprehensive analytics explore joining base view_04975 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04975
  
  always_filter: {
    filters: [view_04975.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04975.created_at_date: "7 days"]
    unless: [view_04975.id, view_04975.status]
  }

  join: view_04977 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04975.user_id} = ${view_04977.id} ;;
    required_joins: []
  }

  join: view_04978 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04975.account_id} = ${view_04978.account_id} ;;
    required_joins: [view_04977]
  }

  join: view_04979 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04975.category} = ${view_04979.category} ;;
  }

  access_filter: {
    field: view_04975.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04975.is_deleted} = false ;;
}
