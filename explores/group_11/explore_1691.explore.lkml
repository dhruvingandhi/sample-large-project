# Explore: explore_1691
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05074.view.lkml"
include: "/views/domain_26/view_05076.view.lkml"
include: "/views/domain_27/view_05077.view.lkml"
include: "/views/domain_28/view_05078.view.lkml"

explore: explore_1691 {
  label: "Explore Explore 1691"
  description: "Comprehensive analytics explore joining base view_05074 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05074
  
  always_filter: {
    filters: [view_05074.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05074.created_at_date: "7 days"]
    unless: [view_05074.id, view_05074.status]
  }

  join: view_05076 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05074.user_id} = ${view_05076.id} ;;
    required_joins: []
  }

  join: view_05077 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05074.account_id} = ${view_05077.account_id} ;;
    required_joins: [view_05076]
  }

  join: view_05078 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05074.category} = ${view_05078.category} ;;
  }

  access_filter: {
    field: view_05074.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05074.is_deleted} = false ;;
}
