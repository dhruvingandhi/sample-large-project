# Explore: explore_1870
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05611.view.lkml"
include: "/views/domain_13/view_05613.view.lkml"
include: "/views/domain_14/view_05614.view.lkml"
include: "/views/domain_15/view_05615.view.lkml"

explore: explore_1870 {
  label: "Explore Explore 1870"
  description: "Comprehensive analytics explore joining base view_05611 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05611
  
  always_filter: {
    filters: [view_05611.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05611.created_at_date: "7 days"]
    unless: [view_05611.id, view_05611.status]
  }

  join: view_05613 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05611.user_id} = ${view_05613.id} ;;
    required_joins: []
  }

  join: view_05614 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05611.account_id} = ${view_05614.account_id} ;;
    required_joins: [view_05613]
  }

  join: view_05615 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05611.category} = ${view_05615.category} ;;
  }

  access_filter: {
    field: view_05611.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05611.is_deleted} = false ;;
}
