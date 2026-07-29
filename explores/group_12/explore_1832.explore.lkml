# Explore: explore_1832
# Auto-generated LookML Explore File

include: "/views/domain_47/view_05497.view.lkml"
include: "/views/domain_49/view_05499.view.lkml"
include: "/views/domain_50/view_05500.view.lkml"
include: "/views/domain_01/view_05501.view.lkml"

explore: explore_1832 {
  label: "Explore Explore 1832"
  description: "Comprehensive analytics explore joining base view_05497 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05497
  
  always_filter: {
    filters: [view_05497.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05497.created_at_date: "7 days"]
    unless: [view_05497.id, view_05497.status]
  }

  join: view_05499 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05497.user_id} = ${view_05499.id} ;;
    required_joins: []
  }

  join: view_05500 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05497.account_id} = ${view_05500.account_id} ;;
    required_joins: [view_05499]
  }

  join: view_05501 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05497.category} = ${view_05501.category} ;;
  }

  access_filter: {
    field: view_05497.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05497.is_deleted} = false ;;
}
